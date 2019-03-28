import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PieOutsideLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  PieOutsideLabelChart(this.seriesList, {this.animate = true});

  factory PieOutsideLabelChart.withSampleData() {
    return new PieOutsideLabelChart(
      _createSampleData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(seriesList,
              animate: animate,
              defaultRenderer: new charts.ArcRendererConfig(
                arcWidth: ScreenUtil.getInstance().setWidth(45).round(),
                arcRendererDecorators: [
                  new charts.ArcLabelDecorator(
                    labelPosition: charts.ArcLabelPosition.outside)]));
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales('健康', 35),
      new LinearSales('亚健康', 15),
      new LinearSales('疾病', 0),
      new LinearSales('未佩戴', 10),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.sales,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (LinearSales row, _) => '${row.year}',
      )
    ];
  }
}

class LinearSales {
  final String year;
  final int sales;

  LinearSales(this.year, this.sales);
}