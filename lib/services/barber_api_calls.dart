import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BarberApi {
  Dio dio = new Dio();

  getBarber(String barberemail) async {
    try {
      var response = await dio.post(
        'http://localhost:6969/getbarber',
        data: {"email": barberemail},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
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

  addFavBarber(String useremail, String barberemail) async {
    try {
      var response = await dio.put(
        'http://localhost:6969/addfavbarber',
        data: {"useremail": useremail, "barberemail": barberemail},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
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

  removeFavBarber(String useremail, String barberemail) async {
    try {
      var response = await dio.put(
        'http://localhost:6969/removefavbarber',
        data: {"useremail": useremail, "barberemail": barberemail},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
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

  addchatBarber(String useremail, String barberemail) async {
    try {
      var response = await dio.put(
        'http://localhost:6969/addchatbarber',
        data: {"useremail": useremail, "barberemail": barberemail},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
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

  removechatBarber(String useremail, String barberemail) async {
    try {
      var response = await dio.put(
        'http://localhost:6969/removechatbarber',
        data: {"useremail": useremail, "barberemail": barberemail},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
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
