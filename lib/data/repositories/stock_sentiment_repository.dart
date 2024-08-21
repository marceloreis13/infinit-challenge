import 'package:infinit/data/api/stock_sentiment_api_service.dart';
import 'package:infinit/data/models/stock_sentiment_model.dart';

class StockSentimentRepository {
  final StockSentimentApiService apiService;

  StockSentimentRepository({StockSentimentApiService? apiService})
      : apiService = apiService ??
            StockSentimentApiService(baseUrl: 'https://tradestie.com/api/v1');

  Future<List<StockSentiment>> fetchStockSentiments() {
    return apiService.fetchStockSentiments();
  }
}
