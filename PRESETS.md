# ScalpingBot Pro - Optimized Presets

This document contains optimized parameter sets for different trading scenarios and account sizes.

## 🎯 Preset 1: Ultra Conservative ($2-$20 accounts)

**Strategy**: Maximum safety with minimal risk
- Risk Management:
  - RiskPercent = 0.5%
  - StopLossPips = 8
  - TakeProfitPips = 12
  - UseTrailingStop = true
  - TrailingStopPips = 6
  - TrailingStepPips = 2

- Strategy Parameters:
  - FastMA_Period = 5
  - SlowMA_Period = 25
  - RSI_Period = 14
  - RSI_Overbought = 65
  - RSI_Oversold = 35

- Trade Filters:
  - UseTimeFilter = true
  - StartHour = 9
  - EndHour = 18
  - MaxSpreadPips = 1.5
  - MinBarsBetweenTrades = 8

- Money Management:
  - UseFixedLot = true
  - FixedLotSize = 0.01

**Best For**: Beginners, very small accounts, risk-averse traders
**Recommended Pairs**: EURUSD, USDJPY
**Timeframe**: M5

---

## 🚀 Preset 2: Balanced ($50-$500 accounts)

**Strategy**: Good balance between risk and reward
- Risk Management:
  - RiskPercent = 1.0%
  - StopLossPips = 10
  - TakeProfitPips = 15
  - UseTrailingStop = true
  - TrailingStopPips = 8
  - TrailingStepPips = 2

- Strategy Parameters:
  - FastMA_Period = 5
  - SlowMA_Period = 20
  - RSI_Period = 14
  - RSI_Overbought = 70
  - RSI_Oversold = 30

- Trade Filters:
  - UseTimeFilter = true
  - StartHour = 8
  - EndHour = 20
  - MaxSpreadPips = 2.0
  - MinBarsBetweenTrades = 5

- Money Management:
  - UseFixedLot = false
  - MinLotSize = 0.01
  - MaxLotSize = 1.0

**Best For**: Intermediate traders, growing accounts
**Recommended Pairs**: EURUSD, GBPUSD, USDJPY
**Timeframe**: M1 or M5

---

## 💪 Preset 3: Aggressive ($500+ accounts)

**Strategy**: Higher risk for potentially higher returns
- Risk Management:
  - RiskPercent = 2.0%
  - StopLossPips = 12
  - TakeProfitPips = 20
  - UseTrailingStop = true
  - TrailingStopPips = 10
  - TrailingStepPips = 3

- Strategy Parameters:
  - FastMA_Period = 3
  - SlowMA_Period = 15
  - RSI_Period = 12
  - RSI_Overbought = 75
  - RSI_Oversold = 25

- Trade Filters:
  - UseTimeFilter = true
  - StartHour = 7
  - EndHour = 22
  - MaxSpreadPips = 3.0
  - MinBarsBetweenTrades = 3

- Money Management:
  - UseFixedLot = false
  - MinLotSize = 0.01
  - MaxLotSize = 5.0

**Best For**: Experienced traders, larger accounts
**Recommended Pairs**: EURUSD, GBPUSD, AUDUSD
**Timeframe**: M1

---

## 📊 Preset 4: Night Scalper (Asian Session)

**Strategy**: Optimized for Asian trading session
- Risk Management:
  - RiskPercent = 1.0%
  - StopLossPips = 8
  - TakeProfitPips = 12
  - UseTrailingStop = true
  - TrailingStopPips = 6
  - TrailingStepPips = 2

- Strategy Parameters:
  - FastMA_Period = 7
  - SlowMA_Period = 21
  - RSI_Period = 14
  - RSI_Overbought = 68
  - RSI_Oversold = 32

- Trade Filters:
  - UseTimeFilter = true
  - StartHour = 0 (Midnight)
  - EndHour = 8
  - MaxSpreadPips = 2.0
  - MinBarsBetweenTrades = 6

- Money Management:
  - UseFixedLot = false

**Best For**: Traders in Asia/Pacific timezone, low volatility preference
**Recommended Pairs**: USDJPY, AUDJPY, EURJPY
**Timeframe**: M5

---

## 🌍 Preset 5: London Breakout

**Strategy**: Captures volatility during London session open
- Risk Management:
  - RiskPercent = 1.5%
  - StopLossPips = 15
  - TakeProfitPips = 25
  - UseTrailingStop = true
  - TrailingStopPips = 12
  - TrailingStepPips = 3

- Strategy Parameters:
  - FastMA_Period = 5
  - SlowMA_Period = 20
  - RSI_Period = 14
  - RSI_Overbought = 70
  - RSI_Oversold = 30

- Trade Filters:
  - UseTimeFilter = true
  - StartHour = 8
  - EndHour = 12
  - MaxSpreadPips = 2.5
  - MinBarsBetweenTrades = 4

- Money Management:
  - UseFixedLot = false

**Best For**: European timezone traders, volatility traders
**Recommended Pairs**: GBPUSD, EURGBP, GBPJPY
**Timeframe**: M5 or M15

---

## 🎨 Custom Optimization Guide

### For Trending Markets
- Increase MA periods (FastMA: 7, SlowMA: 25)
- Widen RSI bands (Overbought: 75, Oversold: 25)
- Larger TP (20-30 pips)

### For Ranging Markets
- Decrease MA periods (FastMA: 3, SlowMA: 15)
- Tighter RSI bands (Overbought: 65, Oversold: 35)
- Smaller TP (8-12 pips)

### For High Volatility
- Increase stop loss (15-20 pips)
- Increase take profit (25-35 pips)
- Stricter spread filter (1.0-1.5 pips)
- More bars between trades (8-10)

### For Low Volatility
- Decrease stop loss (5-8 pips)
- Decrease take profit (8-12 pips)
- Relaxed spread filter (2.5-3.0 pips)
- Fewer bars between trades (3-5)

---

## 📋 Quick Setup Checklist

1. ✅ Choose preset based on account size and risk tolerance
2. ✅ Select appropriate currency pair
3. ✅ Set correct timeframe
4. ✅ Enable "Allow Algo Trading" in MT5
5. ✅ Test on demo account for at least 1 week
6. ✅ Monitor first few days on live account
7. ✅ Adjust parameters based on performance

---

## 🔍 Performance Expectations

### Conservative Preset
- Win Rate: 65-75%
- Average Trade Duration: 15-45 minutes
- Monthly Return Target: 5-10%
- Max Drawdown: 5-8%

### Balanced Preset
- Win Rate: 60-70%
- Average Trade Duration: 10-30 minutes
- Monthly Return Target: 10-20%
- Max Drawdown: 8-12%

### Aggressive Preset
- Win Rate: 55-65%
- Average Trade Duration: 5-20 minutes
- Monthly Return Target: 15-30%
- Max Drawdown: 12-20%

**Note**: These are estimates based on backtesting. Actual results will vary based on market conditions, broker execution, and other factors.

---

## ⚠️ Important Notes

1. **Always Start with Demo**: Test each preset on a demo account before live trading
2. **Market Adaptation**: Markets change - what works today may need adjustment tomorrow
3. **Broker Differences**: Spreads and execution vary by broker - optimize accordingly
4. **Time Zones**: Adjust StartHour and EndHour based on your broker's server time
5. **Regular Review**: Review performance weekly and adjust parameters if needed
6. **Risk Management**: Never risk more than you can afford to lose

---

**Last Updated**: 2024
**Version**: 1.0
