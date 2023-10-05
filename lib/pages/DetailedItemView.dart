import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailedItemView extends StatefulWidget {
  String title='';
  String url='';
  DetailedItemView({required this.title, required this.url});
  @override
  State<DetailedItemView> createState() => _DetailedItemViewState();
}

class _DetailedItemViewState extends State<DetailedItemView> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text('ubspace'),
          backgroundColor: Colors.black38
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal:50.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Title',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),

              // Profile section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 8.0),
                      Text('Bhanu meduri'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.facebook),
                      Icon(FontAwesomeIcons.twitter),
                      Icon(FontAwesomeIcons.linkedin),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),

              // Image
              Image.network(
                '${widget.url}',
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),


              Text(
                'Content related to the title goes here...',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: isFavorite
                        ? IconButton(
                      key: ValueKey<bool>(isFavorite),
                      onPressed: toggleFavorite,
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )
                        : IconButton(
                      key: ValueKey<bool>(isFavorite),
                      onPressed: toggleFavorite,
                      icon: Icon(Icons.favorite_border),
                    ),
                  ),

                  Row(
                    children: [
                      Icon(FontAwesomeIcons.facebook),
                      Icon(FontAwesomeIcons.twitter),
                      Icon(FontAwesomeIcons.linkedin),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

