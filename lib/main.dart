import 'package:flutter/material.dart';
import 'package:blog_explorer/pages/BlogListView.dart';
import 'package:blog_explorer/pages/DetailedItemView.dart';
import 'package:blog_explorer/services/blog_content.dart';
import 'package:blog_explorer/pages/Loading.dart';

class MyRouteArguments {
  final String data;

  MyRouteArguments(this.data);
}
void main() =>  runApp(MaterialApp(
  initialRoute: '/',
  routes:{
    '/': (context) => Loading(),
      '/home':(context) => BlogListView(),
    '/blog':(context) => DetailedItemView(title: '',url: ''),
}
));
