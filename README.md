# Infinit Flutter Challenge

This project is a Flutter application designed to fetch and display stock sentiment data from the [Tradestie API](https://tradestie.com/api/v1/apps/reddit). It provides an overview of the most analyzed stocks, highlighting the most bullish and bearish tickers.

## Architecture

The project follows a **clean architecture** pattern, organized into the following layers:

- **Data Layer**: Manages API interactions and data models.
  - **API Service**: `StockSentimentApiService` for fetching stock sentiment data.
  - **Repository**: `StockSentimentRepository` for abstracting data access.
  - **Models**: `StockSentiment` to represent the stock sentiment data.

- **Domain Layer**: Encapsulates business logic and use cases.
  - **Use Case**: `FetchStockSentiments` for retrieving stock sentiment data.

- **Presentation Layer**: Manages UI components and state.
  - **BloC**: `StockSentimentBloc` handles state management using the BloC pattern.
  - **UI**: Pages and widgets display the fetched data, including a dashboard that highlights key information.

## Key Features

- **Stock Sentiment Data**: Fetches and displays data about stock sentiments including the number of comments, sentiment (Bullish/Bearish), and sentiment score.
- **Dashboard**: Provides a summary of the number of tickers analyzed, and highlights the most bullish and bearish stocks.
- **SOLID Principles**: The code adheres to SOLID principles ensuring maintainability and scalability.

## Dependencies

- `flutter_bloc`: State management using the BloC pattern.
- `http`: For making API requests.

## Getting Started

To run the project, clone the repository, navigate to the project directory, and execute:

```bash
flutter pub get
flutter run
