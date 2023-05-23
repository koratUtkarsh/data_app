import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Insert_screen/Controller/home_controller.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  IncomeControllor incomeControllor = Get.put(IncomeControllor());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("All Transaction", style: TextStyle(color: Colors.black)),
          // actions: [
          //   Obx(
          //         () =>
          //         DropdownButton(
          //           value: incomeControllor.Filter.value,
          //           items: [
          //             DropdownMenuItem(child: Text("Income"), value: "0"),
          //             DropdownMenuItem(child: Text("Expnces"), value: "1"),
          //           ],
          //           onChanged: (value) {
          //             incomeControllor.Filter.value = value!;
          //             incomeControllor.Filterdata(staus: value);
          //           },
          //         ),
          //   )
          // ],
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.blueAccent.shade400,
        body: Obx(
          () => ListView.builder(
            itemCount: incomeControllor.incomeExapnce.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: incomeControllor.incomeExapnce[index]['stats'] == "0"
                        ? Colors.green.shade200
                        : Colors.red.shade200,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Category : ${incomeControllor.incomeExapnce[index]['category']}",
                            ),
                            Text(
                              "Amount : ${incomeControllor.incomeExapnce[index]['amount']}",
                            ),
                            Text(
                              "Pay Types : ${incomeControllor.incomeExapnce[index]['paytypes']}",
                            ),
                            Text(
                              "Date : ${incomeControllor.incomeExapnce[index]['date']}",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                incomeControllor.paytypesu.value =
                                    "${incomeControllor.incomeExapnce[index]['paytypes']}";
                                incomeControllor.statusu.value =
                                    "${incomeControllor.incomeExapnce[index]['stats']}";
                                incomeControllor.txtAmountu = TextEditingController(
                                    text:
                                        "${incomeControllor.incomeExapnce[index]['amount']}");
                                incomeControllor.txtcateu = TextEditingController(
                                    text:
                                        "${incomeControllor.incomeExapnce[index]['category']}");
                                incomeControllor.txtdatau = TextEditingController(
                                    text:
                                        "${incomeControllor.incomeExapnce[index]['date']}");

                                Get.defaultDialog(
                                  title: "Update",
                                  content: Column(
                                    children: [
                                      TextField(
                                        controller: incomeControllor.txtcateu,
                                        decoration: InputDecoration(
                                          label: Text("Category"),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: incomeControllor.txtAmountu,
                                        decoration: InputDecoration(
                                          label: Text("Amount"),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: incomeControllor.txtdatau,
                                        decoration: InputDecoration(
                                          label: Text("Date"),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => DropdownButton(
                                          value:
                                              incomeControllor.paytypesu.value,
                                          isExpanded: true,
                                          items: [
                                            DropdownMenuItem(
                                              child: Text(
                                                "Online",
                                              ),
                                              value: "online",
                                            ),
                                            DropdownMenuItem(
                                              child: Text(
                                                "Offline",
                                              ),
                                              value: "offline",
                                            ),
                                          ],
                                          onChanged: (value) {
                                            // Text(incomeControllor.updat.value,style: TextStyle(fontSize: 0,color: Colors.transparent),);
                                            setState(() {
                                              incomeControllor.paytypesu.value =
                                                  value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Obx(
                                        () => DropdownButton(
                                          value: incomeControllor.statusu.value,
                                          isExpanded: true,
                                          items: [
                                            DropdownMenuItem(
                                              child: Text(
                                                "Income",
                                              ),
                                              value: "0",
                                            ),
                                            DropdownMenuItem(
                                              child: Text(
                                                "Expance",
                                              ),
                                              value: "1",
                                            ),
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              incomeControllor.statusu.value =
                                                  value!;
                                            });
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          incomeControllor.UpdateData(
                                              stats: incomeControllor
                                                  .statusu.value,
                                              paytypes: incomeControllor
                                                  .paytypesu.value,
                                              date: incomeControllor
                                                  .txtdatau.text,
                                              category: incomeControllor
                                                  .txtcateu.text,
                                              amount: incomeControllor
                                                  .txtAmountu.text,
                                              id: incomeControllor
                                                  .incomeExapnce[index]['id']);

                                          incomeControllor.readDate();
                                          Get.back();
                                        },
                                        child: Text("Change"),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: Icon(Icons.edit,
                                  color: Colors.green.shade800),
                            ),
                            IconButton(
                              onPressed: () {
                                incomeControllor.delateData(
                                    id: incomeControllor.incomeExapnce[index]
                                        ['id']);

                                print(incomeControllor.incomeExapnce[index]
                                    ['id']);

                                incomeControllor.readDate();
                              },
                              icon: Icon(Icons.delete,
                                  color: Colors.red.shade800),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
