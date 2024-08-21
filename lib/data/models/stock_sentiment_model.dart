import 'package:flutter/material.dart';

class StockSentiment {
  final String ticker;
  final int noOfComments;
  final String sentiment;
  final double sentimentScore;

  StockSentiment({
    required this.ticker,
    required this.noOfComments,
    required this.sentiment,
    required this.sentimentScore,
  });

  factory StockSentiment.fromJson(Map<String, dynamic> json) {
    try {
      return StockSentiment(
        ticker: json['ticker'],
        noOfComments: json['no_of_comments'] ?? 0,
        sentiment: json['sentiment'] ?? '',
        sentimentScore: (json['sentiment_score'] ?? 0.0).toDouble(),
      );
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
