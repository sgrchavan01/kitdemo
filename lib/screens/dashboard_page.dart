import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitdemo/controller/lead_controller.dart';

import '../utility/common.dart';
import '../widgets/nodata_widget.dart';
import '../widgets/progress_widget.dart';
import 'leadlist_page.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  final homeScreenCtrl = Get.put(LeadScreenController());
  List<String> location = ['All Lead'];
  String dropdownValue = "All Lead";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Lead"),
        leading: GestureDetector(
          onTap: () {
            /* Write listener code here */
          },
          child: Icon(
            Icons.menu, // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  showLogoutDailog(context);
                },
                child: Icon(Icons.logout),
              )),
        ],
      ),
      body: Container(
          height: size.height,
          width: size.height,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: body(),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    ));
  }

  Widget body() {
    return GetBuilder<LeadScreenController>(builder: (_) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

        homeScreenCtrl.loading == true
            ? Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.white,
                child: const Center(
                  child: ProgressBarWidget(),
                ),
              )
            : homeScreenCtrl.leadListModel?.details != null &&
                    homeScreenCtrl.leadListModel?.details?.length != 0
                ? LeadListPage(LeadData: homeScreenCtrl.leadListModel?.details)
                : NoDataWidget()
      ]);
    });
  }
}
