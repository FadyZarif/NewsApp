import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static SharedPreferences? sharedPreferences ;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putBool({key,value}) async
  {
   return await sharedPreferences!.setBool(key, value);
  }
  static bool? getBool({key,value})
  {
    return sharedPreferences?.getBool(key);
  }
}