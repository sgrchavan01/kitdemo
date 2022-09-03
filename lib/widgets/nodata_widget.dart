import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2,
      child: Center(
        child: Text(
          "Leads Not Available",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
