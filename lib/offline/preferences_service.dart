import 'package:food_delivery_app/models/user.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future saveEmailAndPassword(User user) async {
    final _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(emailKey, user.email);
    await _preferences.setString(passwordKey, user.password);
  }

  Future<User> getEmailAndPassword() async {
    final _preferences = await SharedPreferences.getInstance();
    final email = _preferences.getString(emailKey);
    final password = _preferences.getString(passwordKey);

    return User(email: email!, password: password!);
  }
}
