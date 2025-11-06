# Frequently Asked Questions (FAQ)

## General Questions

### Q: What is the minimum account size required?
**A:** The EA is optimized to work with accounts as small as $2. However, we recommend starting with at least $10-$20 for better trading flexibility and to handle small drawdowns.

### Q: Can I use this EA on a demo account?
**A:** Yes! In fact, we **strongly recommend** testing on a demo account for at least 2 weeks before using real money.

### Q: What currency pairs work best with this EA?
**A:** The best pairs are:
1. **EUR/USD** (most recommended - low spreads, high liquidity)
2. **GBP/USD** (good volatility)
3. **USD/JPY** (stable movements)
4. **AUD/USD** (good for Asian session)

### Q: What timeframe should I use?
**A:** 
- **M15 (15 minutes)** - Recommended for most users (balanced approach)
- **M5 (5 minutes)** - For aggressive scalping (more trades)
- **M30 (30 minutes)** - For conservative trading (fewer, quality signals)

### Q: Do I need a VPS (Virtual Private Server)?
**A:** Not required but recommended for:
- 24/7 trading without interruptions
- Better stability and uptime
- Lower latency to broker servers
- Protection from power/internet outages

### Q: What is the expected win rate?
**A:** The EA is designed for a **60-70% win rate** with proper settings. However, actual results vary based on:
- Market conditions
- Broker spreads
- Your settings
- Currency pair selected

### Q: How much can I earn per day/month?
**A:** This varies greatly based on:
- Account size
- Risk settings
- Market volatility
- Trading frequency

**Realistic expectations:**
- Daily: 0.5-2% (good days)
- Monthly: 10-30% (with compounding, in good months)

**Remember:** Losing days/weeks are normal. Focus on long-term consistency.

## Installation & Setup

### Q: Where do I put the .mq5 file?
**A:** 
1. Open MT5
2. Press F4 (opens MetaEditor)
3. Click "File" → "Open Data Folder"
4. Navigate to `MQL5/Experts/`
5. Copy `ScalpingBot.mq5` to this folder
6. Restart MT5 or refresh Navigator

### Q: The EA isn't in my Navigator panel!
**A:** Try these solutions:
1. Restart MetaTrader 5
2. Right-click in Navigator and select "Refresh"
3. Check if file is in correct folder (`MQL5/Experts/`)
4. Try compiling the EA in MetaEditor (F7)

### Q: Do I need to compile the EA?
**A:** MT5 usually auto-compiles, but if it doesn't:
1. Open MetaEditor (F4 in MT5)
2. Open `ScalpingBot.mq5`
3. Press F7 (Compile)
4. Check for errors in the "Errors" tab
5. If no errors, you should see "0 error(s), 0 warning(s)"

### Q: How do I enable auto trading?
**A:** 
1. Look for "Algo Trading" button in MT5 toolbar (top right)
2. Click it so it turns GREEN
3. The button icon should show a checkmark
4. You should see "Algo trading is allowed" tooltip

### Q: What settings should I use for my account size?
**A:** See the QUICK_START.md guide, but here's a quick reference:

**$2-$10 account:**
```
RiskPercent = 0.5
MinLotSize = 0.01
MaxLotSize = 0.01
MaxTradesPerDay = 5
```

**$10-$100 account:**
```
RiskPercent = 1.0
MinLotSize = 0.01
MaxLotSize = 0.05
MaxTradesPerDay = 10
```

**$100+ account:**
```
RiskPercent = 1.0-1.5
MinLotSize = 0.01
MaxLotSize = 0.1
MaxTradesPerDay = 15
```

## Troubleshooting

### Q: The EA is not placing any trades. Why?
**A:** Check these common reasons:

1. **Time filter**: Current time might be outside trading hours (check StartHour/EndHour)
2. **Spread too high**: Check MaxSpreadPips setting vs actual spread
3. **Daily limit reached**: Check MaxTradesPerDay or MaxDailyLossPercent
4. **No signals**: Market conditions might not meet entry criteria
5. **Algo trading disabled**: Make sure "Algo Trading" button is enabled

**How to diagnose:**
- Check the "Experts" tab at the bottom of MT5
- Look for messages explaining why trades aren't being placed

### Q: I see "Not enough money" error
**A:** Solutions:
1. Reduce RiskPercent (try 0.5% instead of 1%)
2. Use smaller MinLotSize (0.01 is minimum)
3. Check your account balance
4. Verify broker allows micro lots (0.01)

### Q: Trades are closing immediately with losses
**A:** Possible causes:
1. **Spread too wide**: During news or low liquidity
2. **Slippage**: Try increasing Slippage parameter
3. **Stop loss too tight**: Market volatility hitting stops
4. **Broker execution issues**: Check with your broker

**Solutions:**
- Enable TimeFilter to avoid bad trading times
- Set tighter MaxSpreadPips filter
- Test on different currency pair
- Consider using ECN broker with lower spreads

### Q: Win rate is much lower than expected (< 50%)
**A:** Possible causes and solutions:

**Problem: High spread costs**
- Solution: Reduce MaxSpreadPips to 2.0 or lower
- Solution: Switch to broker with lower spreads

**Problem: Wrong timeframe**
- Solution: Try M15 instead of M5 (higher quality signals)
- Solution: Use M30 for even more conservative approach

**Problem: Overtrading**
- Solution: Reduce MaxTradesPerDay
- Solution: Increase RSI_Overbought/Oversold thresholds

**Problem: Market changed**
- Solution: Re-optimize settings for current conditions
- Solution: Take break during extremely volatile periods

### Q: The EA stopped trading mid-day
**A:** Check:
1. **Daily loss limit reached**: Check MaxDailyLossPercent
2. **Max trades reached**: Check MaxTradesPerDay
3. **Time filter**: Might be outside trading hours
4. **MT5 crashed**: Restart MT5
5. **Connection lost**: Check internet connection

### Q: How do I know if the EA is running?
**A:** Look for:
1. **Smiley face icon** in top-right corner of chart (😊)
2. **"Experts" tab**: Shows "Scalping Bot initialized successfully!"
3. **Green "Algo Trading" button** in toolbar
4. Check logs for any error messages

### Q: Can I run the EA on multiple pairs simultaneously?
**A:** Yes! But:
1. Use different MagicNumber for each instance
2. Be aware of correlation (EUR/USD and GBP/USD often move together)
3. Monitor total exposure across all pairs
4. Consider: EUR/USD, USD/JPY, AUD/USD (less correlated)

### Q: The trailing stop isn't working
**A:** Verify:
1. UseTrailingStop is set to `true`
2. Trade is in profit
3. Profit exceeds initial stop loss distance
4. Check "Experts" tab for trailing stop messages

## Performance & Optimization

### Q: How long should I backtest?
**A:** Minimum recommendations:
- **Time period**: At least 3-6 months
- **Include different conditions**: Trending + ranging + volatile markets
- **Multiple years**: Better for realistic expectations

### Q: What backtest results are good?
**A:** Look for:
- **Win rate**: > 60%
- **Profit factor**: > 1.5
- **Drawdown**: < 20%
- **Recovery factor**: > 2.0
- **Sharpe ratio**: > 1.0

### Q: Can I optimize the settings?
**A:** Yes, but carefully:
1. Use MT5 Strategy Tester's optimization
2. Don't over-optimize (curve fitting)
3. Use forward testing period
4. Test optimized settings on demo first
5. Be conservative with optimized parameters

### Q: What parameters should I optimize?
**A:** Most important to test:
1. RSI_Overbought/Oversold levels
2. Fast_EMA_Period and Slow_EMA_Period
3. StopLossMultiplier and TakeProfitMultiplier
4. MaxSpreadPips

**Don't optimize**: MagicNumber, MinLotSize, Slippage

### Q: How often should I adjust settings?
**A:** 
- **Never**: During profitable periods - don't fix what isn't broken
- **Monthly**: Review performance and make small adjustments if needed
- **After major losses**: Analyze what went wrong before changing
- **Market regime change**: When market shifts from trending to ranging

### Q: Should I use trailing stops?
**A:** Depends on your goals:

**Yes, if:**
- You want to maximize profits in trending markets
- You're comfortable with profits being given back sometimes
- You trade lower timeframes (M5, M15)

**No, if:**
- You prefer fixed profit targets
- Markets are ranging/choppy
- You want predictable R:R ratio

## Strategy & Trading

### Q: What is the risk/reward ratio?
**A:** Default settings provide:
- Stop Loss: 1.5 x ATR
- Take Profit: 2.5 x ATR
- **Risk/Reward: 1:1.67**

With trailing stops, actual reward can be higher.

### Q: Why does the EA require multiple confirmations?
**A:** Multiple indicator confirmations significantly improve win rate by:
1. Filtering out false signals
2. Confirming trend direction
3. Identifying high-probability setups
4. Reducing whipsaws and noise

### Q: Can I trade during news events?
**A:** Not recommended because:
- Spreads widen dramatically
- High volatility triggers stops
- Slippage increases
- Unpredictable price movements

**Solution**: The EA has spread filters, but manually disable before major news (NFP, FOMC, etc.)

### Q: What happens during weekends?
**A:** 
- Markets closed: EA won't trade (no issue)
- Weekend gaps: Can affect Monday opening
- Solution: EA designed to handle this, but you can manually close positions Friday evening if concerned

### Q: Can I use this on crypto or stocks?
**A:** The EA is designed specifically for Forex pairs because:
- ATR calculations suited for forex volatility
- Spread filters designed for forex spreads
- Timeframes optimized for forex markets

**For crypto/stocks:** Would need significant modifications

## Risk Management

### Q: What happens if I hit the daily loss limit?
**A:** 
- EA stops opening new trades for rest of the day
- Existing positions continue with their SL/TP
- Trading resumes automatically next trading day
- Protects you from catastrophic losses

### Q: Can I disable the daily loss limit?
**A:** Yes, set `MaxDailyLossPercent = 100`, but **not recommended**:
- Risk management is crucial for long-term success
- One bad day can wipe out weeks of profits
- Better to have protection than regret

### Q: What if I want to close all positions manually?
**A:** You can:
1. Right-click on position in "Trade" tab
2. Select "Close"
3. EA will continue trading (opening new positions)
4. To stop EA completely: Remove it from chart or disable "Algo Trading"

### Q: How do I calculate my risk per trade?
**A:** Formula:
```
Risk Amount = Account Balance × (RiskPercent / 100)
```

Example with $100 account and 1% risk:
```
Risk = $100 × 0.01 = $1.00 per trade
```

If stop loss is hit, you lose $1.00

### Q: Is 1% risk per trade too much for a $2 account?
**A:** For very small accounts ($2-$10):
- 1% risk = $0.02-$0.10 per trade (acceptable)
- Consider 0.5% for even safer approach
- Focus on not losing rather than quick gains

## Advanced Topics

### Q: Can I modify the source code?
**A:** Yes! The code is open source:
1. Open ScalpingBot.mq5 in MetaEditor
2. Make your modifications
3. Compile (F7)
4. Test thoroughly on demo
5. Consider contributing improvements back

### Q: How do I add a new indicator?
**A:** You'll need MQL5 programming knowledge:
1. Add indicator handle in OnInit()
2. Create buffer array
3. Copy indicator data in UpdateIndicators()
4. Integrate into signal logic
5. Compile and test

### Q: Can I make this EA trade automatically based on news?
**A:** Not included, but you could:
1. Add economic calendar integration
2. Filter trades based on upcoming news
3. Requires additional MQL5 coding
4. Test extensively before use

### Q: How do I backtest with real tick data?
**A:** In Strategy Tester:
1. Select "Every tick based on real ticks"
2. Download tick data if not available
3. Run longer backtests (will be slower)
4. More accurate results but takes much longer

### Q: Can I use this with a signal service?
**A:** The EA trades independently, but you could:
1. Run EA on one account
2. Use MT5's built-in signal service on another
3. Don't recommend combining (conflicting strategies)

## Broker Related

### Q: Does this work with all brokers?
**A:** Should work with most MT5 brokers, but:
- **Better with**: ECN, low spread brokers
- **May struggle with**: High spread, market maker brokers
- **Check**: Broker allows algo trading and EA usage

### Q: My broker doesn't allow micro lots (0.01)
**A:** 
- Very small accounts ($2-$10) won't work well
- Need higher minimum deposit
- Consider different broker that supports micro lots

### Q: What's the difference between ECN and Market Maker brokers?
**A:** For scalping:

**ECN (Better for this EA)**:
- Lower spreads
- Faster execution
- No requotes
- Better for scalping

**Market Maker**:
- Higher spreads
- Possible requotes
- May have restrictions on scalping
- Check broker's terms

### Q: Does this EA work on MT4?
**A:** No, this is MT5 only because:
- Different programming language (MQL5 vs MQL4)
- Different position handling
- Would require complete rewrite for MT4

## Support & Community

### Q: Where can I get help?
**A:** 
1. Read the documentation (README.md, QUICK_START.md, STRATEGY_NOTES.md)
2. Check this FAQ
3. Open an issue on GitHub with details
4. Include: MT5 version, broker, settings, error messages

### Q: Can I request new features?
**A:** Yes!
1. Open a feature request on GitHub
2. Describe the feature clearly
3. Explain the use case
4. Consider contributing the code yourself

### Q: How do I report a bug?
**A:** On GitHub, provide:
1. MT5 version and build number
2. Broker name
3. Currency pair and timeframe
4. Settings you're using
5. Error messages from "Experts" tab
6. Steps to reproduce the issue

### Q: Can I hire someone to customize this for me?
**A:** Yes, but:
- Make sure they understand MQL5
- Test thoroughly before using real money
- Keep risk management features intact
- Consider open sourcing improvements

## Miscellaneous

### Q: Is this a "holy grail" trading system?
**A:** No. Key points:
- No system wins 100% of the time
- Markets change and adapt
- Risk management is crucial
- Consistent small gains better than quick riches
- Always use proper position sizing

### Q: Can I start with $1?
**A:** Technically yes, but **not recommended**:
- Minimum lot (0.01) might be too large
- One losing trade could be 50%+ of account
- Better to save up to at least $5-$10
- More flexibility with slightly larger balance

### Q: Why is my live trading different from backtest?
**A:** Common reasons:
1. **Spread differences**: Backtest vs live spreads
2. **Slippage**: Not fully modeled in backtests
3. **Market conditions**: Past ≠ future
4. **Server latency**: Real trading has delays
5. **Broker execution**: Varies by broker

This is normal - backtests provide estimates, not guarantees.

### Q: Should I run this 24/5?
**A:** Depends:

**Yes, if:**
- You have stable internet/power (or VPS)
- Trading multiple sessions
- Want maximum opportunities
- Have proper risk limits set

**No, if:**
- Prefer specific trading sessions
- Want to manually monitor
- Learning the EA first
- Small account that needs careful management

### Q: Can I trade multiple EAs on same account?
**A:** Yes, but carefully:
1. Use different MagicNumbers for each EA
2. Monitor total exposure
3. Make sure risk settings account for multiple EAs
4. Could overexpose account if not careful

### Q: How do I withdraw profits?
**A:** Strategy recommendations:
1. Let account grow to comfortable size first ($50+)
2. Withdraw monthly profits above certain threshold
3. Keep enough working capital
4. Don't withdraw during drawdown periods
5. Consider reinvesting for compound growth

---

## Still Have Questions?

If your question isn't answered here:
1. Review the full documentation
2. Search existing GitHub issues
3. Open a new issue with [QUESTION] tag
4. Join trading communities for general forex questions

Remember: Due diligence and proper testing are your responsibility. Never risk money you can't afford to lose!
