import 'package:equatable/equatable.dart';
import 'package:infinit/data/models/stock_sentiment_model.dart';

abstract class StockSentimentState extends Equatable {
  @override
  List<Object> get props => [];
}

class StockSentimentInitial extends StockSentimentState {}

class StockSentimentLoading extends StockSentimentState {}

class StockSentimentLoaded extends StockSentimentState {
  final List<StockSentiment> stockSentiments;

  final int? tickersAnalyzed;
  final StockSentiment? mostBullishTicker;
  final StockSentiment? mostBearishTicker;

  StockSentimentLoaded({
    required this.stockSentiments,
    this.tickersAnalyzed,
    this.mostBullishTicker,
    this.mostBearishTicker,
  });

  @override
  List<Object> get props => [stockSentiments];
}

class StockSentimentError extends StockSentimentState {
  final String message;

  StockSentimentError({required this.message});

  @override
  List<Object> get props => [message];
}
