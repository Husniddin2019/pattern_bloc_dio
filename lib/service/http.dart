import 'dart:convert';


import 'package:http/http.dart';
import 'package:pattern_bloc/model/contacts.dart';



class Network {
  static String BASE = "6352335aa9f3f34c3737179c.mockapi.io";
  static Map<String,String> headers = {'Content-Type':'application/json; charset=UTF-8'};


  /* Http Apis */

  static String API_LIST = "/contacts";
  static String API_CREATE = "/contacts";
  static String API_UPDATE = "/contacts/"; //{id}
  static String API_DELETE = "/contacts/"; //{id}

  /* Http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    print(params.toString());
    var uri = Uri.https(BASE, api); // http or https
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(Contacts contacts) {
    Map<String, String> params = new Map();
    params.addAll({
      'phone': contacts.phone!,
      'fullname': contacts.fullname!,
      'id': contacts.id.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Contacts contacts) {
    Map<String, String> params = new Map();
    params.addAll({
      'id': contacts.id.toString(),
      'fullname': contacts.fullname!,
      'phone': contacts.phone!,
     // 'userId': post.userId.toString(),
    });
    return params;
  }

  //http parsing
static Contacts parsePost(String response){
    dynamic json = jsonDecode(response);
    var data = Contacts.fromJson(json);


    return data;

}
  static List<Contacts> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Contacts>.from(json.map((x) => Contacts.fromJson(x)));
    return data;
  }


}