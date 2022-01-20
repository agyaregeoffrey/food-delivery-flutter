import 'package:food_delivery_app/models/person.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future saveEmailAndPassword(Person user) async {
    final _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(emailKey, user.email!);
    await _preferences.setString(passwordKey, user.password!);
  }

  Future<Person>? getEmailAndPassword() async {
    final _preferences = await SharedPreferences.getInstance();
    final email = _preferences.getString(emailKey);
    final password = _preferences.getString(passwordKey);

    return Person(email: email, password: password);
  }
}
