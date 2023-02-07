import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatisticalAnimationScreen extends StatefulWidget {
  const StatisticalAnimationScreen({super.key});

  final String title = 'Statistical Screen';
  @override
  State<StatisticalAnimationScreen> createState() =>
      _StatisticalAnimationScreenState();
}

class _StatisticalAnimationScreenState
    extends State<StatisticalAnimationScreen> {
  late List<charts.Series<DayWork, String>> _seriesData;
  late List<charts.Series<Statistical, String>> _seriesPieData;
  late List<charts.Series<Project, int>> _seriesLineData;
  _generateData() {
    var data1 = [
      DayWork('UI/UX', 9, 30),
      DayWork('DEV', 9, 40),
      DayWork('Tester', 9, 10)
    ];
    var data2 = [
      DayWork('UI/UX', 10, 100),
      DayWork('DEV', 9, 150),
      DayWork('Tester', 10, 80)
    ];
    var data3 = [
      DayWork('UI/UX', 10, 200),
      DayWork('DEV', 9, 300),
      DayWork('Tester', 10, 180)
    ];

    var lineprojectdata = [
      Project(0, 45),
      Project(1, 56),
      Project(2, 55),
      Project(3, 60),
      Project(4, 61),
      Project(5, 70),
    ];
    var lineprojectdata1 = [
      Project(0, 35),
      Project(1, 46),
      Project(2, 45),
      Project(3, 50),
      Project(4, 51),
      Project(5, 60),
    ];
    var lineprojectdata2 = [
      Project(0, 20),
      Project(1, 24),
      Project(2, 25),
      Project(3, 40),
      Project(4, 45),
      Project(5, 60),
    ];

    var pieData = [
      Statistical('UI/UX', 35.8, const Color(0xff3366cc)),
      Statistical('Front-end DEV', 15.6, const Color(0xff990099)),
      Statistical('Back-end DEV', 10.8, const Color(0xff109618)),
      Statistical('Tester', 8.3, const Color(0xfffdbe19)),
      Statistical('BA', 19.2, const Color(0xffff9900)),
      Statistical('PM', 10.3, const Color(0xffdc3912)),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (DayWork daywork, _) => daywork.position,
        measureFn: (DayWork daywork, _) => daywork.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (DayWork daywork, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );
    _seriesData.add(
      charts.Series(
        domainFn: (DayWork daywork, _) => daywork.position,
        measureFn: (DayWork daywork, _) => daywork.quantity,
        id: '2018',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (DayWork daywork, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff109618)),
      ),
    );
    _seriesData.add(
      charts.Series(
        domainFn: (DayWork daywork, _) => daywork.position,
        measureFn: (DayWork daywork, _) => daywork.quantity,
        id: '2019',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (DayWork daywork, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Statistical statistical, _) => statistical.statistical,
        measureFn: (Statistical statistical, _) => statistical.statisticalvalue,
        colorFn: (Statistical statistical, _) =>
            charts.ColorUtil.fromDartColor(statistical.colorval),
        id: 'Daily Task',
        labelAccessorFn: (Statistical row, _) => '${row.statisticalvalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Total number of projects',
        data: lineprojectdata,
        domainFn: (Project project, _) => project.yearval,
        measureFn: (Project project, _) => project.project,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Total number of projects',
        data: lineprojectdata1,
        domainFn: (Project project, _) => project.yearval,
        measureFn: (Project project, _) => project.project,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Total number of projects',
        data: lineprojectdata2,
        domainFn: (Project project, _) => project.yearval,
        measureFn: (Project project, _) => project.project,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = <charts.Series<DayWork, String>>[];
    _seriesPieData = <charts.Series<Statistical, String>>[];
    _seriesLineData = <charts.Series<Project, int>>[];
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(215, 24, 167, 176),
            bottom: const TabBar(
              indicatorColor: Color.fromARGB(215, 24, 167, 176),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ],
            ),
            title: Text(widget.title),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Day working, by company counting(in 8 hours/1 day working)',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            animationDuration: const Duration(seconds: 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Time spent on daily tasks',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: charts.PieChart(_seriesPieData,
                              animate: true,
                              animationDuration: const Duration(seconds: 5),
                              behaviors: [
                                charts.DatumLegend(
                                  outsideJustification:
                                      charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 2,
                                  cellPadding:
                                      EdgeInsets.only(right: 4.0, bottom: 4.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                      color: charts
                                          .MaterialPalette.purple.shadeDefault,
                                      fontFamily: 'Georgia',
                                      fontSize: 11),
                                )
                              ],
                              defaultRenderer: charts.ArcRendererConfig(
                                  arcWidth: 100,
                                  arcRendererDecorators: [
                                    charts.ArcLabelDecorator(
                                        labelPosition:
                                            charts.ArcLabelPosition.inside)
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Total Project for the first 5 years',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: charts.LineChart(
                            _seriesLineData,
                            defaultRenderer: charts.LineRendererConfig(
                                includeArea: true, stacked: true),
                            animate: true,
                            animationDuration: const Duration(seconds: 5),
                            behaviors: [
                              charts.ChartTitle('Years',
                                  behaviorPosition:
                                      charts.BehaviorPosition.bottom,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea),
                              charts.ChartTitle('Projects',
                                  behaviorPosition:
                                      charts.BehaviorPosition.start,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea),
                              charts.ChartTitle('Departments',
                                  behaviorPosition: charts.BehaviorPosition.end,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Statistical {
  String statistical;
  double statisticalvalue;
  Color colorval;
  Statistical(this.statistical, this.statisticalvalue, this.colorval);
}

class DayWork {
  String position;
  int month;
  int quantity;

  DayWork(this.position, this.month, this.quantity);
}

class Project {
  int yearval;
  int project;

  Project(this.yearval, this.project);
}
