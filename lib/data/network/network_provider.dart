import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class NetworkProvider {
  Dio _dio;

  NetworkProvider({@required String baseUrl}) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    initInterceptors();
  }

  setHeaders(Map<String, String> headers) {
    _dio.options.headers = headers;
  }

  initInterceptors() {
    //these methods will get executed on every network call
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (requestOptions) {
        //do something if required
      },
      onResponse: (response) {
        //do something if required
      },
      onError: (dioError) {
        //do something if required
      },
    ));
  }

  Future<Response> get(
      {@required String path, Map<String, dynamic> queryParameters}) async {
    Response response;
    try {
      response = await _dio.get(path, queryParameters: queryParameters);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  Future<Response> post(
      {@required String path,
      Map<String, dynamic> queryParameters = const {},
      Map<String, dynamic> data}) async {
    Response response;
    try {
      response =
          await _dio.post(path, queryParameters: queryParameters, data: data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  Future<Response> put(
      {@required String path,
      Map<String, dynamic> queryParameters = const {},
      Map<String, dynamic> data}) async {
    Response response;
    try {
      response =
          await _dio.put(path, queryParameters: queryParameters, data: data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  //supports more than one file
  Future<Response> multipart(
      {@required String path,
      Map<String, dynamic> queryParameters = const {},
      Map<String, dynamic> data,
      Map<String, File> multipartData}) async {
    Response response;
    try {
      //convert files
      Map<String, MultipartFile> partsMap = {};
      for (String key in multipartData.keys) {
        MultipartFile parts =
            await MultipartFile.fromFile(multipartData[key].path);
        partsMap[key] = parts;
      }

      //send files
      response = await _dio.post(path,
          queryParameters: queryParameters,
          data: FormData.fromMap({...partsMap, ...data}));
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }
}
