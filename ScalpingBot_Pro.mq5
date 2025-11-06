//+------------------------------------------------------------------+
//|                                              ScalpingBot_Pro.mq5 |
//|                                  Copyright 2024, Auto Trading Bot |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Auto Trading Bot"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property description "Professional Scalping Bot with High Win Rate Strategy"
#property description "Minimum Account: $2"
#property description "Strategy: Multi-Indicator Trend Following + RSI + Moving Averages"

#include <Trade\Trade.mqh>

//--- Input Parameters
input group "=== Risk Management ==="
input double RiskPercent = 1.0;              // Risk per trade (%)
input double StopLossPips = 10.0;            // Stop Loss in pips
input double TakeProfitPips = 15.0;          // Take Profit in pips
input bool UseTrailingStop = true;           // Use Trailing Stop
input double TrailingStopPips = 8.0;         // Trailing Stop in pips
input double TrailingStepPips = 2.0;         // Trailing Step in pips

input group "=== Strategy Parameters ==="
input int FastMA_Period = 5;                  // Fast MA Period
input int SlowMA_Period = 20;                 // Slow MA Period
input ENUM_MA_METHOD MA_Method = MODE_EMA;    // MA Method
input int RSI_Period = 14;                    // RSI Period
input int RSI_Overbought = 70;                // RSI Overbought Level
input int RSI_Oversold = 30;                  // RSI Oversold Level
input int ATR_Period = 14;                    // ATR Period for volatility

input group "=== Trade Filters ==="
input bool UseTimeFilter = true;             // Use Time Filter
input int StartHour = 8;                      // Start Hour (Server Time)
input int EndHour = 20;                       // End Hour (Server Time)
input double MaxSpreadPips = 2.0;             // Maximum Spread (pips)
input int MinBarsBetweenTrades = 5;          // Min Bars Between Trades

input group "=== Money Management ==="
input double MinLotSize = 0.01;              // Minimum Lot Size
input double MaxLotSize = 10.0;              // Maximum Lot Size
input bool UseFixedLot = false;              // Use Fixed Lot Size
input double FixedLotSize = 0.01;            // Fixed Lot Size

input group "=== Expert Settings ==="
input int MagicNumber = 123456;              // Magic Number
input string ExpertComment = "ScalpingBot";  // Expert Comment

//--- Constants
#define POINTS_PER_PIP 10           // Points per pip for most forex pairs
#define INDICATOR_BUFFER_SIZE 3     // Number of indicator values to copy

//--- Global Variables
CTrade trade;
int fastMA_Handle, slowMA_Handle, rsi_Handle, atr_Handle;
double fastMA[], slowMA[], rsi[], atr[];
datetime lastBarTime = 0;
int barsSinceLastTrade = 999;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
   //--- Setup trade object
   trade.SetExpertMagicNumber(MagicNumber);
   trade.SetDeviationInPoints(10);
   trade.SetTypeFilling(ORDER_FILLING_FOK);
   trade.SetAsyncMode(false);
   
   //--- Create indicator handles
   fastMA_Handle = iMA(_Symbol, PERIOD_CURRENT, FastMA_Period, 0, MA_Method, PRICE_CLOSE);
   slowMA_Handle = iMA(_Symbol, PERIOD_CURRENT, SlowMA_Period, 0, MA_Method, PRICE_CLOSE);
   rsi_Handle = iRSI(_Symbol, PERIOD_CURRENT, RSI_Period, PRICE_CLOSE);
   atr_Handle = iATR(_Symbol, PERIOD_CURRENT, ATR_Period);
   
   if(fastMA_Handle == INVALID_HANDLE || slowMA_Handle == INVALID_HANDLE || 
      rsi_Handle == INVALID_HANDLE || atr_Handle == INVALID_HANDLE)
   {
      Print("Error creating indicators");
      return(INIT_FAILED);
   }
   
   //--- Set array as series
   ArraySetAsSeries(fastMA, true);
   ArraySetAsSeries(slowMA, true);
   ArraySetAsSeries(rsi, true);
   ArraySetAsSeries(atr, true);
   
   Print("ScalpingBot Pro initialized successfully");
   Print("Minimum account requirement: $2");
   Print("Strategy: Multi-Indicator Scalping");
   
   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   //--- Release indicator handles
   IndicatorRelease(fastMA_Handle);
   IndicatorRelease(slowMA_Handle);
   IndicatorRelease(rsi_Handle);
   IndicatorRelease(atr_Handle);
   
   Print("ScalpingBot Pro stopped. Reason: ", reason);
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
   //--- Check for new bar
   if(!IsNewBar())
      return;
   
   //--- Update bars since last trade counter
   barsSinceLastTrade++;
   
   //--- Copy indicator data
   if(!UpdateIndicators())
      return;
   
   //--- Check if we already have a position
   if(HasOpenPosition())
   {
      ManageOpenPosition();
      return;
   }
   
   //--- Check trading conditions
   if(!CheckTradingConditions())
      return;
   
   //--- Check for buy signal
   if(CheckBuySignal())
   {
      OpenBuyTrade();
      return;
   }
   
   //--- Check for sell signal
   if(CheckSellSignal())
   {
      OpenSellTrade();
      return;
   }
}

//+------------------------------------------------------------------+
//| Check if new bar has formed                                      |
//+------------------------------------------------------------------+
bool IsNewBar()
{
   datetime currentBarTime = iTime(_Symbol, PERIOD_CURRENT, 0);
   if(currentBarTime != lastBarTime)
   {
      lastBarTime = currentBarTime;
      return true;
   }
   return false;
}

//+------------------------------------------------------------------+
//| Update all indicators                                            |
//+------------------------------------------------------------------+
bool UpdateIndicators()
{
   if(CopyBuffer(fastMA_Handle, 0, 0, INDICATOR_BUFFER_SIZE, fastMA) <= 0) return false;
   if(CopyBuffer(slowMA_Handle, 0, 0, INDICATOR_BUFFER_SIZE, slowMA) <= 0) return false;
   if(CopyBuffer(rsi_Handle, 0, 0, INDICATOR_BUFFER_SIZE, rsi) <= 0) return false;
   if(CopyBuffer(atr_Handle, 0, 0, INDICATOR_BUFFER_SIZE, atr) <= 0) return false;
   
   return true;
}

//+------------------------------------------------------------------+
//| Check if there's an open position                                |
//+------------------------------------------------------------------+
bool HasOpenPosition()
{
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      if(PositionGetSymbol(i) == _Symbol && 
         PositionGetInteger(POSITION_MAGIC) == MagicNumber)
      {
         return true;
      }
   }
   return false;
}

//+------------------------------------------------------------------+
//| Check general trading conditions                                 |
//+------------------------------------------------------------------+
bool CheckTradingConditions()
{
   //--- Check time filter
   if(UseTimeFilter)
   {
      MqlDateTime dt;
      TimeToStruct(TimeCurrent(), dt);
      if(dt.hour < StartHour || dt.hour >= EndHour)
         return false;
   }
   
   //--- Check spread
   double spread = (SymbolInfoDouble(_Symbol, SYMBOL_ASK) - 
                    SymbolInfoDouble(_Symbol, SYMBOL_BID)) / _Point;
   if(spread > MaxSpreadPips * POINTS_PER_PIP)
      return false;
   
   //--- Check minimum bars between trades
   if(barsSinceLastTrade < MinBarsBetweenTrades)
      return false;
   
   return true;
}

//+------------------------------------------------------------------+
//| Check for buy signal                                             |
//+------------------------------------------------------------------+
bool CheckBuySignal()
{
   //--- Trend condition: Fast MA above Slow MA
   if(fastMA[0] <= slowMA[0])
      return false;
   
   //--- Momentum condition: RSI not overbought and rising
   if(rsi[0] >= RSI_Overbought)
      return false;
   
   if(rsi[0] <= rsi[1])
      return false;
   
   //--- Price action: Price crossing above Fast MA
   double close1 = iClose(_Symbol, PERIOD_CURRENT, 1);
   double close2 = iClose(_Symbol, PERIOD_CURRENT, 2);
   
   if(close2 <= fastMA[2] && close1 > fastMA[1])
      return true;
   
   //--- Alternative: Strong bullish momentum
   if(fastMA[0] > fastMA[1] && fastMA[1] > fastMA[2] && 
      rsi[0] > 50 && rsi[0] > rsi[1])
      return true;
   
   return false;
}

//+------------------------------------------------------------------+
//| Check for sell signal                                            |
//+------------------------------------------------------------------+
bool CheckSellSignal()
{
   //--- Trend condition: Fast MA below Slow MA
   if(fastMA[0] >= slowMA[0])
      return false;
   
   //--- Momentum condition: RSI not oversold and falling
   if(rsi[0] <= RSI_Oversold)
      return false;
   
   if(rsi[0] >= rsi[1])
      return false;
   
   //--- Price action: Price crossing below Fast MA
   double close1 = iClose(_Symbol, PERIOD_CURRENT, 1);
   double close2 = iClose(_Symbol, PERIOD_CURRENT, 2);
   
   if(close2 >= fastMA[2] && close1 < fastMA[1])
      return true;
   
   //--- Alternative: Strong bearish momentum
   if(fastMA[0] < fastMA[1] && fastMA[1] < fastMA[2] && 
      rsi[0] < 50 && rsi[0] < rsi[1])
      return true;
   
   return false;
}

//+------------------------------------------------------------------+
//| Convert pips to points                                            |
//+------------------------------------------------------------------+
double PipsToPoints(double pips)
{
   return pips * POINTS_PER_PIP * _Point;
}

//+------------------------------------------------------------------+
//| Calculate lot size based on risk                                 |
//+------------------------------------------------------------------+
double CalculateLotSize()
{
   if(UseFixedLot)
      return NormalizeLot(FixedLotSize);
   
   double accountBalance = AccountInfoDouble(ACCOUNT_BALANCE);
   double riskAmount = accountBalance * RiskPercent / 100.0;
   
   double tickValue = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_VALUE);
   double tickSize = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_SIZE);
   
   //--- Validate tick size to prevent division by zero
   if(tickSize <= 0)
   {
      Print("Error: Invalid tick size. Using minimum lot.");
      return MinLotSize;
   }
   
   double slPips = StopLossPips * POINTS_PER_PIP; // Convert to points
   
   double lotSize = riskAmount / (slPips * tickValue / tickSize);
   
   //--- Normalize and limit lot size
   lotSize = NormalizeLot(lotSize);
   lotSize = MathMax(lotSize, MinLotSize);
   lotSize = MathMin(lotSize, MaxLotSize);
   
   return lotSize;
}

//+------------------------------------------------------------------+
//| Normalize lot size                                               |
//+------------------------------------------------------------------+
double NormalizeLot(double lot)
{
   double minLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
   double maxLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX);
   double lotStep = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);
   
   lot = MathMax(lot, minLot);
   lot = MathMin(lot, maxLot);
   lot = MathRound(lot / lotStep) * lotStep;
   
   return lot;
}

//+------------------------------------------------------------------+
//| Open buy trade                                                   |
//+------------------------------------------------------------------+
void OpenBuyTrade()
{
   double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   double sl = ask - PipsToPoints(StopLossPips);
   double tp = ask + PipsToPoints(TakeProfitPips);
   double lot = CalculateLotSize();
   
   if(trade.Buy(lot, _Symbol, ask, sl, tp, ExpertComment))
   {
      Print("Buy order opened: Lot=", lot, " SL=", sl, " TP=", tp);
      barsSinceLastTrade = 0;
   }
   else
   {
      Print("Error opening buy order: ", GetLastError());
   }
}

//+------------------------------------------------------------------+
//| Open sell trade                                                  |
//+------------------------------------------------------------------+
void OpenSellTrade()
{
   double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
   double sl = bid + PipsToPoints(StopLossPips);
   double tp = bid - PipsToPoints(TakeProfitPips);
   double lot = CalculateLotSize();
   
   if(trade.Sell(lot, _Symbol, bid, sl, tp, ExpertComment))
   {
      Print("Sell order opened: Lot=", lot, " SL=", sl, " TP=", tp);
      barsSinceLastTrade = 0;
   }
   else
   {
      Print("Error opening sell order: ", GetLastError());
   }
}

//+------------------------------------------------------------------+
//| Manage open position (trailing stop)                            |
//+------------------------------------------------------------------+
void ManageOpenPosition()
{
   if(!UseTrailingStop)
      return;
   
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      if(PositionGetSymbol(i) != _Symbol)
         continue;
      
      if(PositionGetInteger(POSITION_MAGIC) != MagicNumber)
         continue;
      
      ulong ticket = PositionGetInteger(POSITION_TICKET);
      double posOpenPrice = PositionGetDouble(POSITION_PRICE_OPEN);
      double posSL = PositionGetDouble(POSITION_SL);
      double posTP = PositionGetDouble(POSITION_TP);
      long posType = PositionGetInteger(POSITION_TYPE);
      
      if(posType == POSITION_TYPE_BUY)
      {
         double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
         double trailDistance = PipsToPoints(TrailingStopPips);
         double newSL = bid - trailDistance;
         
         // Only trail if price is in profit by at least trailing distance
         if(bid > posOpenPrice + trailDistance)
         {
            // Move SL up if new SL is higher than current by at least step amount
            if(posSL < newSL - PipsToPoints(TrailingStepPips) || posSL == 0)
            {
               trade.PositionModify(ticket, newSL, posTP);
            }
         }
      }
      else if(posType == POSITION_TYPE_SELL)
      {
         double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
         double trailDistance = PipsToPoints(TrailingStopPips);
         double newSL = ask + trailDistance;
         
         // Only trail if price is in profit by at least trailing distance
         if(ask < posOpenPrice - trailDistance)
         {
            // Move SL down if new SL is lower than current by at least step amount
            if(newSL < posSL - PipsToPoints(TrailingStepPips) || posSL == 0)
            {
               trade.PositionModify(ticket, newSL, posTP);
            }
         }
      }
   }
}
//+------------------------------------------------------------------+
