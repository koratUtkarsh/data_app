import 'package:data_app/Screen/Insert_screen/Income_screen/income_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/data_helper.dart';
import '../../Filter_screen/filter_screen.dart';
import '../../Home_screen/home_screen.dart';

class IncomeControllor extends GetxController {
  TextEditingController txtamount = TextEditingController();
  TextEditingController txtCate = TextEditingController();
  TextEditingController txtdate = TextEditingController(
    text:
        "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
  );
  TextEditingController txtTime = TextEditingController(
      text: "${TimeOfDay.now().hour}/${TimeOfDay.now().minute}");

  RxInt status = 0.obs;
  RxString updat = "Jenil".obs;
  RxString Filter = "0".obs;

  RxString payTypes = "online".obs;
  Rx<DateTime?> from = DateTime.now().obs;

  RxList incomeExapnce = [].obs;
  RxList cateList = [].obs;

  List Screens = [
    HomeScreen(),
    FilterScreen(),
    IncomeScreen(),
  ];
  RxInt Secrreenindex = 0.obs;

  TextEditingController txtcateu = TextEditingController();
  TextEditingController txtAmountu = TextEditingController();
  TextEditingController txtdatau = TextEditingController();
  RxString paytypesu = "".obs;
  RxString statusu = "".obs;

  dbhelper db = dbhelper();

  void insertDate({
    required category,
    required amount,
    required stats,
    required date,
    required paytypes,
  }) {
    db.insertdb(
      category: category,
      amount: amount,
      stats: stats,
      date: date,
      paytypes: paytypes,
    );
  }

  Future<void> readDate() async {
    incomeExapnce.value = await db.readdata();
  }

  void delateData({
    required id,
  }) {
    db.delateData(id: id);

    readDate();
  }

  // cate

  void insertCate({
    required cate,
  }) {
    db.insertCate(cate: cate);
  }

  Future<void> readCate() async {
    cateList.value = await db.readCate();
  }

  void Filterdata({required staus}) {
    db.FilterData(staus: staus);
  }

  void UpdateData({
    required stats,
    required paytypes,
    required date,
    required category,
    required amount,
    required id,
  }) {
    db.Update(
        stats: stats,
        paytypes: paytypes,
        date: date,
        category: category,
        amount: amount,
        id: id);
  }

  var total;

  void TotalIncome() {
    total = db.TotalIncome();
  }
}
