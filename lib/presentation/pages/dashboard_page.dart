import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit/presentation/blocs/stock_sentiment/stock_sentiment_bloc.dart';
import 'package:infinit/presentation/blocs/stock_sentiment/stock_sentiment_event.dart';
import 'package:infinit/presentation/blocs/stock_sentiment/stock_sentiment_state.dart';
import 'package:infinit/presentation/widgets/dashboard_section.dart';
import 'package:infinit/presentation/widgets/state_views.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockSentimentBloc, StockSentimentState>(
      bloc: BlocProvider.of<StockSentimentBloc>(context)
        ..add(FetchStockSentimentsEvent()),
      builder: (context, state) {
        if (state is StockSentimentLoading) {
          return StateViews.buildLoadingView;
        } else if (state is StockSentimentLoaded) {
          return _buildContent(state);
        } else if (state is StockSentimentError) {
          return StateViews.buildErrorView(state);
        } else {
          return StateViews.buildEmptyView;
        }
      },
    );
  }
}

// UI Elements

extension DashboardPageUI on DashboardPage {
  Widget _buildContent(StockSentimentLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DashboardSectionWidget(
            title: 'Tickers Analyzed',
            content: '${state.tickersAnalyzed}',
            type: DashboardSectionType.featured,
          ),
          const SizedBox(height: 20),
          DashboardSectionWidget(
            title: 'Most Bullish Ticker',
            content:
                '${state.mostBullishTicker?.ticker} (Score: ${state.mostBullishTicker?.sentimentScore})',
            type: DashboardSectionType.bullish,
          ),
          const SizedBox(height: 20),
          DashboardSectionWidget(
            title: 'Most Bearish Ticker',
            content:
                '${state.mostBearishTicker?.ticker} (Score: ${state.mostBearishTicker?.sentimentScore})',
            type: DashboardSectionType.bearish,
          ),
        ],
      ),
    );
  }
}
