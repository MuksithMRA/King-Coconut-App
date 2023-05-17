import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:kingcoconut/screens/charts/chart_series_model.dart';

class ProductSalesChart extends StatelessWidget {
  final List<charts.Series<ChartSeriesModel, DateTime>> seriesList;
  final bool animate;

  const ProductSalesChart(this.seriesList, {super.key, this.animate = false});

  factory ProductSalesChart.withSampleData() {
    return ProductSalesChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.BarRendererConfig<DateTime>(),
      defaultInteractions: false,
      domainAxis: const charts.DateTimeAxisSpec(
        tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
          day: charts.TimeFormatterSpec(
            format: 'd',
            transitionFormat: 'dd',
          ),
        ),
        tickProviderSpec: charts.DayTickProviderSpec(
          increments: [1],
        ),
      ),
      behaviors: [charts.SelectNearest(), charts.DomainHighlighter()],
    );
  }

  static List<charts.Series<ChartSeriesModel, DateTime>> _createSampleData() {
    final List<ChartSeriesModel> data = [
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 1),
        qty: 5,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 2),
        qty: 5,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 3),
        qty: 5,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 4),
        qty: 5,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 5),
        qty: 2,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 6),
        qty: 3,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 7),
        qty: 4,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 8),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 9),
        qty: 5,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 10),
        qty: 5,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 11),
        qty: 5,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 12),
        qty: 5,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 13),
        qty: 2,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 14),
        qty: 3,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 15),
        qty: 4,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 16),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 17),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 18),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 19),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 20),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 21),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 22),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 23),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 24),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 25),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 26),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 27),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 28),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 29),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 30),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 17),
        qty: 8,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 17),
        qty: 8,
      ),
    ];

    return [
      charts.Series<ChartSeriesModel, DateTime>(
        id: 'Product Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ChartSeriesModel sales, _) => sales.dateTime,
        measureFn: (ChartSeriesModel sales, _) => sales.qty,
        data: data,
      )
    ];
  }
}
