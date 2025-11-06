# MT5 Professional Scalping Bot

A high-performance auto-trading Expert Advisor (EA) for MetaTrader 5 designed for scalping with a high win rate strategy. Works with accounts as small as $2.

## 🎯 Features

- **Multi-Indicator Strategy**: Combines Moving Averages, RSI, and ATR for accurate signals
- **High Win Rate**: Optimized for quick profits with tight stop losses
- **Smart Risk Management**: Automatic position sizing based on account balance
- **Profit Target**: Set a target balance and bot pauses/resumes automatically
- **Trailing Stop**: Locks in profits as the market moves in your favor
- **Trade Filters**: Time-based and spread filters to avoid unfavorable conditions
- **Money Management**: Percentage-based risk or fixed lot size options
- **Low Capital Requirement**: Works with accounts starting from $2
- **Fully Customizable**: All parameters can be adjusted to suit your trading style

## 📊 Strategy Overview

The bot uses a multi-indicator approach:

1. **Trend Detection**: Fast and Slow Moving Averages identify the trend direction
2. **Momentum Confirmation**: RSI confirms the strength of the move
3. **Entry Timing**: Price action patterns trigger precise entry points
4. **Risk Control**: Fixed stop loss and take profit with optional trailing stop

### Default Settings
- **Risk per trade**: 1% of account balance
- **Stop Loss**: 10 pips
- **Take Profit**: 15 pips (1.5:1 reward/risk ratio)
- **Trailing Stop**: 8 pips with 2 pip step
- **Fast MA**: 5-period EMA
- **Slow MA**: 20-period EMA
- **RSI**: 14-period (Overbought: 70, Oversold: 30)

## 🚀 Installation Guide

### Step 1: Download the EA
1. Download the `ScalpingBot_Pro.mq5` file from this repository
2. Locate your MetaTrader 5 data folder:
   - Open MT5
   - Click `File` → `Open Data Folder`

### Step 2: Install the EA
1. Navigate to `MQL5` → `Experts` folder in the data directory
2. Copy `ScalpingBot_Pro.mq5` into this folder
3. Restart MetaTrader 5 or right-click in Navigator and select "Refresh"

### Step 3: Compile the EA (if needed)
1. In MT5, open MetaEditor (F4 or Tools → MetaEditor)
2. Open `ScalpingBot_Pro.mq5`
3. Click `Compile` button (F7)
4. Check for any errors in the Toolbox window

### Step 4: Attach to Chart
1. Open a chart of your preferred currency pair (recommended: EURUSD, GBPUSD, USDJPY)
2. Recommended timeframe: M1 (1-minute) or M5 (5-minute) for scalping
3. Drag `ScalpingBot_Pro` from the Navigator onto the chart
4. Enable "Allow Algo Trading" button in the toolbar

## ⚙️ Configuration

### Risk Management Parameters
- **RiskPercent**: Risk per trade as percentage of balance (default: 1%)
- **StopLossPips**: Stop loss in pips (default: 10)
- **TakeProfitPips**: Take profit in pips (default: 15)
- **UseTrailingStop**: Enable/disable trailing stop (default: true)
- **TrailingStopPips**: Trailing stop distance in pips (default: 8)

### Strategy Parameters
- **FastMA_Period**: Fast moving average period (default: 5)
- **SlowMA_Period**: Slow moving average period (default: 20)
- **MA_Method**: Moving average calculation method (default: EMA)
- **RSI_Period**: RSI indicator period (default: 14)
- **RSI_Overbought**: RSI overbought level (default: 70)
- **RSI_Oversold**: RSI oversold level (default: 30)

### Trade Filters
- **UseTimeFilter**: Enable trading only during specific hours (default: true)
- **StartHour**: Start trading hour in server time (default: 8)
- **EndHour**: Stop trading hour in server time (default: 20)
- **MaxSpreadPips**: Maximum allowed spread in pips (default: 2)
- **MinBarsBetweenTrades**: Minimum bars between trades (default: 5)

### Money Management
- **MinLotSize**: Minimum lot size (default: 0.01)
- **MaxLotSize**: Maximum lot size (default: 10.0)
- **UseFixedLot**: Use fixed lot instead of risk-based (default: false)
- **FixedLotSize**: Fixed lot size if enabled (default: 0.01)

### Profit Target
- **UseProfitTarget**: Enable profit target feature (default: false)
- **ProfitTargetAmount**: Target account balance in dollars (default: 20000)
- **AutoPauseAtTarget**: Automatically pause trading when target is reached (default: true)
- **AutoResumeBelow**: Automatically resume trading when balance drops below target (default: true)

## 💡 Recommended Settings for Different Account Sizes

### $2 - $10 Account
```
RiskPercent = 2%
StopLossPips = 10
TakeProfitPips = 15
UseFixedLot = true
FixedLotSize = 0.01
```

### $50 - $100 Account
```
RiskPercent = 1.5%
StopLossPips = 10
TakeProfitPips = 15
UseFixedLot = false
```

### $500+ Account
```
RiskPercent = 1%
StopLossPips = 12
TakeProfitPips = 18
UseFixedLot = false
```

## 📈 Best Practices

1. **Start with Demo Account**: Test the bot on a demo account first to understand its behavior
2. **Choose Liquid Pairs**: Use major currency pairs (EURUSD, GBPUSD, USDJPY) for better execution
3. **Low Spread Broker**: Choose a broker with low spreads (ideally < 1 pip for major pairs)
4. **VPS Recommended**: Use a VPS to ensure 24/7 operation without interruptions
5. **Monitor Initially**: Watch the bot for the first few days to ensure it's working as expected
6. **Adjust Parameters**: Optimize settings based on market conditions and your risk tolerance
7. **Avoid News Time**: Consider disabling the bot during major news events
8. **Use Profit Targets**: Set realistic profit targets to protect your gains and manage drawdown

## 💰 Using the Profit Target Feature

The profit target feature allows you to set a target account balance. When reached, the bot automatically pauses trading to protect your profits.

### How It Works:
1. **Set Your Target**: Enable `UseProfitTarget` and set `ProfitTargetAmount` (e.g., $20,000)
2. **Auto Pause**: When your balance reaches the target, trading automatically pauses
3. **Auto Resume**: If balance drops below the target (due to withdrawals or losses on other EAs), trading resumes automatically
4. **Position Management**: The bot continues to manage any open positions even when paused

### Example Configuration:
```
UseProfitTarget = true
ProfitTargetAmount = 20000    // Target: $20,000
AutoPauseAtTarget = true      // Pause when target reached
AutoResumeBelow = true        // Resume if balance drops below target
```

### Use Cases:
- **Daily/Weekly Goals**: Set a daily profit target (e.g., current balance + $100)
- **Account Milestones**: Pause at key milestones to reassess strategy
- **Profit Protection**: Lock in gains during volatile market conditions
- **Drawdown Management**: Prevent giving back profits during unfavorable conditions

### Notes:
- The bot checks the target on each new bar
- Existing open positions are still managed (trailing stop, SL, TP)
- The pause/resume status is displayed in the Experts log
- You can manually disable the bot at any time via MT5 interface

## 🎓 Understanding the Strategy

### Entry Conditions for BUY
1. Fast MA is above Slow MA (uptrend)
2. RSI is not overbought (< 70)
3. RSI is rising (momentum confirmation)
4. Price crosses above Fast MA OR strong bullish momentum detected

### Entry Conditions for SELL
1. Fast MA is below Slow MA (downtrend)
2. RSI is not oversold (> 30)
3. RSI is falling (momentum confirmation)
4. Price crosses below Fast MA OR strong bearish momentum detected

### Exit Strategy
- **Stop Loss**: Fixed stop loss at entry
- **Take Profit**: Fixed take profit at entry
- **Trailing Stop**: Moves stop loss to lock in profits as trade moves favorably

## ⚠️ Risk Disclaimer

**IMPORTANT**: Trading forex carries substantial risk. This EA is provided for educational purposes. Past performance does not guarantee future results. Never trade with money you cannot afford to lose.

- Start with small amounts and low risk
- Always use proper risk management
- Test thoroughly on demo before live trading
- Monitor your trades regularly
- Understand that losses are part of trading

## 📊 Performance Tips

1. **Optimize for Your Broker**: Each broker has different spreads and execution. Test and optimize parameters.
2. **Market Conditions**: The bot performs best in trending markets with normal volatility
3. **Timeframe Selection**: M1 and M5 are recommended for scalping
4. **Regular Monitoring**: Check the bot's performance weekly and adjust if needed
5. **Avoid Over-Optimization**: Don't curve-fit parameters to past data

## 🔧 Troubleshooting

### EA Not Trading
- Check if "Allow Algo Trading" is enabled
- Verify trade filters (time, spread) are not too restrictive
- Ensure account has sufficient margin
- Check if there are already open positions

### Errors in Journal
- "Invalid stops" - Adjust stop loss/take profit to broker's minimum
- "Not enough money" - Reduce lot size or risk percentage
- "Trade context busy" - Normal, EA will retry
- "Invalid price" - Check broker's quote precision

### Poor Performance
- Adjust risk parameters for market volatility
- Optimize MA and RSI periods for your pair/timeframe
- Enable time filter to avoid ranging markets
- Consider stricter spread filter

## 📞 Support

For questions or issues:
1. Check the Troubleshooting section
2. Review MT5 Expert journal for error messages
3. Test on demo account first
4. Verify all parameters are within broker's limits

## 📝 Version History

- **v1.0** (2024) - Initial release
  - Multi-indicator scalping strategy
  - Dynamic position sizing
  - Trailing stop functionality
  - Comprehensive trade filters
  - Support for minimum $2 accounts

## 📄 License

This project is open source and available for educational purposes. Use at your own risk.

## 🌟 Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve the bot.

---

**Remember**: Successful trading requires patience, discipline, and proper risk management. This bot is a tool to assist you, not a guaranteed profit machine. Always trade responsibly!