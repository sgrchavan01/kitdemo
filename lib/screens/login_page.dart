import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../widgets/button_widget.dart';
import '../widgets/progress_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authCtrl = Get.put(AuthScreenController());
  final _usernamekey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: size.height * 0.15),
                          child: appIcon()),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.05),
                        child: Align(
                          child: Text(
                            'Hey there,',
                            style: TextStyle(
                              color: const Color(0xff1D1617),
                              fontSize: size.height * 0.025,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.010),
                        child: Align(
                          child: Text(
                            'Welcome Back',
                            style: TextStyle(
                              color: const Color(0xff1D1617),
                              fontSize: size.height * 0.030,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                      ),
                      buildTextField("UserName", Icons.person, false, size,
                          (valuename) {
                        if (valuename.toString().isEmpty) {
                          buildSnackError(
                            'Please Enter UserName',
                            context,
                            size,
                          );
                          return '';
                        }
                        return null;
                      }, _usernamekey, authCtrl.usernametxtController,
                          TextInputType.text),
                      Form(
                          child: buildTextField(
                              "Enter Password", Icons.lock_outline, true, size,
                              (valuepassword) {
                        if (valuepassword.toString().isEmpty) {
                          buildSnackError(
                            'Please Enter Password',
                            context,
                            size,
                          );
                          return '';
                        }
                        return null;
                      }, _passwordKey, authCtrl.passwordController,
                              TextInputType.text)),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(top: size.height * 0.025),
                        child: GetBuilder<AuthScreenController>(builder: (_) {
                          return authCtrl.loading == true
                              ? ProgressBarWidget()
                              : ButtonWidget(
                                  text: "Login",
                                  onPressed: () async {
                                    if(_usernamekey.currentState!.validate() &&
                                        _passwordKey.currentState!.validate()) {
                                      authCtrl.verifyLogin(
                                          authCtrl.usernametxtController.text,
                                          authCtrl.passwordController.text);
                                    }
                                  },
                                );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool pwVisible = false;

  Widget appIcon() {
    return Image.asset(
      'assets/images/kit_app.png',
      width: 150.0,
      height: 100.0,
      fit: BoxFit.cover,
    );
  }

  Widget buildTextField(
    String hintText,
    IconData icon,
    bool password,
    size,
    FormFieldValidator validator,
    Key key,
    TextEditingController controller,
    TextInputType txtinputType,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.015),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.08,
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Form(
          key: key,
          child: TextFormField(
            controller: controller,
            style: TextStyle(color: Colors.black),
            onChanged: (value) {
              setState(() {});
            },
            validator: validator,
            keyboardType: txtinputType,
            textInputAction: TextInputAction.next,
            obscureText: password ? !pwVisible : false,
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              hintStyle: const TextStyle(
                color: Color(0xffADA4A5),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: size.height * 0.025,
              ),
              hintText: hintText,
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.007,
                ),
                child: Icon(
                  icon,
                  color: const Color(0xff7B6F72),
                ),
              ),
              suffixIcon: password
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.005,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            pwVisible = !pwVisible;
                          });
                        },
                        child: pwVisible
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                color: Color(0xff7B6F72),
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                color: Color(0xff7B6F72),
                              ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: SizedBox(
          height: size.height * 0.02,
          child: Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}
