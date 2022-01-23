import 'dart:convert';

import 'package:http/http.dart';
import 'package:parsedemo/model/delete_model.dart';
import 'package:parsedemo/model/emplist_model.dart';
import 'package:parsedemo/model/empone_model.dart';
import 'package:parsedemo/model/post_model.dart';
import 'package:parsedemo/model/update_model.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };

  static String API_LIST = "/api/v1/employees";
  static String API_employee = "/api/v1/employee/1";
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/21"; //id
  static String API_DELETE = "/api/v1/delete/2"; //id

  static Future<String> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String> POST(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api);
    var response = await post(uri, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api);
    var response = await put(uri, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await delete(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = Map();
    params.addAll({
      "name": post.name,
      "salary": post.salary,
      "age": post.age.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = Map();
    params.addAll({
      "id": post.id.toString(),
      "name": post.name,
      "salary": post.salary,
      "age": post.age.toString(),
    });
    return params;
  }

  static EmpList parseEmpList(String body){
    dynamic json = jsonDecode(body);
    var data = EmpList.fromJson(json);
    return data;
  }

  static EmpOne parseEmpOne(String body){
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }

  static EmpOne parseEmpCreate(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }

  static EmpDelete parseEmpDelete(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpDelete.fromJson(json);
    return data;
  }

  static EmpUpdate parseEmpUpdate(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpUpdate.fromJson(json);
    return data;
  }

}
