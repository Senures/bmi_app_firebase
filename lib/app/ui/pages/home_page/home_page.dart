// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';
import '../../../routes/app_pages.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.getAsyncData();
    return Scaffold(
        appBar: AppBar(
          title: Text('HomePage'),
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAndToNamed(Routes.LOGIN);
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Obx(() {
          return controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 28,
                        right: 28,
                      ),
                      child: AspectRatio(
                        aspectRatio: 1.23,
                        child: Stack(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Statistic',
                                  style: TextStyle(
                                    color: Color(0xff827daa),
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 37,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16, left: 6),
                                    child: LineChart(
                                      LineChartData(
                                        gridData: FlGridData(show: false),
                                        titlesData: FlTitlesData(
                                          bottomTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                            showTitles: true,
                                            reservedSize: 32,
                                            interval: 1,
                                            getTitlesWidget: bottomTitleWidgets,
                                          )),
                                          rightTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false),
                                          ),
                                          topTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false),
                                          ),
                                          leftTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                            getTitlesWidget: leftTitleWidgets,
                                            showTitles: true,
                                            interval: 1,
                                            reservedSize: 40,
                                          )),
                                        ),
                                        borderData: FlBorderData(
                                          show: true,
                                          border: const Border(
                                            bottom: BorderSide(
                                                color: Color(0xff4e4965),
                                                width: 4),
                                            left: BorderSide(
                                                color: Colors.transparent),
                                            right: BorderSide(
                                                color: Colors.transparent),
                                            top: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                        ),
                                        lineBarsData: [
                                          LineChartBarData(
                                            isCurved: true,
                                            color: const Color(0xff4af699),
                                            barWidth: 5,
                                            isStrokeCapRound: true,
                                            dotData: FlDotData(show: false),
                                            belowBarData:
                                                BarAreaData(show: false),
                                            spots: List.generate(
                                              controller.modelData.length,
                                              (index) => FlSpot(
                                                  (index + 1) * 2,
                                                  (int.parse((controller
                                                                  .modelData[
                                                                      index]
                                                                  .kilo ??
                                                              0)
                                                          .toString())
                                                      .toDouble())),
                                            ),
                                          ),
                                        ],
                                        minX: 0,
                                        maxX: 14,
                                        maxY: 120,
                                        minY: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Goal",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Spacer(),
                                      Center(
                                        child: Text(
                                          (controller.userModel!.goal ?? "0")
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 36,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "kg",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffFFA86D),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Current \nWeight",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Spacer(),
                                      Center(
                                        child: Text(
                                          (controller.userModel!.kilo ?? "0")
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 50,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "kg",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        }));
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff72719b),
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MON', style: style);
        break;
      case 4:
        text = const Text('TUE', style: style);
        break;
      case 6:
        text = const Text('WED', style: style);
        break;
      case 8:
        text = const Text('THU', style: style);
        break;
      case 10:
        text = const Text('FRI', style: style);
        break;
      case 12:
        text = const Text('SAT', style: style);
        break;
      case 14:
        text = const Text('SUN', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff75729e),
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 20:
        text = '20';
        break;
      case 40:
        text = '40';
        break;
      case 60:
        text = '60';
        break;
      case 80:
        text = '80';
        break;

      case 100:
        text = '100';
        break;
      case 120:
        text = '120';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }
}
