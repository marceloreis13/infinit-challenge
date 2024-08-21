import 'package:flutter/material.dart';
import 'package:infinit/presentation/pages/stock_sentiment_list_page.dart';
import 'package:infinit/presentation/pages/dashboard_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Sentiments'),
      ),
      body: const DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: [
                Tab(text: "Sentiments List"),
                Tab(text: "Dashboard"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  StockSentimentListPage(),
                  DashboardPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
