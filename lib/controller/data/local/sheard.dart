
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utilities/enums.dart';

class MyCache {
  static SharedPreferences? preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static putString(
      {required MySharedKeys key, required String value}) async {
    await preferences?.setString(key.name, value);
  }

  static String getString({required MySharedKeys key,}) {
    return preferences?.getString(key.name,) ?? '';
  }

  static void putBoolean(
      {required MySharedKeys key, required bool value}) async {
    await preferences?.setBool(key.name, value);
  }

  static bool getBoolean({required MySharedKeys key,}) {
    return preferences?.getBool(key.name,) ?? false;
  }

  static void putInt({required MySharedKeys key, required int value}) async {
    await preferences?.setInt(key.name, value);
  }

  static int getInt({required MySharedKeys key,}) {
    return preferences?.getInt(key.name,) ?? 0;
  }

  static void putDouble(
      {required MySharedKeys key, required double value}) async {
    await preferences?.setDouble(key.name, value);
  }

  static double getDouble({required MySharedKeys key,}) {
    return preferences?.getDouble(key.name,) ?? 0.0;
  }

  static Future<void> removeFromShared({required MySharedKeys key,}) async {
    await preferences?.remove(key.name);
  }

  static Future<void> clearShared() async {
    await preferences?.clear();
  }
}


// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../../utilities/enums.dart';
//
// //CacheHelper That's Connect and Talk to local database.
// class CacheHelper
// {
//   static late SharedPreferences sharedPreferences;
//
//   //Here The Initialize of cache .
//   static init() async
//   {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//   // this fun to put data in local data base using key
//   static Future<bool> put({required MySharedKeys key, required dynamic value,}) async {
//     if (value is String)
//     {
//       return await sharedPreferences.setString(key.name, value);
//     }
//
//     else if (value is bool)
//     {
//       return await sharedPreferences.setBool(key.name, value);
//     }
//
//     else
//     {
//       return await sharedPreferences.setInt(key.name, value);
//     }
//   }
//
//   // this fun to get data already saved in local data base
//   static dynamic get({required MySharedKeys key})
//   {
//     return sharedPreferences.get(key.name) ?? " ";
//   }
//
//   // remove data using specific key
//   static Future<bool> removeData({required MySharedKeys key})
//   async
//   {
//     return await sharedPreferences.remove(key.name);
//   }
//
// //clear all data in the local data base
//   static Future<bool> clearData() async
//   {
//     return await sharedPreferences.clear();
//   }
// }