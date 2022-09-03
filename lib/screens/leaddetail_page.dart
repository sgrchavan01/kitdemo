import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitdemo/model/LeadListModel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LeadDetailsScreen extends StatelessWidget {
  const LeadDetailsScreen({Key? key, this.LeadData}) : super(key: key);

  final Details? LeadData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Lead"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: LeadData!.image.toString(),
                          fit: BoxFit.cover,
                          height: 60.0,
                          width: 60.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LeadData!.name.toString(),
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
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
                            Expanded(child: emailWidget())
                          ],
                        )
                      ],
                    ))
                  ],
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      Expanded(child: mobileNoWidget())
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child:  Text(
                        "ID :",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )),
                  Expanded(
                    child:  Text(
                        LeadData!.id.toString(),
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                    ))
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        "Lead No :",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )),
                      Expanded(
                        child:  Text(
                        LeadData!.leadNo.toString(),
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ))
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Expanded(
                        child:  Text(
                        "Type :",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )),
                      Expanded(
                        child:Text(
                        LeadData!.type.toString(),
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget emailWidget() {
    String mobile = "NA";
    if (LeadData!.emailId1!.isNotEmpty &&
        LeadData!.emailId2!.isNotEmpty &&
        LeadData!.emailId3!.isNotEmpty) {
      mobile = LeadData!.emailId1! +
          "," +
          LeadData!.emailId2! +
          "," +
          LeadData!.emailId3!;
    } else if (LeadData!.emailId1!.isNotEmpty &&
        LeadData!.emailId2!.isNotEmpty &&
        LeadData!.emailId3!.isEmpty) {
      mobile = LeadData!.emailId1! + "," + LeadData!.emailId2!;
    } else if (LeadData!.emailId1!.isNotEmpty &&
        LeadData!.emailId2!.isEmpty &&
        LeadData!.emailId3!.isNotEmpty) {
      mobile = LeadData!.emailId1! + "," + LeadData!.emailId3!;
    } else if (LeadData!.emailId1!.isEmpty &&
        LeadData!.emailId2!.isNotEmpty &&
        LeadData!.emailId3!.isNotEmpty) {
      mobile = LeadData!.emailId2! + "," + LeadData!.emailId3!;
    } else if (LeadData!.emailId1!.isNotEmpty &&
        LeadData!.emailId2!.isEmpty &&
        LeadData!.emailId3!.isEmpty) {
      mobile = LeadData!.emailId1!;
    } else if (LeadData!.emailId1!.isEmpty &&
        LeadData!.emailId2!.isNotEmpty &&
        LeadData!.emailId3!.isEmpty) {
      mobile = LeadData!.emailId2!;
    } else if (LeadData!.emailId1!.isEmpty &&
        LeadData!.emailId2!.isEmpty &&
        LeadData!.emailId3!.isNotEmpty) {
      mobile = LeadData!.emailId3!;
    }
    return Text(
      mobile,
      maxLines: 4,
      style: TextStyle(color: Colors.grey, fontSize: 12),
    );
  }

  mobileNoWidget() {
    String mobile = "NA";
    if (LeadData!.mobileNo1!.isNotEmpty &&
        LeadData!.mobileNo2!.isNotEmpty &&
        LeadData!.mobileNo3!.isNotEmpty) {
      mobile = LeadData!.mobileNo1! +
          "," +
          LeadData!.mobileNo2! +
          "," +
          LeadData!.mobileNo3!;
    } else if (LeadData!.mobileNo1!.isNotEmpty &&
        LeadData!.mobileNo2!.isNotEmpty &&
        LeadData!.mobileNo3!.isEmpty) {
      mobile = LeadData!.mobileNo1! + "," + LeadData!.mobileNo2!;
    } else if (LeadData!.mobileNo1!.isNotEmpty &&
        LeadData!.mobileNo2!.isEmpty &&
        LeadData!.mobileNo3!.isNotEmpty) {
      mobile = LeadData!.mobileNo1! + "," + LeadData!.mobileNo3!;
    } else if (LeadData!.mobileNo1!.isEmpty &&
        LeadData!.mobileNo2!.isNotEmpty &&
        LeadData!.mobileNo3!.isNotEmpty) {
      mobile = LeadData!.mobileNo2! + "," + LeadData!.mobileNo3!;
    } else if (LeadData!.mobileNo1!.isNotEmpty &&
        LeadData!.mobileNo2!.isEmpty &&
        LeadData!.mobileNo3!.isEmpty) {
      mobile = LeadData!.mobileNo1!;
    } else if (LeadData!.mobileNo1!.isEmpty &&
        LeadData!.mobileNo2!.isNotEmpty &&
        LeadData!.mobileNo3!.isEmpty) {
      mobile = LeadData!.mobileNo2!;
    } else if (LeadData!.mobileNo1!.isEmpty &&
        LeadData!.mobileNo2!.isEmpty &&
        LeadData!.mobileNo3!.isNotEmpty) {
      mobile = LeadData!.mobileNo3!;
    }
    return Text(
      mobile,
      maxLines: 4,
      style: TextStyle(color: Colors.grey, fontSize: 12),
    );
  }
}
