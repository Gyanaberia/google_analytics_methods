import 'package:firebase_analytics/firebase_analytics.dart';

//ref: https://stackoverflow.com/questions/73408146/how-to-set-user-id-and-propeties-in-firebase-analytics-flutter
class AnalyticsClass {
  static final AnalyticsClass _singleton = AnalyticsClass._internal();
  late FirebaseAnalytics fa = FirebaseAnalytics.instance;

  factory AnalyticsClass() {
    return _singleton;
  }

  AnalyticsClass._internal();
  setUser([String? id, role]) async {
    await fa.setUserId(id: id);
    // if (role != null) {
    await fa.setUserProperty(name: 'Role', value: role);
    // }
  }

  logCustomEvent(String eventName, [Map<String, Object?>? param]) async {
    await fa.logEvent(name: eventName, parameters: param);
  }

  logSessionTimeout(String eventName, [Map<String, Object?>? param]) {
    fa.logEvent(name: eventName, parameters: param);
  }

  signupEvent(String signUpMethod) async {
    await fa.logSignUp(signUpMethod: signUpMethod);
  }

  loginEvent(String loginMethod) async {
    await fa.logLogin(loginMethod: loginMethod);
  }
}
