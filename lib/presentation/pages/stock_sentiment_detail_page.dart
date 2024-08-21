import 'package:flutter/material.dart';
import 'package:infinit/data/models/stock_sentiment_model.dart';

class StockSentimentDetailPage extends StatelessWidget {
  final StockSentiment sentiment;

  const StockSentimentDetailPage({super.key, required this.sentiment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Sentiment Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildContent,
      ),
    );
  }
}

// UI Elements

extension StockSentimentDetailPageUI on StockSentimentDetailPage {
  Widget get _buildContent {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Ticker: ${sentiment.ticker}',
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16.0),
        Text('Number of Comments: ${sentiment.noOfComments}'),
        Text('Sentiment: ${sentiment.sentiment}'),
        Text('Sentiment Score: ${sentiment.sentimentScore}'),
        // Add more details as needed
      ],
    );
  }
}
