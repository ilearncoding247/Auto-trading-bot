# Quick Start Guide - MT5 Scalping Bot

## 🎯 For Absolute Beginners

This guide will help you get your scalping bot running in **under 10 minutes**, even if you've never used MT5 before.

---

## Step 1: Get MetaTrader 5 (2 minutes)

### If you don't have MT5 yet:
1. Go to [MetaTrader 5 official website](https://www.metatrader5.com/en/download)
2. Download and install MT5 for your operating system (Windows/Mac/Linux)
3. Open an account with a broker that supports MT5 (or use a demo account)

### Popular MT5 Brokers:
- **IC Markets** - Low spreads, good for scalping
- **Pepperstone** - Excellent execution
- **XM** - Good for beginners
- **FXCM** - Regulated and reliable

💡 **Tip**: Start with a **demo account** first! It's free and uses virtual money.

---

## Step 2: Install the Bot (3 minutes)

### A. Download the EA File
1. Download `ScalpingBot_Pro.mq5` from this repository
2. Save it to your desktop or downloads folder

### B. Find MT5 Data Folder
1. Open MetaTrader 5
2. Click **File** menu → **Open Data Folder**
3. A window will open showing your MT5 files

### C. Copy the EA
1. In the opened folder, navigate to: **MQL5** → **Experts**
2. Copy `ScalpingBot_Pro.mq5` into the **Experts** folder
3. Restart MT5 (or press F4 to open MetaEditor and compile)

---

## Step 3: Set Up Your Chart (2 minutes)

### A. Open a Currency Pair
1. In MT5, go to **File** → **New Chart**
2. Select a pair: **EURUSD** (recommended for beginners)
3. Right-click on the chart → **Timeframe** → **M5** (5-minute chart)

### B. Attach the Bot
1. Look at the left panel "Navigator" (Press Ctrl+N if you don't see it)
2. Expand **Expert Advisors**
3. Find **ScalpingBot_Pro**
4. **Drag and drop** it onto your EURUSD chart

### C. Configure Settings
A settings window will pop up:

**For a $2-$20 account, use these settings:**
```
=== Risk Management ===
RiskPercent = 1.0
StopLossPips = 10
TakeProfitPips = 15
UseTrailingStop = true

=== Money Management ===
UseFixedLot = true
FixedLotSize = 0.01

=== Trade Filters ===
UseTimeFilter = true
MaxSpreadPips = 2.0
```

Click **OK**

---

## Step 4: Enable Auto Trading (1 minute)

### Critical Step - Don't Skip!
1. Look at the top toolbar in MT5
2. Find the **"Algo Trading"** button (looks like a play button or says "AutoTrading")
3. Click it - it should turn **GREEN**
4. Look at your chart - you should see a **smiley face** 😊 in the top-right corner

✅ **If you see a green button and smiley face = You're ready!**
❌ **If you see a sad face = Check your settings or restart MT5**

---

## Step 5: Verify It's Working (2 minutes)

### Check the Bot Status
1. At the bottom of MT5, find the **"Toolbox"** panel
2. Click the **"Experts"** tab
3. You should see messages like:
   ```
   ScalpingBot Pro initialized successfully
   Minimum account requirement: $2
   Strategy: Multi-Indicator Scalping
   ```

### What to Expect
- The bot checks every **new bar** (candle) for trading opportunities
- It will **NOT** trade every minute - that's normal!
- On M5 timeframe, it checks every 5 minutes
- A trade might appear in minutes, or it might take an hour depending on market conditions

### Your First Trade
When the bot opens a trade, you'll see:
- A message in the Experts tab: "Buy order opened" or "Sell order opened"
- A line on your chart showing the position
- An entry in the **"Trade"** tab at the bottom

---

## 🎓 Understanding the Dashboard

### Top of Chart
- **Smiley face** 😊 = Bot is running
- **Expert name** = Shows "ScalpingBot_Pro"

### Bottom Panel Tabs
- **Trade**: Shows your open positions
- **History**: Shows closed trades
- **Experts**: Shows bot messages and logs

---

## 💡 Tips for First-Time Users

### Do's ✅
- ✅ Start with a **demo account** - practice with virtual money
- ✅ Use **EURUSD** or **USDJPY** - most reliable pairs
- ✅ Start with **M5 timeframe** - good balance for scalping
- ✅ Keep MT5 running - bot stops when you close MT5
- ✅ Check the bot daily for the first week
- ✅ Use a **VPS** for 24/7 trading (optional but recommended)

### Don'ts ❌
- ❌ Don't attach to multiple charts (one chart = one bot instance)
- ❌ Don't change settings mid-trade
- ❌ Don't panic on first loss - losses are normal
- ❌ Don't risk more than 1-2% per trade
- ❌ Don't use exotic pairs (stick to majors)
- ❌ Don't trade during major news if you're a beginner

---

## 🔧 Common Issues & Quick Fixes

### "Algo Trading" button is gray
**Solution**: Click it to turn it green

### No smiley face on chart
**Solution**: 
1. Check Algo Trading is enabled (green)
2. Right-click chart → Expert Advisors → Allow Expert Advisors
3. Restart MT5

### "Not enough money" error
**Solution**:
1. Use smaller lot size: Set `FixedLotSize = 0.01`
2. Or reduce risk: Set `RiskPercent = 0.5`

### Bot not opening trades
**Solution**:
1. Check the time filter - might be outside trading hours
2. Check spread - might be too high
3. Wait longer - bot is selective, it doesn't trade every minute
4. Check Experts tab for messages

### Trades closing too fast
**Solution**:
- Increase `TakeProfitPips` (try 20 instead of 15)
- Adjust `TrailingStopPips` if using trailing stop

---

## 📊 Monitoring Your Bot

### Daily Checks (5 minutes)
- Look at **Account Balance** - is it growing or stable?
- Check **Trade History** tab - win rate and profit/loss
- Review **Experts** tab - any errors?

### Weekly Review (15 minutes)
- Calculate win rate: (Winning Trades / Total Trades) × 100
- Check total profit/loss for the week
- Adjust settings if needed (see PRESETS.md)

### Red Flags to Watch
- ⚠️ Losing more than 3 trades in a row - consider pausing
- ⚠️ Drawdown exceeds 10% - reduce risk
- ⚠️ Multiple "Invalid stops" errors - adjust SL/TP
- ⚠️ Very high spread messages - change broker or pair

---

## 🎯 Your First Week Goals

### Day 1-2: Learning Phase
- Get comfortable with MT5 interface
- Watch how the bot enters and exits trades
- Don't change any settings yet

### Day 3-5: Observation Phase
- Note when the bot trades most (time of day)
- Check if trades are mostly profitable
- Start understanding the strategy

### Day 6-7: Optimization Phase
- Review performance
- Consider small adjustments if needed
- Decide if ready for live trading (if on demo)

---

## 📞 Need Help?

### Before Asking for Help:
1. Check the **Experts tab** for error messages
2. Review the **Troubleshooting section** in README.md
3. Verify you followed all steps correctly
4. Try restarting MT5

### Resources:
- **Main Documentation**: README.md
- **Optimized Settings**: PRESETS.md
- **MT5 User Guide**: [MQL5 Community](https://www.mql5.com)

---

## 🎉 Success Checklist

Before you consider yourself "set up," make sure:
- ☑️ MT5 is installed and running
- ☑️ Bot is attached to chart with smiley face showing
- ☑️ Algo Trading button is green
- ☑️ You see initialization messages in Experts tab
- ☑️ Settings are configured for your account size
- ☑️ You understand how to check if a trade is open
- ☑️ You know where to find trade history

---

## 🚀 Next Steps

Once comfortable with the basics:
1. Read the full **README.md** for detailed information
2. Explore different **presets** in PRESETS.md
3. Learn about **optimization** for your specific needs
4. Consider using a **VPS** for 24/7 operation
5. Join trading communities to learn from others

---

**Remember**: Trading involves risk. Start small, learn continuously, and never risk money you can't afford to lose. The bot is a tool to assist you, not a magic money machine. Patience and proper risk management are keys to success!

**Good luck with your trading journey! 🚀📈**
