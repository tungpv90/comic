import 'dart:convert';

import 'package:comic/public.dart';
import 'package:comic/utility/event_bus.dart';
import 'package:comic/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String EventUserLogin = 'EventUserLogin';
const String EventUserLogout = 'EventUserLogout';

class UserManager {
  static UserManager _instance = UserManager.instance;
  static UserManager get instance {
    if (_instance == null) {
      _instance = UserManager();
      _instance.loadUserFromLocal();
    }
    return _instance;
  }

  late User user;
  static User get currentUser {
    return UserManager.instance.user;
  }

  logout() async {
    //this.user = ;

    preferences.remove('user');
    eventBus.emit(EventUserLogout);
  }

  login(Map<String, dynamic> userJson) {
    var user = User.fromJson(userJson);
    this.user = user;
    saveUser();

    eventBus.emit(EventUserLogin);
  }

  bool get isLogin {
    return user != null;
  }

  loadUserFromLocal() async {
    String? userJson = preferences.getString('user');
    if (userJson != null) {
      user = User.fromJson(json.decode(userJson));
    }
  }

  void saveUser() async {
    var data = json.encode(user);
    preferences.setString('user', data);
  }
}

class User {
  String token = '';
  int id = 0;
  String nickname = '';
  String avatarUrl = '';
  bool isVip = false;
  double wealth = 0;
  int coupon = 0;
  int monthlyTicket = 0;

  User.fromJson(Map json) {
    token = json['token'];
    id = json['id'];
    nickname = json['nickname'];
    avatarUrl = json['avatar'];
    isVip = json['is_vip'] == 1;
    wealth = json['wealth'];
    coupon = json['coupon'];
    monthlyTicket = json['ticket'];
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'id': id,
      'nickname': nickname,
      'avatar': avatarUrl,
      'is_vip': isVip == true ? 1 : 0,
      'wealth': wealth,
      'coupon': coupon,
      'ticket': monthlyTicket,
    };
  }
}
