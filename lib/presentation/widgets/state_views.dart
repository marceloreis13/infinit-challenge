// UI Elements

import 'package:flutter/material.dart';
import 'package:infinit/presentation/blocs/stock_sentiment/stock_sentiment_state.dart';

class StateViews {
  static Widget get buildLoadingView =>
      const Center(child: CircularProgressIndicator());

  static Widget get buildEmptyView =>
      const Center(child: CircularProgressIndicator());

  static Widget buildErrorView(StockSentimentError state) =>
      Center(child: Text(state.message));
}
