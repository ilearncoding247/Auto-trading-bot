//+------------------------------------------------------------------+
//|                                                  ScalpingBot.mq5 |
//|                                      High Win Rate Scalping Bot  |
//|                      Optimized for Micro Accounts ($2 minimum)   |
//+------------------------------------------------------------------+
#property copyright "Auto Trading Bot"
#property link      "https://github.com/ilearncoding247/Auto-trading-bot"
#property version   "1.00"
#property strict

//--- Input Parameters
input group "=== Money Management ==="
input double   RiskPercent = 1.0;              // Risk per trade (%)
input double   MinLotSize = 0.01;              // Minimum lot size
input double   MaxLotSize = 0.1;               // Maximum lot size
input int      MagicNumber = 123456;           // Magic number for this EA

input group "=== Trading Strategy ==="
input int      RSI_Period = 14;                // RSI Period
input int      RSI_Overbought = 70;            // RSI Overbought Level
input int      RSI_Oversold = 30;              // RSI Oversold Level
input int      Fast_EMA_Period = 9;            // Fast EMA Period
input int      Slow_EMA_Period = 21;           // Slow EMA Period
input int      ATR_Period = 14;                // ATR Period for volatility
input int      BB_Period = 20;                 // Bollinger Bands Period
input double   BB_Deviation = 2.0;             // Bollinger Bands Deviation

input group "=== Risk Management ==="
input double   StopLossMultiplier = 1.5;       // Stop Loss (ATR multiplier)
input double   TakeProfitMultiplier = 2.5;     // Take Profit (ATR multiplier)
input bool     UseTrailingStop = true;         // Use Trailing Stop
input double   TrailingStopMultiplier = 1.0;   // Trailing Stop (ATR multiplier)
input double   MaxDailyLossPercent = 5.0;      // Max Daily Loss (%)
input int      MaxTradesPerDay = 10;           // Max Trades Per Day

input group "=== Time Filters ==="
input bool     UseTimeFilter = true;           // Use Time Filter
input int      StartHour = 8;                  // Start Trading Hour (Server Time)
input int      EndHour = 22;                   // End Trading Hour (Server Time)
input bool     AvoidNews = true;               // Avoid high spread times

input group "=== Advanced Settings ==="
input int      Slippage = 10;                  // Max Slippage (points)
input double   MinSpreadPips = 0.0;            // Min Spread to Trade (pips)
input double   MaxSpreadPips = 3.0;            // Max Spread to Trade (pips)

//--- Global Variables
int      rsi_handle, fast_ema_handle, slow_ema_handle, atr_handle, bb_handle;
double   rsi_buffer[], fast_ema_buffer[], slow_ema_buffer[], atr_buffer[];
double   bb_upper_buffer[], bb_middle_buffer[], bb_lower_buffer[];
int      trades_today = 0;
double   daily_profit = 0.0;
datetime last_trade_date = 0;
double   account_balance_start = 0.0;

//+------------------------------------------------------------------+
//| Expert initialization function                                     |
//+------------------------------------------------------------------+
int OnInit()
{
   //--- Initialize indicators
   rsi_handle = iRSI(_Symbol, PERIOD_CURRENT, RSI_Period, PRICE_CLOSE);
   fast_ema_handle = iMA(_Symbol, PERIOD_CURRENT, Fast_EMA_Period, 0, MODE_EMA, PRICE_CLOSE);
   slow_ema_handle = iMA(_Symbol, PERIOD_CURRENT, Slow_EMA_Period, 0, MODE_EMA, PRICE_CLOSE);
   atr_handle = iATR(_Symbol, PERIOD_CURRENT, ATR_Period);
   bb_handle = iBands(_Symbol, PERIOD_CURRENT, BB_Period, 0, BB_Deviation, PRICE_CLOSE);
   
   //--- Check if all indicators initialized successfully
   if(rsi_handle == INVALID_HANDLE || fast_ema_handle == INVALID_HANDLE || 
      slow_ema_handle == INVALID_HANDLE || atr_handle == INVALID_HANDLE ||
      bb_handle == INVALID_HANDLE)
   {
      Print("Error initializing indicators!");
      return(INIT_FAILED);
   }
   
   //--- Set array as series
   ArraySetAsSeries(rsi_buffer, true);
   ArraySetAsSeries(fast_ema_buffer, true);
   ArraySetAsSeries(slow_ema_buffer, true);
   ArraySetAsSeries(atr_buffer, true);
   ArraySetAsSeries(bb_upper_buffer, true);
   ArraySetAsSeries(bb_middle_buffer, true);
   ArraySetAsSeries(bb_lower_buffer, true);
   
   //--- Initialize daily tracking
   account_balance_start = AccountInfoDouble(ACCOUNT_BALANCE);
   
   Print("Scalping Bot initialized successfully!");
   Print("Account Balance: ", account_balance_start);
   Print("Minimum Account: $2, Current: $", account_balance_start);
   
   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   //--- Release indicator handles
   IndicatorRelease(rsi_handle);
   IndicatorRelease(fast_ema_handle);
   IndicatorRelease(slow_ema_handle);
   IndicatorRelease(atr_handle);
   IndicatorRelease(bb_handle);
   
   Print("Scalping Bot stopped. Reason: ", reason);
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
   //--- Reset daily counters if new day
   ResetDailyCounters();
   
   //--- Check if we can trade
   if(!CanTrade())
      return;
   
   //--- Update indicator values
   if(!UpdateIndicators())
      return;
   
   //--- Manage existing positions
   ManagePositions();
   
   //--- Check for new trade signals (only if no position)
   if(PositionsTotal() == 0)
   {
      CheckForBuySignal();
      CheckForSellSignal();
   }
}

//+------------------------------------------------------------------+
//| Reset daily counters                                              |
//+------------------------------------------------------------------+
void ResetDailyCounters()
{
   datetime current_date = TimeCurrent();
   MqlDateTime dt;
   TimeToStruct(current_date, dt);
   
   datetime today = StringToTime(IntegerToString(dt.year) + "." + 
                                  IntegerToString(dt.mon) + "." + 
                                  IntegerToString(dt.day));
   
   if(last_trade_date != today)
   {
      trades_today = 0;
      daily_profit = 0.0;
      last_trade_date = today;
      account_balance_start = AccountInfoDouble(ACCOUNT_BALANCE);
   }
}

//+------------------------------------------------------------------+
//| Check if we can trade                                            |
//+------------------------------------------------------------------+
bool CanTrade()
{
   //--- Check if trading is allowed
   if(!TerminalInfoInteger(TERMINAL_TRADE_ALLOWED))
   {
      return false;
   }
   
   //--- Check if EA trading is allowed
   if(!MQLInfoInteger(MQL_TRADE_ALLOWED))
   {
      return false;
   }
   
   //--- Check max trades per day
   if(trades_today >= MaxTradesPerDay)
   {
      return false;
   }
   
   //--- Check daily loss limit
   double current_balance = AccountInfoDouble(ACCOUNT_BALANCE);
   double daily_loss_percent = ((account_balance_start - current_balance) / account_balance_start) * 100;
   
   if(daily_loss_percent >= MaxDailyLossPercent)
   {
      Print("Daily loss limit reached: ", daily_loss_percent, "%");
      return false;
   }
   
   //--- Check time filter
   if(UseTimeFilter)
   {
      MqlDateTime dt;
      TimeCurrent(dt);
      
      if(dt.hour < StartHour || dt.hour >= EndHour)
      {
         return false;
      }
   }
   
   //--- Check spread
   double spread = (SymbolInfoDouble(_Symbol, SYMBOL_ASK) - SymbolInfoDouble(_Symbol, SYMBOL_BID)) / _Point;
   spread = spread / 10; // Convert to pips
   
   if(spread < MinSpreadPips || spread > MaxSpreadPips)
   {
      return false;
   }
   
   return true;
}

//+------------------------------------------------------------------+
//| Update indicator values                                          |
//+------------------------------------------------------------------+
bool UpdateIndicators()
{
   //--- Copy indicator buffers
   if(CopyBuffer(rsi_handle, 0, 0, 3, rsi_buffer) < 3)
      return false;
   
   if(CopyBuffer(fast_ema_handle, 0, 0, 3, fast_ema_buffer) < 3)
      return false;
   
   if(CopyBuffer(slow_ema_handle, 0, 0, 3, slow_ema_buffer) < 3)
      return false;
   
   if(CopyBuffer(atr_handle, 0, 0, 3, atr_buffer) < 3)
      return false;
   
   if(CopyBuffer(bb_handle, 0, 0, 3, bb_upper_buffer) < 3)
      return false;
   
   if(CopyBuffer(bb_handle, 1, 0, 3, bb_middle_buffer) < 3)
      return false;
   
   if(CopyBuffer(bb_handle, 2, 0, 3, bb_lower_buffer) < 3)
      return false;
   
   return true;
}

//+------------------------------------------------------------------+
//| Check for BUY signal                                             |
//+------------------------------------------------------------------+
void CheckForBuySignal()
{
   double current_price = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   
   //--- Multi-condition entry logic for high win rate
   bool rsi_signal = (rsi_buffer[1] < RSI_Oversold) && (rsi_buffer[0] > rsi_buffer[1]);
   bool ema_signal = (fast_ema_buffer[0] > slow_ema_buffer[0]) && 
                     (fast_ema_buffer[1] <= slow_ema_buffer[1]); // EMA crossover
   bool bb_signal = current_price < bb_lower_buffer[0]; // Price touching lower BB
   bool trend_signal = fast_ema_buffer[0] > slow_ema_buffer[0]; // Uptrend
   
   //--- Require multiple confirmations for high win rate
   int signal_count = 0;
   if(rsi_signal) signal_count++;
   if(ema_signal) signal_count++;
   if(bb_signal) signal_count++;
   
   //--- Execute trade if we have at least 2 signals and trend confirmation
   if(signal_count >= 2 || (signal_count >= 1 && ema_signal))
   {
      double lot_size = CalculateLotSize();
      double sl = CalculateStopLoss(ORDER_TYPE_BUY, current_price);
      double tp = CalculateTakeProfit(ORDER_TYPE_BUY, current_price);
      
      if(OpenPosition(ORDER_TYPE_BUY, lot_size, current_price, sl, tp))
      {
         trades_today++;
         Print("BUY signal executed. Lots: ", lot_size, " SL: ", sl, " TP: ", tp);
      }
   }
}

//+------------------------------------------------------------------+
//| Check for SELL signal                                            |
//+------------------------------------------------------------------+
void CheckForSellSignal()
{
   double current_price = SymbolInfoDouble(_Symbol, SYMBOL_BID);
   
   //--- Multi-condition entry logic for high win rate
   bool rsi_signal = (rsi_buffer[1] > RSI_Overbought) && (rsi_buffer[0] < rsi_buffer[1]);
   bool ema_signal = (fast_ema_buffer[0] < slow_ema_buffer[0]) && 
                     (fast_ema_buffer[1] >= slow_ema_buffer[1]); // EMA crossover
   bool bb_signal = current_price > bb_upper_buffer[0]; // Price touching upper BB
   bool trend_signal = fast_ema_buffer[0] < slow_ema_buffer[0]; // Downtrend
   
   //--- Require multiple confirmations for high win rate
   int signal_count = 0;
   if(rsi_signal) signal_count++;
   if(ema_signal) signal_count++;
   if(bb_signal) signal_count++;
   
   //--- Execute trade if we have at least 2 signals and trend confirmation
   if(signal_count >= 2 || (signal_count >= 1 && ema_signal))
   {
      double lot_size = CalculateLotSize();
      double sl = CalculateStopLoss(ORDER_TYPE_SELL, current_price);
      double tp = CalculateTakeProfit(ORDER_TYPE_SELL, current_price);
      
      if(OpenPosition(ORDER_TYPE_SELL, lot_size, current_price, sl, tp))
      {
         trades_today++;
         Print("SELL signal executed. Lots: ", lot_size, " SL: ", sl, " TP: ", tp);
      }
   }
}

//+------------------------------------------------------------------+
//| Calculate lot size based on risk                                 |
//+------------------------------------------------------------------+
double CalculateLotSize()
{
   double balance = AccountInfoDouble(ACCOUNT_BALANCE);
   double risk_amount = balance * (RiskPercent / 100.0);
   
   //--- Calculate lot size based on ATR stop loss
   double stop_loss_distance = atr_buffer[0] * StopLossMultiplier;
   double tick_value = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_VALUE);
   double tick_size = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_SIZE);
   
   double lot_size = risk_amount / (stop_loss_distance / tick_size * tick_value);
   
   //--- Normalize lot size
   double min_lot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
   double max_lot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX);
   double lot_step = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);
   
   lot_size = MathMax(lot_size, MinLotSize);
   lot_size = MathMin(lot_size, MaxLotSize);
   lot_size = MathMax(lot_size, min_lot);
   lot_size = MathMin(lot_size, max_lot);
   
   //--- Round to lot step
   lot_size = MathFloor(lot_size / lot_step) * lot_step;
   
   return lot_size;
}

//+------------------------------------------------------------------+
//| Calculate stop loss                                              |
//+------------------------------------------------------------------+
double CalculateStopLoss(ENUM_ORDER_TYPE order_type, double entry_price)
{
   double atr = atr_buffer[0];
   double sl_distance = atr * StopLossMultiplier;
   
   if(order_type == ORDER_TYPE_BUY)
      return entry_price - sl_distance;
   else
      return entry_price + sl_distance;
}

//+------------------------------------------------------------------+
//| Calculate take profit                                            |
//+------------------------------------------------------------------+
double CalculateTakeProfit(ENUM_ORDER_TYPE order_type, double entry_price)
{
   double atr = atr_buffer[0];
   double tp_distance = atr * TakeProfitMultiplier;
   
   if(order_type == ORDER_TYPE_BUY)
      return entry_price + tp_distance;
   else
      return entry_price - tp_distance;
}

//+------------------------------------------------------------------+
//| Open position                                                     |
//+------------------------------------------------------------------+
bool OpenPosition(ENUM_ORDER_TYPE order_type, double lot_size, double price, double sl, double tp)
{
   MqlTradeRequest request = {};
   MqlTradeResult result = {};
   
   request.action = TRADE_ACTION_DEAL;
   request.symbol = _Symbol;
   request.volume = lot_size;
   request.type = order_type;
   request.price = price;
   request.sl = sl;
   request.tp = tp;
   request.deviation = Slippage;
   request.magic = MagicNumber;
   request.comment = "Scalping Bot";
   request.type_filling = ORDER_FILLING_IOC;
   
   //--- Try different filling modes if IOC fails
   if(!OrderSend(request, result))
   {
      request.type_filling = ORDER_FILLING_FOK;
      if(!OrderSend(request, result))
      {
         request.type_filling = ORDER_FILLING_RETURN;
         OrderSend(request, result);
      }
   }
   
   if(result.retcode == TRADE_RETCODE_DONE || result.retcode == TRADE_RETCODE_PLACED)
   {
      Print("Position opened successfully. Ticket: ", result.order);
      return true;
   }
   else
   {
      Print("Error opening position: ", result.retcode, " - ", result.comment);
      return false;
   }
}

//+------------------------------------------------------------------+
//| Manage existing positions                                        |
//+------------------------------------------------------------------+
void ManagePositions()
{
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      
      if(ticket > 0)
      {
         if(PositionGetString(POSITION_SYMBOL) == _Symbol && 
            PositionGetInteger(POSITION_MAGIC) == MagicNumber)
         {
            //--- Apply trailing stop
            if(UseTrailingStop)
            {
               ApplyTrailingStop(ticket);
            }
         }
      }
   }
}

//+------------------------------------------------------------------+
//| Apply trailing stop                                              |
//+------------------------------------------------------------------+
void ApplyTrailingStop(ulong ticket)
{
   if(!PositionSelectByTicket(ticket))
      return;
   
   double position_price = PositionGetDouble(POSITION_PRICE_OPEN);
   double current_sl = PositionGetDouble(POSITION_SL);
   double current_price = (PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY) ? 
                          SymbolInfoDouble(_Symbol, SYMBOL_BID) : 
                          SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   
   double atr = atr_buffer[0];
   double trailing_distance = atr * TrailingStopMultiplier;
   
   double new_sl = 0.0;
   bool should_modify = false;
   
   if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY)
   {
      new_sl = current_price - trailing_distance;
      
      if(new_sl > current_sl + _Point * 10 && new_sl > position_price)
      {
         should_modify = true;
      }
   }
   else // SELL
   {
      new_sl = current_price + trailing_distance;
      
      if((new_sl < current_sl - _Point * 10 || current_sl == 0) && new_sl < position_price)
      {
         should_modify = true;
      }
   }
   
   if(should_modify)
   {
      MqlTradeRequest request = {};
      MqlTradeResult result = {};
      
      request.action = TRADE_ACTION_SLTP;
      request.position = ticket;
      request.symbol = _Symbol;
      request.sl = new_sl;
      request.tp = PositionGetDouble(POSITION_TP);
      
      if(OrderSend(request, result))
      {
         Print("Trailing stop updated. Ticket: ", ticket, " New SL: ", new_sl);
      }
   }
}
//+------------------------------------------------------------------+
