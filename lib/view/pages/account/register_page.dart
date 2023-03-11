import 'package:auth_buttons/auth_buttons.dart';
import 'package:chat39/controller/data/remote/cubit/cubit_account/cubitt_account_cubit.dart';
import 'package:chat39/utilities/app_string.dart';
import 'package:chat39/utilities/color.dart';
import 'package:chat39/utilities/const.dart';
import 'package:chat39/view/widgets/default_form_field.dart';
import 'package:chat39/view/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool? isPassword;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    tAccountCubit cubit = tAccountCubit.get(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                width: w,
                height: h * 0.70,
                decoration: const BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    // bottomRight: Radius.circular(50),
                    // topLeft: Radius.circular(50),
                    topRight: Radius.circular(100),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultText(
                          text: AppStrings.registerTitle,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DefaultFormField(
                            labelText: AppStrings.name,
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.length == 0) {
                                return AppStrings.name;
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        DefaultFormField(
                            labelText: AppStrings.email,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            // prefix: Icon(Icons.email),
                            validator: (value) {
                              if (value!.length == 0) {
                                return AppStrings.emailEmpty;
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("please enter valid email");
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        DefaultFormField(
                          labelText: AppStrings.password,
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<tAccountCubit, tAccountState>(
                          builder: (context, state) {
                            return SizedBox(
                              width: w * .5,
                              child: ElevatedButton(
                                onPressed: ()async {
                                  if (formKey.currentState!.validate()) {
                                    await cubit.registerByEmailAndPassword(
                                        emailController.text,
                                        passwordController.text,
                                        nameController.text);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: AppTheme.primary2Color,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                child: DefaultText(
                                  text: AppStrings.registerTitle,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GoogleAuthButton(
                              onPressed: ()async{
                                await cubit.singInByGoogle();
                              },
                              style:  AuthButtonStyle(
                                buttonType: AuthButtonType.icon,
                                iconType: AuthIconType.secondary,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            FacebookAuthButton(
                              onPressed: () {},
                              style: const AuthButtonStyle(
                                  //textStyle: TextStyle(color: Colors.black12),
                                  buttonType: AuthButtonType.icon,
                                  iconType: AuthIconType.secondary),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                            onPressed: ()async {
                              await cubit.image("cam");
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppTheme.primary2Color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            child: DefaultText(
                              text: AppStrings.chooseCamera,
                              color: Colors.white,
                              fontSize: 10.sp,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //       Text(
              //         LocaleKeys.have_account.tr(),
              //         style: const TextStyle(color: Colors.white),
              //       ),
              //       InkWell(
              //         onTap: () {
              //           Navigator.of(context).pushReplacement(
              //               MaterialPageRoute(
              //                   builder: (context) => LoginScreen()));
              //         },
              //         child: Text(
              //           LocaleKeys.Login_bottom.tr(),
              //           style: const TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 15,
              //               color: Colors.white
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // ElevatedButton(onPressed: ()async{
              //   await context.setLocale(const Locale('ar'));
              // }, child:const Text("Arabic")),
              //
              // ElevatedButton(onPressed: ()async{
              //   await context.setLocale(const Locale('en'));
              // }, child:const Text("English")),
            ],
          ),
        ),
      )),
    );
  }
}
