import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kingcoconut/constants/app_colors.dart';
import 'package:kingcoconut/screens/charts/product_sales_chart.dart';
import 'package:kingcoconut/screens/charts/product_price_chart.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.appColorBlack,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ProductSalesChart.withSampleData(),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ProductPriceChart.withSampleData(),
          )),
        ],
      ),
    );
  }
}
