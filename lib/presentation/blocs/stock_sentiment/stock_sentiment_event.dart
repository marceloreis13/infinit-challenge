import 'package:equatable/equatable.dart';

abstract class StockSentimentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchStockSentimentsEvent extends StockSentimentEvent {}
