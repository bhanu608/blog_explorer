import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiService {
  final String baseUrl = 'https://intent-kit-16.hasura.app/api/rest';
  final String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
  String temp = '';
  List<dynamic> titles=[];
  List<dynamic> urls=[];
  String error = '';
  Future<void> fetchBlogs() async {

    try{
      final response = await http.get(
        Uri.parse('$baseUrl/blogs'),
        headers: {'x-hasura-admin-secret': adminSecret},
      );
      if(response.statusCode == 200){
      Map data = jsonDecode(response.body);
      //getting title and image url from data
      //title = data[]
      titles = data['blogs'].map((dynamic m1){
        return m1['title']  ;
      }).toList();
      urls = data['blogs'].map((dynamic m1){
        return m1['image_url']  ;
      }).toList();

      }
      else {
        throw Exception('${response.statusCode} Error Occurred');
      }
      }
    catch(e){
      error = 'An error occurs : $e';
    }
  }
}