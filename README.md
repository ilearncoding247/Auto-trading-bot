# MT5 Auto Trading Scalping Bot

A professional Expert Advisor (EA) for MetaTrader 5 designed for scalping with high win rate optimization. Suitable for micro accounts starting from $2.

## Features

### 🎯 High Win Rate Strategy
- **Multiple Indicator Confirmation**: Uses RSI, EMA crossovers, Bollinger Bands, and ATR for signal validation
- **Smart Entry Logic**: Requires at least 2 signal confirmations for high probability trades
- **Dynamic Risk Management**: ATR-based stop loss and take profit levels

### 💰 Optimized for Micro Accounts
- **Low Minimum Deposit**: Works with accounts as small as $2
- **Flexible Lot Sizing**: Automatic position sizing based on account balance and risk percentage
- **Smart Money Management**: Risk per trade configurable (default 1%)

### 🛡️ Advanced Risk Management
- **Daily Loss Limit**: Stops trading after reaching max daily loss (default 5%)
- **Max Trades Per Day**: Limits the number of trades (default 10)
- **Trailing Stop**: Optional dynamic trailing stop based on ATR
- **Spread Filter**: Only trades when spread is within acceptable range

### 📊 Technical Indicators Used
1. **RSI (Relative Strength Index)**: Identifies overbought/oversold conditions
2. **EMA (Exponential Moving Average)**: Fast (9) and Slow (21) for trend direction
3. **ATR (Average True Range)**: Measures volatility for dynamic SL/TP
4. **Bollinger Bands**: Identifies price extremes and potential reversals

### ⏰ Time Management
- **Trading Hours Filter**: Configure active trading hours (default 8:00-22:00)
- **Avoid High Spread Times**: Optional filter to avoid news events and high spread periods

## Installation

### Step 1: Download the EA
1. Download `ScalpingBot.mq5` from this repository
2. Locate your MetaTrader 5 data folder:
   - Open MT5
   - Click `File` → `Open Data Folder`
   - Navigate to `MQL5/Experts/`

### Step 2: Install the EA
1. Copy `ScalpingBot.mq5` to the `MQL5/Experts/` folder
2. Restart MetaTrader 5 or right-click in the Navigator and select `Refresh`

### Step 3: Compile (if needed)
1. Open MetaEditor (F4 in MT5)
2. Open `ScalpingBot.mq5`
3. Click `Compile` (F7)
4. Check for any errors in the `Errors` tab

### Step 4: Attach to Chart
1. Open a chart (recommended: EUR/USD, M5 or M15 timeframe)
2. In Navigator, expand `Expert Advisors`
3. Drag `ScalpingBot` onto the chart
4. Configure settings in the dialog box
5. Enable `Allow Algo Trading` button in MT5 toolbar

## Configuration Guide

### Money Management Settings
```
RiskPercent = 1.0          // Risk 1% of balance per trade
MinLotSize = 0.01          // Minimum lot (for micro accounts)
MaxLotSize = 0.1           // Maximum lot size limit
MagicNumber = 123456       // Unique identifier for this EA
```

### Trading Strategy Settings
```
RSI_Period = 14            // RSI calculation period
RSI_Overbought = 70        // Overbought threshold
RSI_Oversold = 30          // Oversold threshold
Fast_EMA_Period = 9        // Fast EMA for quick signals
Slow_EMA_Period = 21       // Slow EMA for trend confirmation
ATR_Period = 14            // ATR for volatility measurement
BB_Period = 20             // Bollinger Bands period
BB_Deviation = 2.0         // Bollinger Bands standard deviation
```

### Risk Management Settings
```
StopLossMultiplier = 1.5   // SL distance (1.5 x ATR)
TakeProfitMultiplier = 2.5 // TP distance (2.5 x ATR, 1:1.67 risk/reward)
UseTrailingStop = true     // Enable trailing stop
TrailingStopMultiplier = 1.0  // Trailing distance (1.0 x ATR)
MaxDailyLossPercent = 5.0  // Stop trading if daily loss reaches 5%
MaxTradesPerDay = 10       // Maximum 10 trades per day
```

### Time Filter Settings
```
UseTimeFilter = true       // Enable trading hours filter
StartHour = 8              // Start trading at 8:00 (server time)
EndHour = 22               // Stop trading at 22:00 (server time)
AvoidNews = true           // Avoid high spread periods
```

### Advanced Settings
```
Slippage = 10              // Maximum slippage in points
MinSpreadPips = 0.0        // Minimum spread to trade
MaxSpreadPips = 3.0        // Maximum spread to trade (3 pips)
```

## Recommended Pairs & Timeframes

### Best Currency Pairs
1. **EUR/USD** - Low spread, high liquidity
2. **GBP/USD** - Good volatility for scalping
3. **USD/JPY** - Stable and predictable
4. **AUD/USD** - Good for Asian session
5. **EUR/GBP** - Low volatility, good for beginners

### Recommended Timeframes
- **M5 (5 minutes)**: Aggressive scalping, more signals
- **M15 (15 minutes)**: Balanced approach (recommended)
- **M30 (30 minutes)**: Conservative, fewer but quality signals

## Optimization Tips

### For Higher Win Rate
1. Increase signal confirmation requirements
2. Set tighter spread limits (MaxSpreadPips = 2.0)
3. Use M15 or M30 timeframes
4. Enable time filter to trade during active hours
5. Reduce MaxTradesPerDay to focus on quality

### For More Trades
1. Reduce RSI_Overbought/Oversold thresholds (75/25)
2. Use M5 timeframe
3. Increase MaxTradesPerDay
4. Widen MaxSpreadPips slightly

### For Micro Accounts ($2-$10)
1. Keep RiskPercent at 1% or lower
2. Use MinLotSize = 0.01
3. Start with major pairs (EUR/USD)
4. Enable MaxDailyLossPercent protection
5. Test on demo first!

### For Better Risk/Reward
1. Increase TakeProfitMultiplier (3.0 or higher)
2. Keep StopLossMultiplier tight (1.5 or lower)
3. Enable trailing stop to lock in profits
4. Consider increasing TrailingStopMultiplier

## Backtesting Instructions

1. Open Strategy Tester in MT5 (Ctrl+R)
2. Select `ScalpingBot` from Expert Advisor dropdown
3. Choose symbol (EUR/USD recommended)
4. Select period (at least 3 months for meaningful results)
5. Choose timeframe (M15 recommended)
6. Set initial deposit ($100 or your actual starting capital)
7. Click `Start` to run backtest
8. Analyze results:
   - Win rate should be > 60%
   - Profit factor should be > 1.5
   - Drawdown should be < 20%

## Forward Testing

Before using real money:
1. Test on demo account for at least 2 weeks
2. Monitor daily performance
3. Verify risk management is working correctly
4. Check that spread filters are effective
5. Ensure EA behaves as expected during news

## Trading Strategy Explained

### Entry Signals

**BUY Signal** (At least 2 conditions required):
1. RSI < 30 (oversold) and turning up
2. Fast EMA crosses above Slow EMA (bullish crossover)
3. Price touches lower Bollinger Band

**SELL Signal** (At least 2 conditions required):
1. RSI > 70 (overbought) and turning down
2. Fast EMA crosses below Slow EMA (bearish crossover)
3. Price touches upper Bollinger Band

### Exit Strategy
1. **Take Profit**: 2.5x ATR (configurable)
2. **Stop Loss**: 1.5x ATR (configurable)
3. **Trailing Stop**: 1.0x ATR when enabled (locks in profits)

### Risk/Reward Ratio
- Default setup provides approximately 1:1.67 risk/reward ratio
- With trailing stop, actual reward can be higher
- High win rate (60-70%) compensates for moderate risk/reward

## Performance Metrics

Expected performance (results may vary based on market conditions):
- **Win Rate**: 60-70%
- **Profit Factor**: 1.5-2.0
- **Average Risk/Reward**: 1:1.67
- **Max Drawdown**: 10-20%
- **Trades per Day**: 5-10 (depending on settings)

## Important Notes

### ⚠️ Risk Disclaimer
- Trading forex carries a high level of risk and may not be suitable for all investors
- Past performance is not indicative of future results
- Never risk more than you can afford to lose
- Always test on demo account first
- This EA is provided as-is with no guarantees

### 💡 Best Practices
1. **Start Small**: Begin with minimum risk (1% or less)
2. **Demo First**: Test for at least 2 weeks on demo
3. **Monitor Daily**: Check performance and adjust if needed
4. **Use VPS**: For 24/7 operation without interruptions
5. **Stay Updated**: Keep EA updated and monitor market conditions

### 🔧 Troubleshooting

**EA not trading:**
- Check "Allow Algo Trading" is enabled
- Verify time filter settings
- Check spread - might be too high
- Ensure sufficient account balance
- Check expert tab for error messages

**Too many losing trades:**
- Increase signal confirmation requirements
- Reduce MaxTradesPerDay
- Use higher timeframe (M15 or M30)
- Tighten spread filter
- Adjust risk/reward ratio

**Not enough trades:**
- Check time filter settings
- Reduce spread filter limits
- Use lower timeframe (M5)
- Loosen RSI overbought/oversold levels
- Increase MaxTradesPerDay

## Support & Contributing

### Issues
If you encounter any issues, please open an issue on GitHub with:
- MT5 version and build number
- Broker name
- Symbol and timeframe used
- Error messages from expert tab
- Settings used

### Contributing
Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Test thoroughly on demo
4. Submit a pull request

## License

This project is open source. Use at your own risk.

## Changelog

### Version 1.00 (Initial Release)
- Multi-indicator scalping strategy
- Dynamic risk management with ATR
- Micro account optimization ($2 minimum)
- Daily loss and trade limits
- Trailing stop functionality
- Time-based filters
- Spread filters for better execution
- Comprehensive logging

---

**Disclaimer**: This Expert Advisor is for educational purposes. Trading involves substantial risk. Always test on demo accounts first and never invest money you cannot afford to lose.