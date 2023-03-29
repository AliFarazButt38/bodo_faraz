import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../Theme/palette.dart';
import '../../Utils/screen_config.dart';

Widget PieChartWidget(BuildContext context){
  ScreenConfig().init(context);
  return  Padding(
    padding: const EdgeInsets.only(left: 20.0,right: 20),
    child: Container(
      height: 236,
      width: ScreenConfig.screenWidth,

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Tasks', style: TextStyle(color: Palette.black,fontSize: 18,fontWeight: FontWeight.bold),),
          ),

          PieChart(
            dataMap: {
              "Watch Videos": 5,
              "Social Media": 3,
              "Surveys": 2,
              "Invite Friends": 2,
              "Others": 2,
            },
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            colorList: [
              Palette.orange,
              Palette.lightGreen,
              Palette.darkGreen,
              Palette.ligtBlue,
              Palette.darkBlue,
            ],
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 20,
            centerText: "145 \n level 2",
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: false,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
            // gradientList: ---To add gradient colors---
            // emptyColorGradient: ---Empty Color gradient---
          ),
        ],
      ),
    ),
  );
}