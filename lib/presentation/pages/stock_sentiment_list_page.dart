import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit/app_router.dart';
import 'package:infinit/data/models/stock_sentiment_model.dart';
import 'package:infinit/presentation/blocs/stock_sentiment/stock_sentiment_bloc.dart';
import 'package:infinit/presentation/blocs/stock_sentiment/stock_sentiment_event.dart';
import 'package:infinit/presentation/blocs/stock_sentiment/stock_sentiment_state.dart';
import 'package:infinit/presentation/widgets/state_views.dart';
import 'package:infinit/presentation/widgets/stock_sentiment_list_item.dart';

class StockSentimentListPage extends StatelessWidget {
  const StockSentimentListPage({super.key});

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

extension StockSentimentListPageUI on StockSentimentListPage {
  Widget _buildContent(StockSentimentLoaded state) {
    return ListView.builder(
      itemCount: state.stockSentiments.length,
      itemBuilder: (context, index) {
        final stockSentiment = state.stockSentiments[index];
        return StockSentimentListItem(
          stockSentiment: stockSentiment,
          onTap: () => _onSentimentalItemTap(context, stockSentiment),
        );
      },
    );
  }
}

// Functions

extension StockSentimentListPageFn on StockSentimentListPage {
  void _onSentimentalItemTap(
      BuildContext context, StockSentiment stockSentiment) {
    Navigator.pushNamed(
      context,
      AppRoutes.detail,
      arguments: stockSentiment,
    );
  }
}
