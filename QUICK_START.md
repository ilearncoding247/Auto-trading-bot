# Quick Start Guide - MT5 Scalping Bot

## Prerequisites
- MetaTrader 5 installed
- Active MT5 trading account (demo or live)
- Minimum $2 balance (for live account)
- Basic understanding of forex trading

## 5-Minute Setup

### Step 1: Install the EA (2 minutes)
1. Download `ScalpingBot.mq5` from the repository
2. Open MT5 → Press `F4` to open MetaEditor
3. Click `File` → `Open Data Folder`
4. Navigate to `MQL5/Experts/`
5. Copy `ScalpingBot.mq5` here
6. Close and reopen MT5 (or refresh Navigator)

### Step 2: Prepare Your Chart (1 minute)
1. Open a currency pair chart (recommended: EUR/USD)
2. Set timeframe to M15 (15 minutes)
3. Click the "Auto Trading" button in the toolbar to enable algo trading
4. Verify the icon shows "Algo trading is allowed"

### Step 3: Attach the EA (2 minutes)
1. In Navigator panel, expand `Expert Advisors`
2. Find `ScalpingBot`
3. Drag and drop it onto your chart
4. A settings window will appear

### Step 4: Configure Settings (based on account size)

#### For $2-$10 Account (Ultra Micro)
```
RiskPercent = 0.5
MinLotSize = 0.01
MaxLotSize = 0.01
MaxDailyLossPercent = 3.0
MaxTradesPerDay = 5
MaxSpreadPips = 2.0
```

#### For $10-$100 Account (Micro)
```
RiskPercent = 1.0
MinLotSize = 0.01
MaxLotSize = 0.05
MaxDailyLossPercent = 5.0
MaxTradesPerDay = 10
MaxSpreadPips = 2.5
```

#### For $100+ Account (Standard)
```
RiskPercent = 1.0
MinLotSize = 0.01
MaxLotSize = 0.1
MaxDailyLossPercent = 5.0
MaxTradesPerDay = 15
MaxSpreadPips = 3.0
```

5. Click `OK` to apply settings
6. Check the "Allow live trading" checkbox
7. Click `OK` again

### Step 5: Verify It's Running
1. Look for a smiley face icon in the top-right corner of the chart
2. Open the "Experts" tab at the bottom of MT5
3. You should see: "Scalping Bot initialized successfully!"
4. Check the log for your account balance confirmation

## Using Pre-configured Settings Files

We've included two preset configurations:

### Conservative Setup (Recommended for beginners)
1. In EA settings dialog, click `Load`
2. Select `ScalpingBot_Conservative.set`
3. Click `OK`
- Lower risk (1%)
- Tighter spread filter
- Maximum 10 trades per day
- Suitable for $2-$50 accounts

### Aggressive Setup (For experienced traders)
1. In EA settings dialog, click `Load`
2. Select `ScalpingBot_Aggressive.set`
3. Click `OK`
- Higher risk (2%)
- More trading opportunities
- Maximum 20 trades per day
- Suitable for $100+ accounts

## First Day Checklist

### Before Market Open
- [ ] EA is attached to chart with smiley face icon
- [ ] "Algo Trading" button is enabled (green)
- [ ] Settings are configured for your account size
- [ ] Time filter is set to your trading hours
- [ ] Demo account if first time using

### During Trading Hours
- [ ] Monitor the "Experts" tab for trade entries
- [ ] Check that trades have appropriate SL and TP
- [ ] Verify lot sizes are appropriate
- [ ] Watch for any error messages

### End of Day
- [ ] Review trades in "History" tab
- [ ] Calculate win rate (winning trades / total trades)
- [ ] Check if daily loss limit was respected
- [ ] Adjust settings if needed for next day

## Understanding the Smiley Face Icon

The icon in the top-right corner of your chart shows the EA status:

| Icon | Meaning |
|------|---------|
| 😊 | EA is running and ready to trade |
| 😐 | EA is running but trading disabled (check settings) |
| No icon | EA is not attached or not running |

## Common First-Time Issues

### "Algo Trading is not allowed"
**Solution**: Click the "Auto Trading" button in the MT5 toolbar

### EA not placing trades
**Possible reasons**:
- Current time outside trading hours (check StartHour/EndHour)
- Spread too high (check MaxSpreadPips setting)
- Daily loss limit reached
- Max trades per day reached
- Not enough account balance

**Solution**: Check the "Experts" tab for specific messages

### Trades closing immediately
**Possible reasons**:
- Stop loss hit (market too volatile)
- Take profit reached (good thing!)
- Spread too wide during execution

**Solution**: Review trade history to see exit reason

### "Not enough money" error
**Solution**: Reduce RiskPercent or use smaller MinLotSize

## Monitoring Your Bot

### Key Metrics to Watch
1. **Win Rate**: Should be 60-70% over time
2. **Profit Factor**: Should be > 1.5
3. **Average Trade Duration**: Typically 15-60 minutes for scalping
4. **Daily Profit/Loss**: Should not exceed MaxDailyLossPercent

### When to Adjust Settings

**If win rate < 50%**:
- Increase signal confirmation requirements
- Use higher timeframe (M15 → M30)
- Tighten spread filter
- Reduce trading frequency

**If not enough trades**:
- Check time filter settings
- Increase MaxTradesPerDay
- Use lower timeframe (M15 → M5)
- Loosen spread filter slightly

**If drawdown > 15%**:
- Reduce RiskPercent
- Enable tighter daily loss limit
- Use trailing stops
- Review recent market conditions

## Best Practices

### For Micro Accounts ($2-$20)
1. Start with 0.5% risk per trade
2. Use only 0.01 lot size
3. Trade major pairs only (EUR/USD, GBP/USD)
4. Set strict daily loss limit (3-5%)
5. Run EA during European/US session overlap

### For Growing Your Account
1. Maintain consistent settings
2. Don't increase risk after winning streaks
3. Compound gradually (reinvest profits monthly)
4. Keep daily risk low (1% or less)
5. Monitor weekly, not trade-by-trade

### For 24/7 Operation
1. Consider using a VPS (Virtual Private Server)
2. Ensure stable internet connection
3. Keep MT5 running continuously
4. Monitor daily for errors or issues
5. Have backup power supply if possible

## Advanced Tips

### Optimizing for Your Broker
- Test different spread limits based on typical spreads
- Adjust slippage setting based on execution quality
- Consider trading hours when spreads are lowest
- Check broker's allowed minimum lot size

### Multiple Timeframe Strategy
- Run on M15 for balanced approach
- Can run on M5 and M15 simultaneously (use different MagicNumber)
- Higher timeframes (M30, H1) for less frequent but higher quality signals

### Pair Selection
Test different pairs to find best performance:
1. **EUR/USD**: Most liquid, lowest spreads
2. **GBP/USD**: Good volatility, more opportunities
3. **USD/JPY**: Stable movements, good for beginners
4. **EUR/GBP**: Lower volatility, fewer false signals

## Safety Guidelines

### Never Do This
- ❌ Risk more than 2% per trade
- ❌ Disable stop losses
- ❌ Run on live account without demo testing
- ❌ Ignore daily loss limits
- ❌ Over-leverage your account

### Always Do This
- ✅ Test on demo first (minimum 2 weeks)
- ✅ Use appropriate risk for account size
- ✅ Keep daily loss limits enabled
- ✅ Monitor performance regularly
- ✅ Back up your settings

## Getting Help

If you need assistance:

1. **Check the Experts Tab**: Most issues show error messages here
2. **Review README.md**: Comprehensive troubleshooting section
3. **Check Your Settings**: Compare with recommended configurations
4. **Test on Demo**: Isolate issues without risking real money
5. **Open GitHub Issue**: Report bugs or request features

## Next Steps

After your first successful day:

1. **Week 1**: Monitor daily, keep detailed notes
2. **Week 2**: Analyze win rate and adjust if needed
3. **Week 3**: Test different pairs and timeframes
4. **Week 4**: Fine-tune settings for optimal performance
5. **Month 2+**: Consider gradual risk increase as account grows

---

**Remember**: Patience and consistency are key. Don't expect overnight riches. Focus on protecting your capital and maintaining steady growth.

**Good luck and happy trading! 🚀**
