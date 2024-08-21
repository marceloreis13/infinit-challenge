import 'package:flutter/material.dart';
import 'package:infinit/data/models/stock_sentiment_model.dart';

class StockSentimentListItem extends StatelessWidget {
  final void Function()? onTap;
  final StockSentiment stockSentiment;

  const StockSentimentListItem({
    super.key,
    required this.stockSentiment,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(stockSentiment.ticker),
      subtitle: Text('Sentiment: ${stockSentiment.sentiment}'),
      onTap: onTap,
    );
  }
}
