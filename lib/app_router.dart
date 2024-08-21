import 'package:flutter/material.dart';
import 'package:infinit/data/models/stock_sentiment_model.dart';
import 'package:infinit/presentation/pages/dashboard_page.dart';
import 'package:infinit/presentation/pages/home_page.dart';
import 'package:infinit/presentation/pages/stock_sentiment_detail_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String detail = '/detail';
  static const String dashboard = '/dashboard';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.detail:
        final sentiment = settings.arguments as StockSentiment;
        return MaterialPageRoute(
          builder: (_) => StockSentimentDetailPage(sentiment: sentiment),
        );
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
