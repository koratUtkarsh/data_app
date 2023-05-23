import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Insert_screen/Controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IncomeControllor incomeControllor = Get.put(
    IncomeControllor(),
  );

  @override
  void initState() {
    super.initState();

    incomeControllor.TotalIncome();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.all(10),
                  child: Container(
                    height: 50,width: 50,
                    decoration: BoxDecoration(
                       // color: Colors.blueAccent
                    ),
                    child: Icon(Icons.currency_pound_outlined),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(10),
                  child: Container(
                    height: 50,width: 230,
                    decoration: BoxDecoration(
                       border: Border.all(color: Colors.black,width: 1),
                      borderRadius: BorderRadius.circular(30),
                        //color: Colors.blueAccent
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 10,),
                        Text("Search Payment"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(10),
                  child: Container(
                    height: 50,width: 50,
                    decoration: BoxDecoration(
                        //color: Colors.blueAccent
                    ),
                    child: Icon(Icons.notifications),
                  ),
                ),
              ],
            ),

            // Container(
            //   margin: EdgeInsets.all(6),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10), color: Colors.green),
            //   child: Row(
            //     children: [
            //       IconButton(
            //           onPressed: () {},
            //           icon: Icon(
            //             Icons.navigate_before,
            //             color: Colors.white,
            //           )),
            //       IconButton(
            //           onPressed: () {},
            //           icon: Icon(
            //             Icons.calendar_month_outlined,
            //             color: Colors.white,
            //           )),
            //       Text("may,2023", style: TextStyle(color: Colors.white)),
            //       Spacer(),
            //       IconButton(
            //           onPressed: () {},
            //           icon: Icon(Icons.navigate_next, color: Colors.white)),
            //     ],
            //   ),
            // ),
            SizedBox(height: 20,),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueAccent.shade400),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Total Income",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "^00",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 180,
                    //  margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber.shade400,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Total Expence",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "00",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Container(
            //   height: 50,
            //   width: double.infinity,
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         width: 100,
            //         alignment: Alignment.center,
            //         child: Text("Cate Name"),
            //       ),
            //       Container(
            //         width: 100,
            //         alignment: Alignment.center,
            //         child: Text("Amount"),
            //       ),
            //       Container(
            //         width: 100,
            //         alignment: Alignment.center,
            //         child: Text("payTypes"),
            //       ),
            //       Container(
            //         width: 100,
            //         alignment: Alignment.center,
            //         child: Text("Date"),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                  child: Text("Transaction",style: TextStyle(fontSize: 20))),
            ),
            Obx(
                  () => Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        color: incomeControllor.incomeExapnce[index]['stats'] ==
                            "0"
                            ? Colors.green.shade200
                            : Colors.red.shade200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              alignment: Alignment.center,
                              child: Text(
                                  "${incomeControllor.incomeExapnce[index]['category']}"),
                            ),
                            Container(
                              width: 50,
                              alignment: Alignment.center,
                              child: Text(
                                  "${incomeControllor.incomeExapnce[index]['amount']}"),
                            ),
                            Container(
                              width: 50,
                              alignment: Alignment.center,
                              child: Text(
                                  "${incomeControllor.incomeExapnce[index]['paytypes']}"),
                            ),
                            Container(
                              width: 100,
                              alignment: Alignment.center,
                              child: Text(
                                  "${incomeControllor.incomeExapnce[index]['date']}"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: incomeControllor.incomeExapnce.length,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: () {

          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}