import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/user.dart';
import '../../util/apiQuery.dart';
import '../../util/preferenceKeys.dart';
import '../../util/abstracts/disposable.dart';

class AccountBloc extends Disposable {
  final _name = GetIt.instance.get<BehaviorSubject>(instanceName: 'Name');
  final _phoneNumber =
      GetIt.instance.get<BehaviorSubject>(instanceName: 'PhoneNumber');
  final _email = GetIt.instance.get<BehaviorSubject>(instanceName: 'Email');
  final _password =
      GetIt.instance.get<BehaviorSubject>(instanceName: 'Password');
  final _myAccount =
      GetIt.instance.get<BehaviorSubject<User>>(instanceName: 'MyAccount');

  final _api = GetIt.instance.get<ApiQuery>();
  final _preference = GetIt.instance.get<SharedPreferences>();

  Stream<String> get nameValidationStream =>
      _name.map((data) => validateName(data));

  Stream<String> get emailValidationStream =>
      _email.map((data) => validateEmail(data));

  Stream<String> get phoneNumberValidationStream =>
      _phoneNumber.map((data) => validatePhoneNumber(data));

  Stream<String> get passwordValidationStream =>
      _password.map((data) => validatePassword(data));
  Stream<User> get myAccountStream =>
      _myAccount.map((data) => data);

  void onNameChanged(String name) => _name.add(name);

  void onEmailChanged(String email) => _email.add(email);

  void onPhoneNumberChanged(String userName) => _phoneNumber.add(userName);

  void onPasswordChanged(String password) => _password.add(password);

  String validateName(String textFieldInput) {
    if (textFieldInput == '' || textFieldInput == null)
      return '';
    else if (isNameValid(textFieldInput))
      return '';
    else
      return 'Name must be at least 5 characters long and two words';
  }

  bool isNameValid(String textFieldInput) =>
      (textFieldInput.contains(' ') && textFieldInput.length > 5)
          ? true
          : false;

  String validatePhoneNumber(String textFieldInput) {
    if (textFieldInput == '' || textFieldInput == null)
      return '';
    else if (isPhoneNumberValid(textFieldInput))
      return '';
    else
      return 'Invalid phone number';
  }

  bool isPhoneNumberValid(String textFieldInput) =>
      textFieldInput.length == 9 && textFieldInput.length == 10 ? true : false;

  String validateEmail(String textFieldInput) {
    if (textFieldInput == '' || textFieldInput == null)
      return '';
    else if (isEmailValid(textFieldInput))
      return '';
    else
      return 'Invalid email';
  }

  bool isEmailValid(String textFieldInput) => (textFieldInput.length > 11 &&
          textFieldInput.contains('.com') &&
          textFieldInput.contains('@'))
      ? true
      : false;

  String validatePassword(String textFieldInput) {
    if (textFieldInput == '' || textFieldInput == null)
      return '';
    else if (isPasswordValid(textFieldInput))
      return '';
    else
      return 'Password must be at least 4 characters long';
  }

  bool isPasswordValid(String textFieldInput) =>
      textFieldInput.length > 4 ? true : false;

  void clearStreams() {
    _name.add(null);
    _phoneNumber.add(null);
    _email.add(null);
    _password.add(null);
  }

  Future<bool> onSignUp() async {
    if (isNameValid(_name.value) &&
        isEmailValid(_email.value) &&
        isPhoneNumberValid(_phoneNumber.value) &&
        isPasswordValid(_password.value)) {
      QueryResult result = await _api.createUser(User(
          name: _name.value,
          email: _email.value,
          phoneNumber: _phoneNumber.value,
          password: _password.value));
      if (!result.hasException) {
        _preference.setInt(PreferenceKeys.userIdKey,
            result.data['insert_users']['returning'][0]['id']);
        return true;
      }
    }
    return false;
  }
  void loadMyAccount()async{
    _myAccount.add(User.fromJson((await _api.getUser(_preference.get(PreferenceKeys.userIdKey))).data['users_by_pk']));
  }
  Future<bool> onLogIn() async {
    QueryResult result = await _api.checkUser(
        User(phoneNumber: _phoneNumber.value, password: _password.value));
    bool isAUser = result.data['users'].isNotEmpty;
    if (isAUser) {
      _preference.setInt(
          PreferenceKeys.userIdKey, result.data['users'][0]['id']);
      return true;
    }
    return false;
  }

  Future<bool> onLogout() async =>
      await _preference.remove(PreferenceKeys.userIdKey);

  @override
  void dispose() {
    _name.close();
    _email.close();
    _phoneNumber.close();
    _password.close();
    _myAccount.close();
  }
}
