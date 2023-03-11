import 'package:chat39/controller/data/local/sheard.dart';
import 'package:chat39/controller/data/remote/cubit/cubit_account/cubitt_account_cubit.dart';
import 'package:chat39/controller/data/remote/cubit/cubit_style/style_cubit.dart';
import 'package:chat39/controller/data/remote/cubit/observer.dart';
import 'package:chat39/firebase_options.dart';
import 'package:chat39/utilities/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await MyCache.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
     providers: [
           BlocProvider(create: (_)=>tAccountCubit()),
           BlocProvider(create: (_)=>StyleCubit()),

     ],
     child: Sizer(
          builder: (context, orientation, deviceType) {
            return  const MaterialApp(
               // home: HomePage(),
             onGenerateRoute: onGenerate,
              initialRoute: "LoginScreen",


            );
          }
          ),
   );
  }
}
