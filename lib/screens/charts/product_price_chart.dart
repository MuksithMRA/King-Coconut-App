import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:kingcoconut/screens/charts/chart_series_model.dart';

class ProductPriceChart extends StatelessWidget {
  final List<charts.Series<ChartSeriesModel, DateTime>> seriesList;
  final bool animate;

  const ProductPriceChart(this.seriesList, {super.key, this.animate = false});

  factory ProductPriceChart.withSampleData() {
    return ProductPriceChart(
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
        price: 500,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 2),
        price: 500,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 3),
        price: 500,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 4),
        price: 500,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 5),
        price: 200,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 6),
        price: 300,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 7),
        price: 400,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 8),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 9),
        price: 500,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 10),
        price: 500,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 11),
        price: 500,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 12),
        price: 500,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 13),
        price: 200,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 14),
        price: 300,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 15),
        price: 400,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 16),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 17),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 18),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 19),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 20),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 21),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 22),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 23),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 24),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 25),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 26),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 27),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 28),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 29),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 30),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 17),
        price: 800,
      ),
      ChartSeriesModel(
        dateTime: DateTime(2023, 5, 17),
        price: 800,
      ),
    ];

    return [
      charts.Series<ChartSeriesModel, DateTime>(
        id: 'Product Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ChartSeriesModel sales, _) => sales.dateTime,
        measureFn: (ChartSeriesModel sales, _) => sales.price,
        data: data,
      )
    ];
  }
}
