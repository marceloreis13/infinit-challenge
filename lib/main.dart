import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit/app_router.dart';
import 'package:infinit/data/repositories/stock_sentiment_repository.dart';
import 'package:infinit/presentation/blocs/stock_sentiment/stock_sentiment_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => StockSentimentBloc(StockSentimentRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Infinit Challenge - Stock Sentiments',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
