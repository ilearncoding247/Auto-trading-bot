# Testing & Validation Guide

This guide explains how to properly test the MT5 Scalping Bot before using it with real money.

## Testing Phases

### Phase 1: Demo Account Testing (Required - 2 weeks minimum)

#### Why Demo Test?
- Zero risk to your capital
- Learn how the EA behaves
- Verify settings work as expected
- Identify any issues before going live

#### How to Demo Test

**Step 1: Open Demo Account**
1. In MT5, go to `File` → `Open an Account`
2. Select your broker
3. Choose "Open a demo account"
4. Set balance to match your intended live account size
5. Complete registration

**Step 2: Setup EA on Demo**
1. Follow QUICK_START.md installation instructions
2. Use Conservative settings for first week
3. Attach to EUR/USD M15 chart
4. Enable "Algo Trading"
5. Let run for at least 2 weeks

**Step 3: Monitor Daily**
- Check "Experts" tab for errors
- Review trades in "History"
- Track daily profit/loss
- Note win rate and profit factor
- Watch for any unusual behavior

**Step 4: Evaluate Results**
After 2 weeks, check:
- Win rate (should be 60-70%)
- Profit factor (should be > 1.5)
- Drawdown (should be < 20%)
- Any errors or issues
- If settings need adjustment

### Phase 2: Strategy Tester (Optional but Recommended)

#### Purpose
- Test historical performance
- Optimize settings
- Verify strategy logic
- Estimate expected returns

#### How to Backtest

**Step 1: Open Strategy Tester**
1. In MT5, press `Ctrl+R` or go to `View` → `Strategy Tester`
2. Select `ScalpingBot` from Expert Advisor dropdown

**Step 2: Configure Test**
```
Symbol: EUR/USD (or your preferred pair)
Period: M15 (or your preferred timeframe)
Date range: Last 3-6 months (minimum)
Initial deposit: Your actual account size
Execution: Every tick based on real ticks (most accurate)
Optimization: None (for initial test)
```

**Step 3: Run Backtest**
1. Click "Start"
2. Wait for test to complete (may take several minutes)
3. Review results in tabs: Overview, Graph, Report

**Step 4: Analyze Results**

**Key Metrics to Check:**

| Metric | Good | Acceptable | Poor |
|--------|------|------------|------|
| Total Net Profit | Positive | Positive | Negative |
| Profit Factor | > 1.5 | 1.2 - 1.5 | < 1.2 |
| Win Rate | > 60% | 50-60% | < 50% |
| Max Drawdown | < 15% | 15-25% | > 25% |
| Total Trades | > 50 | 20-50 | < 20 |

**Graph Analysis:**
- Balance line should trend upward
- Drawdowns should recover
- Equity should follow balance closely
- No extended flat periods

**Step 5: Optimization (Optional)**

If results are poor, try optimizing:

1. Click "Optimization" checkbox
2. Select parameters to optimize:
   - RSI_Oversold (range: 20-35, step: 5)
   - RSI_Overbought (range: 65-80, step: 5)
   - Fast_EMA_Period (range: 5-13, step: 2)
   - Slow_EMA_Period (range: 13-34, step: 4)
   - StopLossMultiplier (range: 1.0-2.0, step: 0.2)
   - TakeProfitMultiplier (range: 2.0-3.5, step: 0.5)

3. Choose optimization criterion: "Balance + Profit Factor"
4. Click "Start"
5. Review best results
6. Forward test optimized settings on demo!

**⚠️ Warning**: Don't over-optimize! Results that look too good in backtest often fail in live trading.

### Phase 3: Small Live Account (Transition Phase)

#### When to Start Live Trading
Only after:
- ✅ Minimum 2 weeks successful demo testing
- ✅ Win rate consistently 55%+ on demo
- ✅ No critical errors or issues
- ✅ You understand how the EA works
- ✅ You're comfortable with the risk

#### Starting Live

**Step 1: Start Small**
- Begin with minimum account size ($10-$20 recommended)
- Use even lower risk (0.5% instead of 1%)
- Watch closely for first week

**Step 2: Gradual Scale-Up**
```
Week 1-2: Minimum account, 0.5% risk, 5 max trades/day
Week 3-4: Same account, increase to 1% risk if successful
Month 2: Add more capital if consistently profitable
Month 3+: Scale up gradually based on results
```

**Step 3: Reality Check**
Live trading often differs from demo:
- Spreads may be wider
- Slippage may be higher
- Psychological pressure is real
- Execution speed varies

Expect slightly worse performance than demo initially.

## Testing Checklist

### Before Demo Testing
- [ ] MT5 installed and working
- [ ] Demo account created
- [ ] EA compiled successfully (no errors)
- [ ] Settings configured appropriately
- [ ] "Algo Trading" enabled
- [ ] EA attached to correct chart and timeframe

### During Demo Testing (Daily)
- [ ] Check "Experts" tab for errors
- [ ] Review new trades
- [ ] Monitor daily P&L
- [ ] Verify spread filters working
- [ ] Check if time filters functioning
- [ ] Watch for any unusual behavior

### Weekly Demo Review
- [ ] Calculate win rate
- [ ] Calculate profit factor
- [ ] Review drawdown
- [ ] Check if daily limits working
- [ ] Identify any patterns in losses
- [ ] Adjust settings if needed
- [ ] Document observations

### Before Going Live
- [ ] At least 2 weeks demo testing complete
- [ ] Win rate 55%+ achieved
- [ ] No critical issues found
- [ ] Understand all settings
- [ ] Know how to stop EA if needed
- [ ] Have realistic expectations
- [ ] Risk capital only (money you can afford to lose)

## Common Testing Scenarios

### Scenario 1: High Win Rate but Small Profits
**Possible Causes:**
- Stop losses too tight
- Take profits too small
- Spread costs eating into profits

**Solutions:**
- Increase TakeProfitMultiplier
- Ensure MaxSpreadPips is appropriate
- Consider different broker with lower spreads

### Scenario 2: Low Win Rate but Good Profit Factor
**Possible Causes:**
- Large winners compensating for small losers
- Trailing stops capturing big moves
- Good risk/reward ratio

**Solutions:**
- This can be acceptable if overall profitable
- Consider if you're comfortable with lower win rate
- May need psychological adjustment

### Scenario 3: Many Trades but No Profit
**Possible Causes:**
- Spread costs too high
- Overtrading in ranging market
- Settings too aggressive

**Solutions:**
- Reduce MaxTradesPerDay
- Tighten spread filter
- Use higher timeframe (M30 instead of M5)
- Test on different currency pair

### Scenario 4: Very Few Trades
**Possible Causes:**
- Settings too restrictive
- Time filter too narrow
- Spread filter too tight
- Quiet market period

**Solutions:**
- Loosen RSI overbought/oversold levels
- Extend trading hours
- Relax spread filter slightly
- Test on more volatile pair
- Be patient - sometimes fewer quality trades is better

### Scenario 5: Good Backtest, Poor Demo Results
**Possible Causes:**
- Backtest over-optimized
- Current market different from historical
- Live spreads wider than backtest
- Slippage in live execution

**Solutions:**
- Re-test with realistic spread settings
- Use "Every tick" mode in backtest
- Accept that real trading differs from backtest
- Adjust settings based on live results

## Testing Different Market Conditions

### Trending Market Testing
- EA should capture trends with trailing stops
- Win rate may be slightly lower but profits larger
- Fewer trades but better quality
- Stop losses may be hit less often

### Ranging Market Testing
- EA should catch bounces from BB extremes
- Win rate may be higher but profits smaller
- More trades with quick scalps
- Take profits hit more frequently

### High Volatility Testing
- Verify ATR stops adjust appropriately
- Check if spread filters engage
- Monitor for slippage issues
- Ensure daily loss limits protect account

### Low Volatility Testing
- Fewer trade signals (expected)
- Tighter stop losses (smaller ATR)
- May need to loosen entry criteria
- Consider if this is normal quiet period

## Performance Tracking

### Metrics to Track Daily
1. **Trades Taken**: Count of total trades
2. **Win/Loss**: Number of winning vs losing trades
3. **Profit/Loss**: Net profit for the day
4. **Largest Win**: Biggest winning trade
5. **Largest Loss**: Biggest losing trade
6. **Drawdown**: Peak to trough decline

### Metrics to Calculate Weekly
1. **Win Rate**: (Winning Trades / Total Trades) × 100
2. **Profit Factor**: Gross Profit / Gross Loss
3. **Average Win**: Total Wins / Number of Wins
4. **Average Loss**: Total Losses / Number of Losses
5. **Risk/Reward**: Average Win / Average Loss
6. **Recovery Factor**: Net Profit / Max Drawdown

### Sample Tracking Spreadsheet

Create a spreadsheet with these columns:
```
Date | Trades | Wins | Losses | Net P/L | Balance | Drawdown | Notes
```

Example:
```
2024-11-01 | 5 | 3 | 2 | +$2.50 | $102.50 | 0% | Good day, EUR/USD trending
2024-11-02 | 8 | 5 | 3 | +$1.20 | $103.70 | 0% | More trades, smaller wins
2024-11-03 | 4 | 2 | 2 | -$0.80 | $102.90 | 0.77% | Hit daily loss limit early
```

## Red Flags to Watch For

### Stop Testing Immediately If:
- ⚠️ Multiple "Not enough money" errors
- ⚠️ EA opening trades without stop loss
- ⚠️ EA ignoring daily loss limits
- ⚠️ Trades opening at terrible prices (major slippage)
- ⚠️ EA trading outside specified hours
- ⚠️ Critical errors in Experts tab

### Pause and Investigate If:
- ⚠️ Win rate < 40% for extended period
- ⚠️ Drawdown > 30%
- ⚠️ Consistent losses every day
- ⚠️ Much worse than backtest results
- ⚠️ Unexpected behavior

## Moving from Demo to Live - Transition Checklist

### Confirm Demo Success
- [ ] 2+ weeks of demo testing complete
- [ ] Overall profitable performance
- [ ] Win rate acceptable (50%+)
- [ ] No critical issues encountered
- [ ] Understand how EA works
- [ ] Know what to expect

### Prepare for Live
- [ ] Open live account with reputable broker
- [ ] Fund with risk capital only (money you can lose)
- [ ] Start with small balance ($10-$20)
- [ ] Set conservative risk (0.5%)
- [ ] Have emergency plan (know how to stop EA)

### First Week Live
- [ ] Monitor closely (check multiple times daily)
- [ ] Compare results to demo
- [ ] Be prepared for psychological differences
- [ ] Don't panic if first trades lose
- [ ] Don't get overconfident if first trades win
- [ ] Keep detailed notes

### First Month Live
- [ ] Weekly performance reviews
- [ ] Compare to demo results
- [ ] Identify any discrepancies
- [ ] Make minor adjustments only
- [ ] Build confidence in the system
- [ ] Stay disciplined with risk management

## Final Testing Tips

1. **Patience is Key**: Don't rush into live trading. 2 weeks minimum demo is required.

2. **Document Everything**: Keep notes on settings, results, and observations.

3. **Test Multiple Pairs**: Try EUR/USD, GBP/USD, USD/JPY to find best fit.

4. **Test Multiple Timeframes**: M5, M15, M30 each have different characteristics.

5. **Realistic Expectations**: 60-70% win rate is good. Don't expect 90%+.

6. **Market Changes**: What works today may not work next month. Stay flexible.

7. **Never Skip Demo**: No matter how confident you are, always test on demo first.

8. **Trust the Process**: If demo testing shows good results, trust it on live (with small size).

9. **Risk Management First**: Protecting capital is more important than making profits.

10. **Continuous Learning**: Review results regularly and adjust based on data, not emotions.

## Getting Help During Testing

If you encounter issues during testing:

1. **Check Documentation**: README.md, FAQ.md, STRATEGY_NOTES.md
2. **Review Experts Tab**: Error messages usually indicate the problem
3. **Check Settings**: Verify all parameters are appropriate
4. **Test on Demo First**: Never troubleshoot on live account
5. **Search GitHub Issues**: Someone may have had same issue
6. **Open New Issue**: Provide detailed information about the problem

---

**Remember**: The goal of testing is not just to see if the EA makes money, but to:
- Understand how it works
- Verify it behaves as expected
- Build confidence in the system
- Identify optimal settings
- Learn to manage it properly

Take testing seriously. Your future trading success depends on it!
