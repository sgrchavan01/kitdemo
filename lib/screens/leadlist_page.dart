import 'package:flutter/material.dart';
import 'package:kitdemo/model/LeadListModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:kitdemo/screens/leaddetail_page.dart';

class LeadListPage extends StatefulWidget {
  const LeadListPage({Key? key, this.LeadData}) : super(key: key);

  final List<Details>? LeadData;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LeadListPageState();
  }
}

class LeadListPageState extends State<LeadListPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) =>
          Divider(height: 1, color: Colors.grey),
      itemCount: widget.LeadData!.length,
      itemBuilder: (BuildContext ctx, index) {
        return GestureDetector(
            onTap: () {
              setState(() {
                Get.to(LeadDetailsScreen(LeadData: widget.LeadData![index]),
                    duration: Duration(milliseconds: 500),
                    transition: Transition.rightToLeft);
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl:
                                    widget.LeadData![index].image.toString(),
                                fit: BoxFit.cover,
                                height: 60.0,
                                width: 60.0,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 35,
                              left: 35,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 12.0,
                                  child: Text(
                                    "0",
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Lead No",
                        maxLines: 4,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        widget.LeadData![index].leadNo.toString(),
                        maxLines: 4,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.LeadData![index].name.toString(),
                              maxLines: 2,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.LeadData![index].type.toString(),
                                  maxLines: 4,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.phone_android,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(child: mobileNoWidget(index))
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.mail_outline,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(child: emailWidget(index))
                              ],
                            )
                          ],
                        )),
                  )
                ],
              ),
            ));
      },
    );
  }

  Widget mobileNoWidget(int index) {
    String mobile = "NA";
    if (widget.LeadData![index].mobileNo1!.isNotEmpty &&
        widget.LeadData![index].mobileNo2!.isNotEmpty &&
        widget.LeadData![index].mobileNo3!.isNotEmpty) {
      mobile = widget.LeadData![index].mobileNo1! +
          "," +
          widget.LeadData![index].mobileNo2! +
          "," +
          widget.LeadData![index].mobileNo3!;
    } else if (widget.LeadData![index].mobileNo1!.isNotEmpty &&
        widget.LeadData![index].mobileNo2!.isNotEmpty &&
        widget.LeadData![index].mobileNo3!.isEmpty) {
      mobile = widget.LeadData![index].mobileNo1! +
          "," +
          widget.LeadData![index].mobileNo2!;
    } else if (widget.LeadData![index].mobileNo1!.isNotEmpty &&
        widget.LeadData![index].mobileNo2!.isEmpty &&
        widget.LeadData![index].mobileNo3!.isNotEmpty) {
      mobile = widget.LeadData![index].mobileNo1! +
          "," +
          widget.LeadData![index].mobileNo3!;
    } else if (widget.LeadData![index].mobileNo1!.isEmpty &&
        widget.LeadData![index].mobileNo2!.isNotEmpty &&
        widget.LeadData![index].mobileNo3!.isNotEmpty) {
      mobile = widget.LeadData![index].mobileNo2! +
          "," +
          widget.LeadData![index].mobileNo3!;
    } else if (widget.LeadData![index].mobileNo1!.isNotEmpty &&
        widget.LeadData![index].mobileNo2!.isEmpty &&
        widget.LeadData![index].mobileNo3!.isEmpty) {
      mobile = widget.LeadData![index].mobileNo1!;
    } else if (widget.LeadData![index].mobileNo1!.isEmpty &&
        widget.LeadData![index].mobileNo2!.isNotEmpty &&
        widget.LeadData![index].mobileNo3!.isEmpty) {
      mobile = widget.LeadData![index].mobileNo2!;
    } else if (widget.LeadData![index].mobileNo1!.isEmpty &&
        widget.LeadData![index].mobileNo2!.isEmpty &&
        widget.LeadData![index].mobileNo3!.isNotEmpty) {
      mobile = widget.LeadData![index].mobileNo3!;
    }
    return Text(
      mobile,
      maxLines: 4,
      style: TextStyle(color: Colors.grey, fontSize: 12),
    );
  }

  Widget emailWidget(int index) {
    String mobile = "NA";
    if (widget.LeadData![index].emailId1!.isNotEmpty &&
        widget.LeadData![index].emailId2!.isNotEmpty &&
        widget.LeadData![index].emailId3!.isNotEmpty) {
      mobile = widget.LeadData![index].emailId1! +
          "," +
          widget.LeadData![index].emailId2! +
          "," +
          widget.LeadData![index].emailId3!;
    } else if (widget.LeadData![index].emailId1!.isNotEmpty &&
        widget.LeadData![index].emailId2!.isNotEmpty &&
        widget.LeadData![index].emailId3!.isEmpty) {
      mobile = widget.LeadData![index].emailId1! +
          "," +
          widget.LeadData![index].emailId2!;
    } else if (widget.LeadData![index].emailId1!.isNotEmpty &&
        widget.LeadData![index].emailId2!.isEmpty &&
        widget.LeadData![index].emailId3!.isNotEmpty) {
      mobile = widget.LeadData![index].emailId1! +
          "," +
          widget.LeadData![index].emailId3!;
    } else if (widget.LeadData![index].emailId1!.isEmpty &&
        widget.LeadData![index].emailId2!.isNotEmpty &&
        widget.LeadData![index].emailId3!.isNotEmpty) {
      mobile = widget.LeadData![index].emailId2! +
          "," +
          widget.LeadData![index].emailId3!;
    } else if (widget.LeadData![index].emailId1!.isNotEmpty &&
        widget.LeadData![index].emailId2!.isEmpty &&
        widget.LeadData![index].emailId3!.isEmpty) {
      mobile = widget.LeadData![index].emailId1!;
    } else if (widget.LeadData![index].emailId1!.isEmpty &&
        widget.LeadData![index].emailId2!.isNotEmpty &&
        widget.LeadData![index].emailId3!.isEmpty) {
      mobile = widget.LeadData![index].emailId2!;
    } else if (widget.LeadData![index].emailId1!.isEmpty &&
        widget.LeadData![index].emailId2!.isEmpty &&
        widget.LeadData![index].emailId3!.isNotEmpty) {
      mobile = widget.LeadData![index].emailId3!;
    }
    return Text(
      mobile,
      maxLines: 4,
      style: TextStyle(color: Colors.grey, fontSize: 12),
    );
  }
}
