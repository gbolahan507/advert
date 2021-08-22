import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:jiji_clone/core/model/profile_model.dart';
import 'package:jiji_clone/core/model/user_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String kUserBoxName = 'userBox';
const String kUser = 'userr';
const String kUserName = 'userName';
const String kserial = 'serialss';
const String kToken = 'token';
const String kSavedBox = 'saved01';
const String kimage = 'image';
const String kcoupon = 'coupon';
const String kimages = 'test_image';

class AppCache {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(kUserBoxName);
  }

  static Box<dynamic> get _box => Hive.box<dynamic>(kUserBoxName);

  String a = '';

  static void saveUserData() {}

  static void saveToken(String token) {
    if (token == null) {
      return;
    }
    _box.put(kToken, token);
  }

  static void saveImage(String image) {
    if (image == null) {
      return;
    }
    _box.put(kimages, image);
  }

  static String getImage() {
    final String data = _box.get(kimages);
    return data;
  }

  static String getToken() {
    final String data = _box.get(kToken) as String;
    return data;
  }

  static void saveUser(UserModel user) {
    if (user == null) {
      return;
    }
    _box.put(kUser, user.toJson());
  }

    static void saveUserName(ProfileModel userName) {
    if (userName == null) {
      return;
    }
    _box.put(kUserName, userName.toJson());
  }

  static void saveimage(String value) {
    _box.put(kimage, value);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }

  static UserModel getUser() {
    dynamic data = _box.get(kUser);
    if (data == null) {
      return null;
    }
    return UserModel.fromJson(data);
  }


    static ProfileModel getUserName() {
    dynamic data = _box.get(kUserName);
    if (data == null) {
      return null;
    }
    return ProfileModel.fromJson(data);
  }

  static void clear() {
    _box.clear();
  }

  static void clean(String key) {
    _box.delete(key);
  }
}
