import 'package:charts_flutter/flutter.dart' as charts;

class ChartSeriesModel {
  final DateTime dateTime;
  final int qty;
  final double price;
  final charts.Color? barColor;
  final String country;

  ChartSeriesModel({
    required this.dateTime,
    this.qty = 0,
    this.price = 0,
    this.barColor,
    this.country = "",
  });
}
