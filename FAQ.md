# FAQ & Risk Disclaimer

## ⚠️ IMPORTANT RISK DISCLAIMER

### READ THIS BEFORE USING THE BOT

**FOREX TRADING CARRIES SUBSTANTIAL RISK OF LOSS AND IS NOT SUITABLE FOR ALL INVESTORS.**

By using this Expert Advisor (EA), you acknowledge and agree that:

1. **No Guarantee of Profit**: Past performance does not indicate future results. This bot may lose money.

2. **Substantial Risk**: Forex trading involves substantial risk of loss. You can lose all invested capital.

3. **Your Responsibility**: You are solely responsible for:
   - Understanding how the bot works
   - Setting appropriate risk parameters
   - Monitoring your account
   - Any trading decisions made by the bot
   - All profits and losses

4. **Not Financial Advice**: This bot is provided as educational software. It is NOT financial advice, investment advice, or a recommendation to trade.

5. **No Warranty**: The bot is provided "AS IS" without warranty of any kind. We do not guarantee:
   - Profitability
   - Accuracy of signals
   - Error-free operation
   - Suitability for your needs

6. **Use at Your Own Risk**: You use this bot entirely at your own risk. The creators and distributors are not liable for any losses.

7. **Start Small**: Always:
   - Test on demo first
   - Start with minimum amounts
   - Use proper risk management
   - Never trade money you can't afford to lose

8. **Due Diligence**: Before trading:
   - Understand forex markets
   - Understand the strategy
   - Understand your broker's terms
   - Understand the risks involved

**BY USING THIS SOFTWARE, YOU ACCEPT FULL RESPONSIBILITY FOR ALL OUTCOMES.**

---

## ❓ Frequently Asked Questions (FAQ)

### General Questions

#### Q: Can I really start with just $2?
**A**: Yes, technically. Many brokers allow accounts as small as $1-5 and minimum lot sizes of 0.01. However, we recommend:
- $10-20 minimum for reasonable risk management
- $50-100 for better performance and flexibility
- Starting with demo account first

#### Q: What is the expected win rate?
**A**: Typically 55-70% depending on:
- Market conditions (better in trending markets)
- Settings used (conservative settings = higher win rate)
- Broker execution quality
- Pair and timeframe selection
Note: High win rate doesn't always mean profitable if losses are larger than wins.

#### Q: How much can I make per month?
**A**: Realistic expectations:
- Conservative: 5-10% monthly return
- Balanced: 10-15% monthly return
- Aggressive: 15-25% monthly return

Remember:
- These are estimates, not guarantees
- Some months may be negative
- Consistency matters more than occasional big wins

#### Q: Does the bot trade 24/7?
**A**: The bot CAN trade 24/7 if:
- MT5 is running (use VPS for 24/7 uptime)
- Time filters allow (by default, trades 8 AM - 8 PM server time)
- Market is open (Forex markets close on weekends)

---

### Setup & Installation

#### Q: I've never used MT5 before. Can I still use this?
**A**: Yes! Follow the QUICK_START.md guide. It's designed for complete beginners and takes about 10 minutes.

#### Q: Do I need a VPS?
**A**: Not required, but recommended if:
- You want 24/7 trading
- Your computer isn't always on
- You have unreliable internet
- You want best execution speed

VPS costs $5-20/month typically.

#### Q: Which broker should I use?
**A**: Choose a broker with:
- Low spreads (< 1 pip for major pairs)
- Fast execution
- MT5 support
- Good regulation
- Minimum deposit that suits you

Popular options: IC Markets, Pepperstone, XM, FXCM

#### Q: Can I use this on MT4?
**A**: No, this bot is for MT5 only. MT4 and MT5 use different programming languages. However, the strategy could be ported to MT4 with modifications.

---

### Trading & Strategy

#### Q: Which currency pairs work best?
**A**: Best results typically on:
- **EURUSD** (most popular, tight spreads)
- **GBPUSD** (good volatility)
- **USDJPY** (liquid, consistent)
- **AUDUSD** (good for Asian session)

Avoid exotic pairs due to high spreads and low liquidity.

#### Q: What timeframe should I use?
**A**: Recommended for scalping:
- **M1** (1-minute): More trades, requires more attention
- **M5** (5-minute): Balanced, good for beginners
- **M15** (15-minute): Fewer but potentially better quality trades

M5 is the sweet spot for most users.

#### Q: How many trades should I expect per day?
**A**: Varies greatly:
- Quiet days: 2-5 trades
- Active days: 10-20 trades
- Very quiet days: 0-1 trades

Depends on market conditions, timeframe, and pair. The bot is selective - fewer quality trades is better than many poor trades.

#### Q: Can I run the bot on multiple pairs simultaneously?
**A**: Yes! Best practices:
- Use one chart per pair
- Attach bot to each chart separately
- Use same or similar settings for consistency
- Monitor total exposure across all pairs
- Don't over-leverage

Example: Run on EURUSD, GBPUSD, and USDJPY with 0.5% risk each = 1.5% total risk

#### Q: Should I use trailing stop?
**A**: Pros and Cons:

**Advantages:**
- Locks in profits as trade moves favorably
- Can increase profit on strong trends
- Reduces risk once in profit

**Disadvantages:**
- May close trades prematurely
- Can reduce win rate if too tight

Recommendation: Enable trailing stop, but set it wider than stop loss (default: 8 pips trail vs 10 pips SL).

---

### Risk & Money Management

#### Q: What risk percentage should I use?
**A**: Conservative approach:
- **0.5-1%** for beginners or very small accounts
- **1-2%** for experienced traders
- **Never exceed 5%** per trade

Higher risk = higher returns BUT also higher drawdowns and faster account wipeout potential.

#### Q: What's the maximum drawdown I should expect?
**A**: Depends on settings:
- Conservative: 5-10% max drawdown
- Balanced: 10-15% max drawdown
- Aggressive: 15-25% max drawdown

If drawdown exceeds 25%, seriously consider:
- Reducing risk percentage
- Pausing the bot
- Reviewing settings
- Checking market conditions

#### Q: How do I protect my account?
**A**: Best practices:
1. **Never risk more than 1-2% per trade**
2. **Use stop losses (always enabled in bot)**
3. **Start with small amounts**
4. **Monitor regularly**
5. **Use demo first**
6. **Don't add funds during drawdown**
7. **Have a maximum loss limit (e.g., stop if down 20%)**

#### Q: Can I lose more than my initial deposit?
**A**: Generally no, because:
- The bot uses stop losses
- Most retail forex brokers have negative balance protection
- You can't lose what you don't have in account

BUT verify your broker's policy on negative balance protection!

---

### Technical Issues

#### Q: The bot isn't opening any trades. Why?
**A**: Common reasons:
1. **Time filter**: Outside trading hours (check StartHour/EndHour)
2. **Spread too high**: Exceeds MaxSpreadPips
3. **No signal**: Market conditions don't meet criteria (normal)
4. **Insufficient margin**: Not enough money for position
5. **Algo Trading disabled**: Green button must be on
6. **Already have position**: Bot only trades one position at a time by default

Check the "Experts" tab for messages.

#### Q: I see "Invalid stops" error. What does it mean?
**A**: Your Stop Loss or Take Profit is too close to current price.

**Solutions:**
- Increase StopLossPips (try 15-20)
- Increase TakeProfitPips (try 20-30)
- Check your broker's minimum stop level
- Some brokers require stops at least 10-20 pips away

#### Q: Trades are closing immediately. Why?
**A**: Possible causes:
1. **Take Profit hit immediately**: TP too close
2. **Stop Loss hit**: Entry timing was poor
3. **Trailing stop**: Moved too quickly
4. **Spread widened**: Hit stop loss due to spread

Check trade history to see which triggered.

#### Q: Can I modify trades manually?
**A**: Yes, but:
- Bot might modify them back (especially trailing stop)
- You might interfere with strategy
- Can be useful in emergencies

Recommendation: Let the bot manage unless necessary.

#### Q: How do I update the bot to a new version?
**A**: 
1. Download new .mq5 file
2. Replace old file in MQL5/Experts folder
3. Recompile in MetaEditor
4. Restart MT5
5. Reattach to charts

Settings will need to be re-entered.

#### Q: How does the profit target feature work?
**A**: The profit target feature allows you to set a target account balance. Here's how it works:

**Setup:**
- Set `UseProfitTarget = true`
- Set `ProfitTargetAmount` to your desired balance (e.g., 20000 for $20,000)
- Enable `AutoPauseAtTarget = true` to pause when target is reached
- Enable `AutoResumeBelow = true` to resume if balance drops below target

**Behavior:**
- Bot checks your balance on each new bar
- When balance ≥ target → trading pauses automatically
- When balance < target → trading resumes automatically
- Open positions are still managed even when paused (trailing stop, SL, TP)

**Example:**
If you set target at $20,000:
- Balance reaches $20,050 → Bot pauses, won't open new trades
- You withdraw $500, balance now $19,550 → Bot resumes trading
- Balance reaches $20,100 again → Bot pauses again

**Use Cases:**
- Daily profit goals (current balance + $100)
- Milestone protection (pause at $10k, $20k, etc.)
- Drawdown prevention during volatile markets
- Profit locking after good winning streaks

#### Q: Can I set daily profit targets?
**A**: Yes! Use the profit target feature:
```
UseProfitTarget = true
ProfitTargetAmount = [Current Balance + Daily Goal]
```

For example, if your balance is $500 and you want to make $50/day:
- Set `ProfitTargetAmount = 550`
- When reached, bot pauses
- Next day, manually adjust to 600, and so on

Or withdraw profits daily and let `AutoResumeBelow` restart trading.

---

### Performance & Optimization

#### Q: The bot is losing money. What should I do?
**A**: First, analyze:
1. **How long has it been losing?** (A few days is normal, weeks might indicate issue)
2. **What's the win rate?** (Below 45% is concerning)
3. **Market conditions?** (Choppy markets are challenging)
4. **Settings appropriate?** (Compare with presets)

**Actions:**
- Review trade history for patterns
- Check if settings need adjustment
- Consider pausing during bad market conditions
- Try different preset (see PRESETS.md)
- If using aggressive settings, switch to conservative

**Don't:**
- Panic and change everything
- Increase risk to "recover losses"
- Keep using if losing consistently without analyzing why

#### Q: How do I know if my settings are good?
**A**: Look at these metrics over 2-4 weeks:
- **Win Rate**: Should be >55%
- **Profit Factor**: Should be >1.5
- **Net Profit**: Should be positive
- **Max Drawdown**: Should be <20%

If these criteria are met, settings are probably good.

#### Q: Should I optimize the bot?
**A**: Pros and Cons:

**Yes, if:**
- You understand optimization process
- You'll test optimized settings forward
- You have at least 3 months of data
- You want to adapt to your specific broker/pair

**No, if:**
- You're a beginner
- You might over-optimize (curve-fit)
- Default settings are working
- You'll just use optimized settings blindly

See STRATEGY_GUIDE.md for optimization instructions.

#### Q: Can I backtest the bot?
**A**: Yes! Use MT5 Strategy Tester:
- Ctrl+R to open Strategy Tester
- Select ScalpingBot_Pro
- Choose symbol, period, date range
- Run test
- Analyze results

See STRATEGY_GUIDE.md for detailed backtesting guide.

---

### Compliance & Legal

#### Q: Is forex trading legal in my country?
**A**: Forex trading is legal in most countries, but regulations vary. Check your local laws. Some countries restrict or ban forex trading for retail traders.

#### Q: Do I need to pay taxes on profits?
**A**: In most jurisdictions, yes. Forex trading profits are typically taxable. Consult a tax professional in your area for guidance.

#### Q: Is this bot regulated?
**A**: This is open-source trading software, not a financial service. It doesn't require regulation. However:
- Your broker should be regulated
- You're responsible for compliance with your local laws
- Trading bots don't exempt you from regulations

---

### Miscellaneous

#### Q: Can I share or sell this bot?
**A**: Check the license file (if included). Generally:
- Personal use: Yes
- Sharing with friends: Typically okay
- Commercial use/selling: May require permission
- Modified versions: Check license terms

#### Q: Will you provide support?
**A**: This is open-source software provided as-is. While we've included extensive documentation:
- No guaranteed support
- Community support may be available
- You're responsible for understanding and using it

#### Q: Can I modify the bot?
**A**: Yes! It's open source. You can:
- Adjust parameters
- Modify strategy logic
- Add new features
- Share improvements with community

Requires MQL5 programming knowledge.

#### Q: Where can I learn more about forex trading?
**A**: Resources:
- **BabyPips.com**: Excellent beginner course
- **Investopedia**: Trading concepts
- **MQL5.com**: MT5 and EA development
- **Books**: See STRATEGY_GUIDE.md for recommendations

**Warning**: Avoid "get rich quick" courses and signal sellers. Most are scams.

---

## 🚨 Red Flags & When to Stop

Stop using the bot immediately if:
- ❌ Losing more than 20% of account
- ❌ Win rate drops below 40% over 50+ trades
- ❌ Consistent technical errors
- ❌ Broker execution quality deteriorates
- ❌ You don't understand what it's doing
- ❌ You can't afford to lose more

---

## 📞 Getting Help

### Before Asking:
1. ✅ Read all documentation
2. ✅ Check Experts tab for error messages
3. ✅ Verify all setup steps completed
4. ✅ Test on demo account
5. ✅ Search for similar issues

### When Asking for Help:
Include:
- MT5 version and build number
- Broker name
- Symbol and timeframe
- Bot settings used
- Error messages from Experts tab
- Screenshots if relevant
- What you've already tried

---

## 📚 Additional Resources

- **README.md**: Main documentation and features
- **QUICK_START.md**: Beginner setup guide
- **PRESETS.md**: Optimized settings for different scenarios
- **STRATEGY_GUIDE.md**: Deep dive into strategy and backtesting

---

## 🎯 Final Advice

**Success in automated trading requires:**
1. Understanding the strategy
2. Proper risk management
3. Patience and discipline
4. Realistic expectations
5. Continuous learning
6. Emotional control

**This bot is a tool, not magic. Your success depends on how you use it.**

---

**Last Updated**: 2024
**Version**: 1.0

**Remember: Trade responsibly. Start small. Learn continuously. Protect your capital.**
