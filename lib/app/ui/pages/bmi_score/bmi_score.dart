import 'package:bmi_firebase_app/app/controllers/bmi_score_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiScore extends GetView<BmiScoreController> {
  const BmiScore({super.key});

  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
      title: const GaugeTitle(
          text: 'BMİ SCORE',
          textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      axes: <RadialAxis>[
        RadialAxis(
          ///////////
          showLabels: false,
          showAxisLine: false,
          showTicks: false,
          maximum: 40,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: 18.5,
              color: const Color(0xFF639DCE),
              label: 'Underweight',
              sizeUnit: GaugeSizeUnit.factor,
              startWidth: 0.65,
              endWidth: 0.65,
            ),
            GaugeRange(
              startValue: 18.5,
              endValue: 24.9,
              color: const Color(0xFF41A870),
              label: 'Normal',
              startWidth: 0.65,
              endWidth: 0.65,
              sizeUnit: GaugeSizeUnit.factor,
            ),
            GaugeRange(
              startValue: 25,
              endValue: 29.9,
              color: const Color(0xFFFEC800),
              label: 'Overweight',
              sizeUnit: GaugeSizeUnit.factor,
              startWidth: 0.65,
              endWidth: 0.65,
            ),
            GaugeRange(
              startValue: 30,
              endValue: 34.9,
              color: const Color(0xFFF1720D),
              label: 'Obese',
              sizeUnit: GaugeSizeUnit.factor,
              startWidth: 0.65,
              endWidth: 0.65,
            ),
            GaugeRange(
              startValue: 35,
              endValue: 40,
              color: const Color(0xFFDE050A),
              label: 'Extremly Obese',
              sizeUnit: GaugeSizeUnit.factor,
              startWidth: 0.65,
              endWidth: 0.65,
            ),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              animationType: AnimationType.slowMiddle,
              animationDuration: 2000,
              enableAnimation: true,
              value: double.parse(controller.bmImodel!.bmiScore!.toString()),
              needleLength: 0.7,
              knobStyle: const KnobStyle(
                knobRadius: 20,
                sizeUnit: GaugeSizeUnit.logicalPixel,
              ),
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: Text(
                        controller.bmImodel == null
                            ? " 0.0"
                            : double.parse(
                                    controller.bmImodel!.bmiScore!.toString())
                                .ceilToDouble()
                                .toString(),
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.5)
          ],
        )
      ],
    );
  }

  Widget _getLinearGauge() {
    return Container(
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: const LinearTickStyle(length: 20),
          axisLabelStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: const LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
      margin: const EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.getData(true);
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                controller.downDate();
              },
              icon: Icon(Icons.arrow_back)),
          actions: [
            IconButton(
                onPressed: () {
                  controller.upDate();
                },
                icon: Icon(Icons.arrow_forward))
          ],
          title: Text(DateFormat("y-MM-dd").format(controller.onlyDate.value!)),
        ),
        body: Obx(() {
          return controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : _getGauge();
        }),
      );
    });
  }
}
