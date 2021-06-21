import 'dart:async';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class APIHelper {
  static String baseUrl = "https://voicerss-text-to-speech.p.rapidapi.com/";
  static String imageBaseUrl = "http://2fe7da16a6aa.ngrok.io/images/";

  static APIHelper _instance(BuildContext context) => new APIHelper._(context);

  factory APIHelper(BuildContext context) {
    return _instance(context);
  }

  static BuildContext _context;

  static Dio _dio;

  APIHelper._(BuildContext context) {
    _context = context;
  }

  get dio {
    if (_dio != null ) return _dio;
    _dio = _initDio();
    return _dio;
  }

  _initDio() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: 30000,
        sendTimeout: 60000,
        receiveTimeout: 30000,
        contentType: 'application/json; charset=utf-8',
        baseUrl: baseUrl,
      ),
    );
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    // dio.interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          options.headers["x-rapidapi-key"] =
              "d2cf348d42msh206cfd530239715p1c18dfjsn5fb5b6f4cf55";
          options.headers["x-rapidapi-host"] = "voicerss-text-to-speech.p.rapidapi.com";
          options.headers["useQueryString"] = true;
          print(options.uri);
          return options; //continue
        },
        onResponse:
            (Response response, ResponseInterceptorHandler handler) async {
          return response;
        },
        onError: (DioError e, ErrorInterceptorHandler handler) async {
          handleTimeOutException(_context, e.type);
          // Refresh Token
          print(e.message);
          return e.response; //continue
        },
      ),
    );
  }

  void handleTimeOutException(BuildContext context, DioErrorType type) {
    switch (type) {
      case DioErrorType.connectTimeout:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed connect to server"),
          ),
        );
        break;
      case DioErrorType.sendTimeout:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed sending data to server"),
          ),
        );
        break;
      case DioErrorType.receiveTimeout:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed receiving data from server"),
          ),
        );
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("No Internet connection"),
          ),
        );
        break;
    }
  }

  Future get(String url, [Map<String, dynamic> params]) async {
    return _dio.get(url, queryParameters: params);
  }

  Future post(String url, Map<String, dynamic> params) async {
    return _dio.post(url, data: params);
  }

  Future put(String url, [Map<String, dynamic> params]) async {
    return _dio.put(url, data: params);
  }

  Future delete(String url, [Map<String, dynamic> params]) async {
    return _dio.delete(url, queryParameters: params);
  }
}
