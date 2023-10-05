import 'package:flutter/material.dart';
import 'package:blog_explorer/services/blog_content.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;


class AppError {
  final String message;
  final int code;

  AppError(this.message, this.code);
}


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  ApiService blogs = ApiService();
  void setupListView() async {
    await blogs.fetchBlogs();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'titles': blogs.titles,
      'urls' : blogs.urls,
      'error':blogs.error
    });
  }
  @override
  void initState() {
    super.initState();
    setupListView();
  }
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      backgroundColor: Colors.black38,
      body:Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size:50.0,
        ),
      )
    );
  }
}

