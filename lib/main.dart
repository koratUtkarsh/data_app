import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'Screen/Filter_screen/filter_screen.dart';
import 'Screen/Home_screen/home_screen.dart';
import 'Screen/Insert_screen/Income_screen/income_screen.dart';
import 'Screen/read_data/read_screen.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: '/',
            page: () => ReadScreen(),
          ),
          GetPage(
            name: '/Income',
            page: () =>  IncomeScreen(),
          ),
          GetPage(
            name: '/home',
            page: () =>  HomeScreen(),
          ),
          GetPage(
            name: '/filter',
            page: () =>  FilterScreen(),
          ),
        ],
      ),
    ),
  );
}