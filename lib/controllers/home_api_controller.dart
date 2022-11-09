import 'dart:convert';
import 'dart:io';


import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:university_app/controllers/api_helper.dart';
import 'package:university_app/models/book.dart';
import 'package:university_app/models/courses.dart';
import 'package:university_app/models/dep_model.dart';
import 'package:university_app/models/form.dart';
import 'package:university_app/models/links.dart';
import 'package:university_app/models/major_dep.dart';
import 'package:university_app/models/resource_type.dart';
import 'package:university_app/models/semester.dart';
import 'package:university_app/models/sound.dart';
import 'package:university_app/models/summary.dart';
import 'package:university_app/models/university.dart';
import 'package:university_app/models/video.dart';
import 'package:university_app/models/video_link.dart';
import 'package:university_app/models/years_model.dart';

import 'api_settings.dart';
import 'package:http/http.dart' as http;
class HomeApiController with ApiHelper{ 
  Future<List<University>> getUniversities() async {
 var isCacheExist = await APICacheManager().isAPICacheKeyExist('api_univ');

  if(!isCacheExist){
    print('load from api');
 var url = Uri.parse(ApiSettings.universities);
    var response = await http.get(url , headers:headers );
    
    // print(response.body);
    // print(headers);
    if (response.statusCode == 200) {
    APICacheDBModel model =   APICacheDBModel(key: 'api_univ',syncData: response.body);
      await APICacheManager().addCacheData(model);
      var categoriesJsonArray = jsonDecode(response.body)['data'] as List;
     
      return categoriesJsonArray
          .map((jsonObject) => University.fromJson(jsonObject))
          .toList();
    }
    
   
    return [];
  }
  else{
    print('load from cache');
    var cachedata = await APICacheManager().getCacheData('api_univ');
     var categoriesJsonArray = jsonDecode(cachedata.syncData)['data'] as List ;
    return categoriesJsonArray
          .map((jsonObject) => University.fromJson(jsonObject))
          .toList();
  }
      
  }


   Future<List<DepartmentModel>> getDepatement(String id) async {
    var isCacheExist = await APICacheManager().isAPICacheKeyExist('api_dep');
    if(!isCacheExist){
var url = Uri.parse(ApiSettings.departmentByUniv.replaceFirst("{id}", id) , );
    print(url);
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
        APICacheDBModel model =   APICacheDBModel(key: 'api_dep',syncData: response.body);
        await APICacheManager().addCacheData(model);
      var depJsonArray = jsonDecode(response.body)['data'] as List;
      return depJsonArray
          .map((jsonObject) => DepartmentModel.fromJson(jsonObject))
          .toList();
    }
    return [];
    }
    else{
 print('load from cache');
    var cachedata = await APICacheManager().getCacheData('api_dep');
     var depJsonArray = jsonDecode(cachedata.syncData)['data'] as List ;
    return depJsonArray
          .map((jsonObject) => DepartmentModel.fromJson(jsonObject))
          .toList();
    }
    
  }
 Future<List<MajorModel>> getMajor(String id) async {
   var isCacheExist = await APICacheManager().isAPICacheKeyExist('api_major');
   if(!isCacheExist){
    var url = Uri.parse(ApiSettings.majorInDepartment.replaceFirst("{id}", id) , );
    print(url);
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      APICacheDBModel model =   APICacheDBModel(key: 'api_major',syncData: response.body);
        await APICacheManager().addCacheData(model);
      var depJsonArray = jsonDecode(response.body)['data'] as List;
      return depJsonArray
          .map((jsonObject) => MajorModel.fromJson(jsonObject))
          .toList();
    }
    return [];
   }
   else{
    print('load from cache');
    var cachedata = await APICacheManager().getCacheData('api_major');
     var depJsonArray = jsonDecode(cachedata.syncData)['data'] as List ;
    return depJsonArray
          .map((jsonObject) => MajorModel.fromJson(jsonObject))
          .toList();
   }
  }

   Future<List<YearsModel>> getYears() async {
     var isCacheExist = await APICacheManager().isAPICacheKeyExist('api_years');
     if(!isCacheExist){
var url = Uri.parse(ApiSettings.years);
    print(url);
    var response = await http.get(url , headers:headers );
    
    // print(response.body);
    // print(headers);
    if (response.statusCode == 200) {
       APICacheDBModel model =   APICacheDBModel(key: 'api_years',syncData: response.body);
        await APICacheManager().addCacheData(model);
      var yearsJsonArray = jsonDecode(response.body)['data'] as List;
      
      return yearsJsonArray
          .map((jsonObject) => YearsModel.fromJson(jsonObject))
          .toList();
      

          
    }
    return [];
     }
     else{
 print('load from cache');
    var cachedata = await APICacheManager().getCacheData('api_years');
     var yearsJsonArray = jsonDecode(cachedata.syncData)['data'] as List ;
    return yearsJsonArray
          .map((jsonObject) => YearsModel.fromJson(jsonObject))
          .toList();
     }
     
    
  }


    Future<List<SemesterModel>> getSemesters() async {
       var isCacheExist = await APICacheManager().isAPICacheKeyExist('api_semesters');
 if(!isCacheExist){
var url = Uri.parse(ApiSettings.semesters);
    
    var response = await http.get(url , headers:headers );
    
   
   print(response.statusCode);
    if (response.statusCode == 200) {
      APICacheDBModel model =   APICacheDBModel(key: 'api_semesters',syncData: response.body);
        await APICacheManager().addCacheData(model);
      var semesterJsonArray = jsonDecode(response.body)['data'] as List;
    //  print(semesterJsonArray);
      return semesterJsonArray
          .map((jsonObject) => SemesterModel.fromJson(jsonObject))
          .toList();
        
    }
  
    return [];
 }
 else{
   print('load from cache');
    var cachedata = await APICacheManager().getCacheData('api_semesters');
     var semesterJsonArray = jsonDecode(cachedata.syncData)['data'] as List ;
    return semesterJsonArray
          .map((jsonObject) => SemesterModel.fromJson(jsonObject))
          .toList();
 }
    
   
  }

   Future<List<CoursesModel>> geSemesterCourses(String mid , String yid, String sid) async {
    var isCacheExist = await APICacheManager().isAPICacheKeyExist('api_SemesterCourses');
    if(!isCacheExist){
       var url = Uri.parse(ApiSettings.yearsemestercourses.replaceAll('{major_id}', mid).replaceAll('{year_id}', yid).replaceAll('{semester_id}', sid));

    //var url = Uri.parse(ApiSettings.yearsemestercourses.replaceFirst('{major_id}', mid , '{year_id}', yid, '{semester_id}',sid ));
    print(url);
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
       APICacheDBModel model =   APICacheDBModel(key: 'api_SemesterCourses',syncData: response.body);
        await APICacheManager().addCacheData(model);
      var courseJsonArray = jsonDecode(response.body)['data'] as List;
      return courseJsonArray
          .map((jsonObject) => CoursesModel.fromJson(jsonObject))
          .toList();
    }
    return [];
    }

    else{
 print('load from cache');
    var cachedata = await APICacheManager().getCacheData('api_SemesterCourses');
     var courseJsonArray = jsonDecode(cachedata.syncData)['data'] as List ;
    return courseJsonArray
          .map((jsonObject) => CoursesModel.fromJson(jsonObject))
          .toList();
    }
 
  }
  

  

    Future<List<ResourceType>> getResourceType() async {
      var isCacheExist = await APICacheManager().isAPICacheKeyExist('api_ResourceType');
      if(!isCacheExist){
        var url = Uri.parse(ApiSettings.resourceTypes);
    var response = await http.get(url , headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      APICacheDBModel model =   APICacheDBModel(key: 'api_ResourceType',syncData: response.body);
        await APICacheManager().addCacheData(model);
     var body = jsonDecode(response.body);
     List<dynamic> jsonData = body['data'];
      return jsonData
          .map((jsonObject) => ResourceType.fromJson(jsonObject))
          .toList();
    }
    return [];
      }
      else{
       print('load from cache');
    var cachedata = await APICacheManager().getCacheData('api_ResourceType');
     var jsonData = jsonDecode(cachedata.syncData)['data'] as List ;
    return jsonData
          .map((jsonObject) => ResourceType.fromJson(jsonObject))
          .toList();
      }
    
  }


   Future<List<SoundModel>> getSound(String id) async {
    var isCacheExist = await APICacheManager().isAPICacheKeyExist('api_sounds');
    if(!isCacheExist){
 var url = Uri.parse(ApiSettings.sounds.replaceFirst("{id}", id));
    print(url);
    var response = await http.get(url , headers:headers );
    
   
   print(response.statusCode);
    if (response.statusCode == 200) {
       APICacheDBModel model =   APICacheDBModel(key: 'api_sounds',syncData: response.body);
        await APICacheManager().addCacheData(model);
      var soundJsonArray = jsonDecode(response.body)['data'] as List ;
    
      return soundJsonArray
          .map((jsonObject) => SoundModel.fromJson(jsonObject)).toList();
          
      

          
    }
  
     
    
    return [];
    }else{
print('load from cache');
    var cachedata = await APICacheManager().getCacheData('api_sounds');
     var soundJsonArray = jsonDecode(cachedata.syncData)['data'] as List ;
    return soundJsonArray
          .map((jsonObject) => SoundModel.fromJson(jsonObject)).toList();
    }
    
   
  }
   Future<List<BookModel>> getBooks(String id) async {
   var isCacheExist = await APICacheManager().isAPICacheKeyExist('api_books');
   if(!isCacheExist){
    var url = Uri.parse(ApiSettings.allBooks.replaceFirst("{id}", id));
    print(url);
    var response = await http.get(url , headers:headers );
    
   
   print(response.statusCode);
    if (response.statusCode == 200) {
        APICacheDBModel model =   APICacheDBModel(key: 'api_books',syncData: response.body);
        await APICacheManager().addCacheData(model);
      var bookJsonArray = jsonDecode(response.body)['data'] as List ;
    
      return bookJsonArray
          .map((jsonObject) => BookModel.fromJson(jsonObject)).toList();
          
      

          
    }
  
     
    
    return [];
   }
   else{
         print('load from cache');
    var cachedata = await APICacheManager().getCacheData('api_books');
     var bookJsonArray = jsonDecode(cachedata.syncData)['data'] as List ;
    return bookJsonArray
          .map((jsonObject) => BookModel.fromJson(jsonObject)).toList();
          
   }
    
   
  }

  Future<List<LinksModel>> getLinks(String id) async {
   var isCacheExist = await APICacheManager().isAPICacheKeyExist('api_links');
   if(!isCacheExist){
 var url = Uri.parse(ApiSettings.urlResource.replaceFirst("{id}", id));
    print(url);
    var response = await http.get(url , headers:headers );
    
   
   print(response.statusCode);
    if (response.statusCode == 200) {
      APICacheDBModel model =   APICacheDBModel(key: 'api_links',syncData: response.body);
        await APICacheManager().addCacheData(model);
      var linkJsonArray = jsonDecode(response.body)['data'] as List ;
    
      return linkJsonArray
          .map((jsonObject) => LinksModel.fromJson(jsonObject)).toList();
          
        
    }
    return [];
   }
   else{
  print('load from cache');
    var cachedata = await APICacheManager().getCacheData('api_links');
     var linkJsonArray = jsonDecode(cachedata.syncData)['data'] as List ;
    return linkJsonArray
          .map((jsonObject) => LinksModel.fromJson(jsonObject)).toList();
          
          
   }
   
   
  }
   Future<List<SummaryModel>> getSummary(String id) async {
   var isCacheExist = await APICacheManager().isAPICacheKeyExist('api_summary');
   if(!isCacheExist){
      var url = Uri.parse(ApiSettings.summarizations.replaceFirst("{id}", id));
    print(url);
    var response = await http.get(url , headers:headers );
    
   
   print(response.statusCode);
    if (response.statusCode == 200) {
      APICacheDBModel model =   APICacheDBModel(key: 'api_summary',syncData: response.body);
        await APICacheManager().addCacheData(model);
      var summaryJsonArray = jsonDecode(response.body)['data'] as List ;
    
      return summaryJsonArray
          .map((jsonObject) => SummaryModel.fromJson(jsonObject)).toList();    
    }
  
    return [];
   }else{
    print('load from cache');
    var cachedata = await APICacheManager().getCacheData('api_summary');
     var summaryJsonArray = jsonDecode(cachedata.syncData)['data'] as List ;
    return summaryJsonArray
          .map((jsonObject) => SummaryModel.fromJson(jsonObject)).toList();    
   }
    
   
  }
  
   Future<List<VideoModel>> getVideo(String id) async {
   var isCacheExist = await APICacheManager().isAPICacheKeyExist('api_getVideo');
   if(!isCacheExist){
var url = Uri.parse(ApiSettings.video.replaceFirst("{id}", id));
    print(url);
    var response = await http.get(url , headers:headers );
    
   
   print(response.statusCode);
    if (response.statusCode == 200) {
       APICacheDBModel model =   APICacheDBModel(key: 'api_getVideo',syncData: response.body);
        await APICacheManager().addCacheData(model);
      var videoJsonArray = jsonDecode(response.body)['data'] as List ;
    
      return videoJsonArray
          .map((jsonObject) => VideoModel.fromJson(jsonObject)).toList();
         
    }
  
    return [];
   
   }else{
 print('load from cache');
    var cachedata = await APICacheManager().getCacheData('api_getVideo');
     var videoJsonArray = jsonDecode(cachedata.syncData)['data'] as List ;
    return videoJsonArray
          .map((jsonObject) => VideoModel.fromJson(jsonObject)).toList();
   }
    
  }
   Future<List<FormModel>> getFormSample(String id) async {
   var isCacheExist = await APICacheManager().isAPICacheKeyExist('api_getFormSample');
   if(!isCacheExist){
var url = Uri.parse(ApiSettings.samples.replaceFirst("{id}", id));
    print(url);
    var response = await http.get(url , headers:headers );
    
   
   print(response.statusCode);
    if (response.statusCode == 200) {
       APICacheDBModel model =   APICacheDBModel(key: 'api_getFormSample',syncData: response.body);
        await APICacheManager().addCacheData(model);
      var formJsonArray = jsonDecode(response.body)['data'] as List ;
    
      return formJsonArray
          .map((jsonObject) => FormModel.fromJson(jsonObject)).toList();
           
    }
  return [];
   }else{
print('load from cache');
    var cachedata = await APICacheManager().getCacheData('api_getFormSample');
     var formJsonArray = jsonDecode(cachedata.syncData)['data'] as List ;
    return formJsonArray
          .map((jsonObject) => FormModel.fromJson(jsonObject)).toList();
   }
    
   
  }

  Future<List<VideoLinksModel>> getVideoUrl(String id) async {
   var isCacheExist = await APICacheManager().isAPICacheKeyExist('api_getVideoUrl');
   if(!isCacheExist){
var url = Uri.parse(ApiSettings.videoUrl.replaceFirst("{id}", id));
    print(url);
    var response = await http.get(url , headers:headers );
    
   
   print(response.statusCode);
    if (response.statusCode == 200) {
       APICacheDBModel model =   APICacheDBModel(key: 'api_getVideoUrl',syncData: response.body);
        await APICacheManager().addCacheData(model);
      var vlinkJsonArray = jsonDecode(response.body)['data'] as List ;
    
      return vlinkJsonArray
          .map((jsonObject) => VideoLinksModel.fromJson(jsonObject)).toList();
         
    }
    return [];
   }
   else{
print('load from cache');
    var cachedata = await APICacheManager().getCacheData('api_getVideoUrl');
     var vlinkJsonArray = jsonDecode(cachedata.syncData)['data'] as List ;
    return vlinkJsonArray
          .map((jsonObject) => VideoLinksModel.fromJson(jsonObject)).toList();
   }
    
   
  }
}