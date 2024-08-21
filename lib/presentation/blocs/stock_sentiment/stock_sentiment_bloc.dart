import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit/data/repositories/stock_sentiment_repository.dart';
import 'package:infinit/domain/usecases/fetch_stock_sentiments.dart';
import 'package:infinit/presentation/blocs/stock_sentiment/stock_sentiment_event.dart';
import 'package:infinit/presentation/blocs/stock_sentiment/stock_sentiment_state.dart';

class StockSentimentBloc
    extends Bloc<StockSentimentEvent, StockSentimentState> {
  final FetchStockSentiments fetchStockSentiments;

  StockSentimentBloc(StockSentimentRepository repository)
      : fetchStockSentiments = FetchStockSentiments(repository),
        super(StockSentimentInitial()) {
    on<FetchStockSentimentsEvent>(_onFetchStockSentiments);
  }

  void _onFetchStockSentiments(FetchStockSentimentsEvent event,
      Emitter<StockSentimentState> emit) async {
    emit(StockSentimentLoading());
    try {
      final stockSentiments = await fetchStockSentiments();

      final tickersAnalyzed = stockSentiments.length;
      final mostBullishTicker = stockSentiments.reduce((curr, next) =>
          curr.sentimentScore > next.sentimentScore ? curr : next);
      final mostBearishTicker = stockSentiments.reduce((curr, next) =>
          curr.sentimentScore < next.sentimentScore ? curr : next);

      emit(StockSentimentLoaded(
        stockSentiments: stockSentiments,
        tickersAnalyzed: tickersAnalyzed,
        mostBullishTicker: mostBullishTicker,
        mostBearishTicker: mostBearishTicker,
      ));
    } catch (e) {
      emit(StockSentimentError(message: e.toString()));
    }
  }
}
