# Changelog

All notable changes to the MT5 Scalping Bot will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.00] - 2024-11-06

### Added
- Initial release of MT5 Scalping Bot
- Multi-indicator confirmation system (RSI, EMA, Bollinger Bands, ATR)
- Micro account optimization ($2 minimum balance support)
- Dynamic position sizing based on ATR and account risk
- Comprehensive risk management features:
  - Daily loss limit protection
  - Maximum trades per day limit
  - Spread filters for optimal execution
  - Time-based trading filters
- Trailing stop functionality for profit protection
- ATR-based dynamic stop loss and take profit levels
- Multiple timeframe support (M5, M15, M30)
- Signal confirmation logic requiring 2+ indicators
- Configurable input parameters for all strategy aspects
- Comprehensive error handling and logging
- Support for different order filling modes (IOC, FOK, Return)

### Documentation
- Complete README.md with setup and configuration guide
- QUICK_START.md for 5-minute setup
- STRATEGY_NOTES.md with detailed trading logic explanation
- FAQ.md with comprehensive Q&A
- Conservative preset configuration file
- Aggressive preset configuration file
- MIT License with trading disclaimers

### Features
- **High Win Rate Design**: Multi-indicator confirmation for quality signals
- **Risk Management**: Daily limits and position sizing protection
- **Adaptability**: ATR-based stops adjust to market volatility
- **Flexibility**: Works with major currency pairs and multiple timeframes
- **User-Friendly**: Preset configurations for different experience levels

### Performance Targets
- Win rate: 60-70% (market dependent)
- Risk/Reward: 1:1.67 default (configurable)
- Maximum drawdown: < 20% with proper settings
- Suitable for accounts from $2 to unlimited

---

## Future Roadmap (Planned Features)

### Version 1.10 (Planned)
- [ ] Add more indicator options (Stochastic, MACD, CCI)
- [ ] Implement breakeven stop loss functionality
- [ ] Add partial position closing at milestones
- [ ] Enhanced news filter with economic calendar integration
- [ ] Advanced money management modes (Kelly Criterion, Fixed Ratio)
- [ ] Email/push notification alerts for trades
- [ ] Performance statistics panel on chart

### Version 1.20 (Planned)
- [ ] Multi-timeframe signal confirmation
- [ ] Correlation filter for multiple pairs
- [ ] Session-based trading profiles (Asian, European, US)
- [ ] Advanced trailing stop modes (step trailing, breakeven + trail)
- [ ] Market sentiment indicators
- [ ] Volatility regime detection
- [ ] Adaptive parameter adjustment

### Version 2.00 (Planned)
- [ ] Machine learning signal optimization
- [ ] Advanced pattern recognition
- [ ] Sentiment analysis integration
- [ ] Portfolio management for multiple pairs
- [ ] Web dashboard for monitoring
- [ ] Advanced backtesting suite
- [ ] Strategy optimizer with genetic algorithms

---

## Version History

### [1.00] - 2024-11-06
**Status**: ✅ Released  
**Stability**: Stable  
**Recommended**: Yes  

Initial public release with core scalping functionality and comprehensive documentation.

---

## Upgrade Guide

When new versions are released, this section will contain instructions for upgrading from previous versions.

### Upgrading from version X.XX to Y.YY

1. Backup your current settings (Export from EA settings dialog)
2. Remove old version from chart
3. Replace .mq5 file in Experts folder
4. Restart MT5 or recompile
5. Attach new version to chart
6. Load your backed-up settings
7. Verify all parameters are correct
8. Test on demo before going live

---

## Known Issues

Currently no known critical issues. If you discover a bug, please report it on GitHub with:
- MT5 version and build
- Broker name
- Symbol and timeframe
- Settings used
- Steps to reproduce
- Error messages

---

## Contributing

We welcome contributions! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Please ensure:
- Code follows existing style
- Changes are tested on demo account
- Documentation is updated
- Changelog entry is added

---

## Support

- **Documentation**: See README.md, QUICK_START.md, FAQ.md
- **Issues**: GitHub Issues
- **Discussions**: GitHub Discussions
- **Updates**: Watch repository for new releases

---

## Disclaimer

Past performance is not indicative of future results. Trading involves substantial risk. Always test thoroughly on demo accounts before risking real capital. The developers assume no liability for trading losses.
