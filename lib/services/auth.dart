import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Auth with ChangeNotifier {
  var _token;
  Dio dio = new Dio();

  String get token {
    return _token;
  }

  login(String email, String password) async {
    try {
      var response = await dio.post(
        'http://localhost:6969/authenticate',
        data: {"email": email, "password": password},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      _token = response.data['token'];
      print('auth' + '$_token');
      return response;
    } on DioError catch (err) {
      Fluttertoast.showToast(
        msg: err.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15,
      );
    }
  }

  loginToken(String email, String password) async {
    var response = await dio.post(
      'http://localhost:6969/authenticate',
      data: {"email": email, "password": password},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    _token = response.data['token'];
  }

  signUp(String name, String email, String password) async {
    try {
      var response = await dio.post(
        'http://localhost:6969/adduser',
        data: {
          "name": name,
          "email": email,
          "password": password,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      loginToken(email, password);
      return response;
    } on DioError catch (err) {
      Fluttertoast.showToast(
        msg: err.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15,
      );
    }
  }

  getDecodedToken(String token) async {
    try {
      var response = await dio.get('http://localhost:6969/getinfo',
          options: Options(headers: {
            //"accept": "*/*",
            "Authorization": "Bearer $token",
            "Content-Type": "application/x-www-form-urlencoded"
          }));
      print(response);
      return response;
    } on DioError catch (err) {
      Fluttertoast.showToast(
        msg: err.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15,
      );
    }
  }
}

//tester02@cuts.com
