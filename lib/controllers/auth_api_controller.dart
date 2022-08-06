import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:university_app/controllers/api_helper.dart';
import 'package:university_app/controllers/api_settings.dart';
import 'package:university_app/models/register_user.dart';


import 'package:http/http.dart' as http;

import '../prefs/shared_prefs_controller.dart';
class AuthApiController with ApiHelper{
 
   Future<bool> register (BuildContext context, {required RegisterUser user }) async{
     var url = Uri.parse(ApiSettings.storeUser);
     var response = await http.post(url, body: {
      
       'name' : user.name,
       'email':user.email,
       'password':user.password,
       'phone':user.phone,
       
       
     } ,headers:headers ,);


     if(response.statusCode ==201){
       showSnackBar(context, message: jsonDecode(response.body)['message'].toString());
       return true;
     }
      else if (response.statusCode == 200) {
      var message = jsonDecode(response.body)['data'].toString();
      showSnackBar(context, message: message, error: true);

    }else{
      showSnackBar(context, message: 'Something went wrong, please try again!', error: true);
    }
    return false;
   }


   Future<bool> login(BuildContext context,
      {required String email, required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url, body: {
      'email': email,
      'password': password,


    } ,headers: headers);
    if (response.statusCode == 200) {
      // if(!jsonDecode(response.body)['success']){
      //   showSnackBar(context, message: jsonDecode(response.body)['data'].toString());
      // }
    
      print(response.body);
      //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
      //List jsonObject = jsonDecode(response.body);
      
      List jsonObject = json.decode(response.body);
      print(jsonObject);
      var user = jsonObject.first['user'];
      var token = jsonObject.first['token'];
      print(token);
      print(user);
      RegisterUser userlogin = RegisterUser.fromJson(user);

      await   SharedPrefController().save(user: userlogin , token: token );
    
      showSnackBar(
        context,
        //message: jsonDecode(response.body) ['message']
       message:  jsonObject.first['message'].toString()
      );
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context,
        message: jsonDecode(response.body)['message'],
     
        error: true,
      );
    }
    return false;
  }


  
  Future<bool> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.post(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 401) {
      SharedPrefController().clear();
      return true;
    }
    return false;
  }
}