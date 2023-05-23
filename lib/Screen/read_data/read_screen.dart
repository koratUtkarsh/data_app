import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Insert_screen/Controller/home_controller.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  IncomeControllor incomeControllor = Get.put(
    IncomeControllor(),
  );

  @override
  void initState() {
    super.initState();

    incomeControllor.readDate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: incomeControllor.Screens[incomeControllor.Secrreenindex.value],
          bottomNavigationBar: FlashyTabBar(
            selectedIndex: incomeControllor.Secrreenindex.value,
            items: [
              FlashyTabBarItem(
                  inactiveColor: Colors.red,
                  icon: Icon(Icons.home), title: Text("Home")),
              FlashyTabBarItem(icon: IconButton(onPressed: () {
                Get.toNamed('/Income');
              }, icon: Icon(Icons.add),), title: Text("Filter")),
              FlashyTabBarItem(icon: Icon(Icons.filter_alt_outlined), title: Text("Filter")),

            ],
            onItemSelected: (value) {
              setState(() {
                incomeControllor.Secrreenindex.value = value;
              });
            },
          )),
    );
  }
}
