import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_app/models/register_user.dart';

enum PrefKeys { loggedIn, name, phone , email, token }


class SharedPrefController {
   static final SharedPrefController _instance = SharedPrefController._();

  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //required String token 
Future<void> save ({required RegisterUser user,required var token }) async {
print('dddddddddd');
await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
await _sharedPreferences.setString(PrefKeys.name.toString(), user.name);
await _sharedPreferences.setString(PrefKeys.phone.toString(), user.phone);
await _sharedPreferences.setString(PrefKeys.email.toString(), user.email);
await _sharedPreferences.setString(PrefKeys.token.toString(), 'Bearer '+ token);









}


 bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  String get token =>
      _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';

  String get name =>
      _sharedPreferences.getString(PrefKeys.name.toString())??'';

  String get mobile =>
      _sharedPreferences.getString(PrefKeys.phone.toString())??'';

  String get gender =>
      _sharedPreferences.getString(PrefKeys.email.toString())??'';




  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

}