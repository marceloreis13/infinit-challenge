import 'package:infinit/data/models/stock_sentiment_model.dart';
import 'package:infinit/data/repositories/stock_sentiment_repository.dart';

class FetchStockSentiments {
  final StockSentimentRepository repository;

  FetchStockSentiments(this.repository);

  Future<List<StockSentiment>> call() {
    return repository.fetchStockSentiments();
  }
}
