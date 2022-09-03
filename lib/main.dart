import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitdemo/screens/dashboard_page.dart';
import 'package:kitdemo/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
          var x = prefs.data;
          if (x != null) {
            var data = x.getString("accesstoken").toString();
            if (data != "null" && data.isNotEmpty) {
              print(data);
              return customMaterial(dashboardscreen);
            }
          }
          return customMaterial(welcomescreen);
        });


  }


   Widget customMaterial(Widget screens) {
     return GetMaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Kit19',
       theme: ThemeData(
         fontFamily: 'Montserrat',
         primarySwatch: Colors.green,
       ),
       home: screens,
     );
   }
  Widget welcomescreen = SplashScreenView(
    navigateRoute: LoginPage(),
    duration: 5000,
    imageSize: 130,
    imageSrc: "assets/images/kit_app.png",
    backgroundColor: Colors.white,
  );

  Widget dashboardscreen = SplashScreenView(
    navigateRoute: DashboardScreen(),
    duration: 5000,
    imageSize: 130,
    imageSrc: "assets/images/kit_app.png",
    backgroundColor: Colors.white,
  );
}
