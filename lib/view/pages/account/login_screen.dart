import 'package:chat39/utilities/color.dart';
import 'package:chat39/view/widgets/default_form_field.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

          return Scaffold(
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(children: [
                        Container(
                          height: h * 0.50,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(.5),
                                    blurRadius: 7,
                                    spreadRadius: 5,
                                    offset: const Offset(0, 3)),
                              ],
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(130),
                                topRight: Radius.circular(150),
                              ),
                              color: AppTheme.primaryColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 10),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 120, left: 80),
                          child: Container(
                            height: 250,
                            width: 280,
                            decoration: const BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.withOpacity(.5),
                              //     blurRadius: 7,
                              //     spreadRadius: 5,
                              //     offset: Offset(0,3)
                              //   ),
                              // ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(130),
                                  topRight: Radius.circular(90)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 25, right: 25),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  DefaultFormField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      labelText: "Email",
                                      validator: (value) {
                                        if (value!.length == 0) {
                                          return "Email Can not be empty ";
                                        }
                                        if (!RegExp(
                                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z-9+_.-]+.[a-z]")
                                            .hasMatch(value)) {
                                          return " please enter valid email";
                                        } else {
                                          return null;
                                        }
                                      }),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  DefaultFormField(
                                      controller: passwordController,
                                      labelText: "Password",
                                      keyboardType: TextInputType.visiblePassword,
                                      validator: (value) {
                                        if (value!.length <= 6) {
                                          return "password should be return 6";
                                        }
                                        return null;
                                      }),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: w * 0.3,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                      },
                                      child:const  Text("Login"),
                                      style: ElevatedButton.styleFrom(
                                          // primary: kPrimaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(" Create new account ?"),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
"registerScreen"                                );
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: AppTheme.primaryColor),
                              ),
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
}
