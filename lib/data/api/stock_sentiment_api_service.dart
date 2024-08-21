import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infinit/core/constants.dart';
import 'package:infinit/data/models/stock_sentiment_model.dart';

class StockSentimentApiService {
  final String baseUrl;

  StockSentimentApiService({required this.baseUrl});

  Future<List<StockSentiment>> fetchStockSentiments() async {
    final response = await http.get(
      Uri.parse('$baseUrl${AppConstants.stockSentimentsEndpoint}'),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((item) => StockSentiment.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load stock sentiments');
    }
  }
}
