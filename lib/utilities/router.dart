import 'package:chat39/utilities/routes.dart';
import 'package:chat39/view/pages/account/login_screen.dart';
import 'package:chat39/view/pages/account/register_page.dart';
import 'package:chat39/view/pages/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic>onGenerate(RouteSettings route){
  switch(route.name){
    case "/":
      return MaterialPageRoute(builder: (context)=>
      const  SplashScreen(),
        settings: route,
      );
    case AppRoutes.registerPageRoute:
      return MaterialPageRoute(builder: (context)=>
        const  RegisterScreen(),
        settings: route,
      );
    case AppRoutes.loginPageRoute:
    default: return MaterialPageRoute(builder: (context)=>
        LoginScreen(),
        settings: route,
      );
  }
}









// Route<dynamic> onGenerate(RouteSettings routeSettings) {
//   switch (routeSettings.name) {
//     case AppRoutes.loginPageRoute:
//       return MaterialPageRoute(
//           builder: (_) => LoginScreen(), settings: routeSettings);
//     case AppRoutes.registerPageRoute:
//       return MaterialPageRoute(
//           builder: (_) => RegisterScreen(), settings: routeSettings);
//     case AppRoutes.homePageRoute:
//     default:
//       return MaterialPageRoute(
//           builder: (_) => HomePage(), settings: routeSettings);
//   }
// }
