import 'dart:ffi';

import 'package:flutter/material.dart';

enum DashboardSectionType {
  featured,
  bullish,
  bearish,
}

extension DashboardSectionTypeExt on DashboardSectionType {
  MaterialColor get color {
    switch (this) {
      case DashboardSectionType.featured:
        return Colors.blue;
      case DashboardSectionType.bullish:
        return Colors.green;
      case DashboardSectionType.bearish:
        return Colors.red;
    }
  }

  double get fontSize {
    switch (this) {
      case DashboardSectionType.featured:
        return 50.0;
      case DashboardSectionType.bullish:
      case DashboardSectionType.bearish:
        return 22;
    }
  }
}

class DashboardSectionWidget extends StatelessWidget {
  final String title;
  final String content;
  final DashboardSectionType type;
  const DashboardSectionWidget(
      {super.key,
      required this.title,
      required this.content,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: type.color.shade50,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(
                fontSize: type.fontSize,
                fontWeight: FontWeight.bold,
                color: type.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
