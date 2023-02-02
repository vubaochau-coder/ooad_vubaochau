import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

class StatisticalScreen extends StatefulWidget {
  const StatisticalScreen({super.key});
  final String title = 'Statistical Screen';

  @override
  State<StatisticalScreen> createState() => _StatisticalScreenState();
}

class _StatisticalScreenState extends State<StatisticalScreen> {
  late final List<charts.Series<dynamic, String>> seriesList;
  static List<charts.Series<Statistics, String>> _createRandomData() {
    final random = Random();
    final desktopStatisticsData = [
      Statistics('2017', random.nextInt(100)),
      Statistics('2018', random.nextInt(100)),
      Statistics('2019', random.nextInt(100)),
      Statistics('2020', random.nextInt(100)),
      Statistics('2021', random.nextInt(100)),
    ];

    final tabletStatisticsData = [
      Statistics('2017', random.nextInt(100)),
      Statistics('2018', random.nextInt(100)),
      Statistics('2019', random.nextInt(100)),
      Statistics('2020', random.nextInt(100)),
      Statistics('2021', random.nextInt(100)),
    ];

    final mobileStatisticsData = [
      Statistics('2017', random.nextInt(100)),
      Statistics('2018', random.nextInt(100)),
      Statistics('2019', random.nextInt(100)),
      Statistics('2020', random.nextInt(100)),
      Statistics('2021', random.nextInt(100)),
    ];

    return [
      charts.Series<Statistics, String>(
        id: 'Statistics',
        domainFn: (Statistics statistics, _) => statistics.year,
        measureFn: (Statistics statistics, _) => statistics.statistics,
        data: desktopStatisticsData,
        fillColorFn: (Statistics statistics, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },
      ),
      charts.Series<Statistics, String>(
        id: 'Statistics',
        domainFn: (Statistics statistics, _) => statistics.year,
        measureFn: (Statistics statistics, _) => statistics.statistics,
        data: tabletStatisticsData,
        fillColorFn: (Statistics statistics, _) {
          return charts.MaterialPalette.green.shadeDefault;
        },
      ),
      charts.Series<Statistics, String>(
        id: 'Statistics',
        domainFn: (Statistics statistics, _) => statistics.year,
        measureFn: (Statistics statistics, _) => statistics.statistics,
        data: mobileStatisticsData,
        fillColorFn: (Statistics statistics, _) {
          return charts.MaterialPalette.teal.shadeDefault;
        },
      ),
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarLaneRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
      domainAxis: const charts.OrdinalAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
      ),
    );
  }

  pieChart() {
    return charts.PieChart(
      seriesList,
      animate: true,
    );
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(215, 24, 167, 176),
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: barChart(),
      ),
    );
  }
}

class Statistics {
  final String year;
  final int statistics;

  Statistics(this.year, this.statistics);
}
