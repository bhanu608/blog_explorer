import 'package:flutter/material.dart';
import 'package:blog_explorer/services/blog_content.dart';
import 'package:blog_explorer/pages/DetailedItemView.dart';
class BlogListView extends StatefulWidget {
  const BlogListView({Key? key}) : super(key: key);

  @override
  State<BlogListView> createState() => _BlogListViewState();
}

class _BlogListViewState extends State<BlogListView> {


 List<int> l = [1,2,3,4,5];
  Map data = {};
  void detailedView(index){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailedItemView(title: data['titles'][index], url: data['urls'][index]))
    );
  }
  @override
  void initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
   if(data['error']=='')
    {
      return Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: Text('UbSpace'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: data['titles'].length,
          itemBuilder: ( context, index){
            if (data['error']!='') {
              print('hello');
              return Text('${data['error']}',
                style: TextStyle(
                    color: Colors.white
                ),);

            }
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal:50.0),
                child: Container(
                  height:110,
                  child: Card(
                    child: ListTile(
                      onTap: (){
                        detailedView(index);
                      },
                      title: Text('${data['titles'][index]}'),
                      leading: Image.network('${data['urls'][index]}'),
                    ),
                  ),
                )
            );


          },
        ),

      );
    }
   else{
     return Center(
       child: Text('${data['error']}',
       style: TextStyle(
           color: Colors.white
       ),),
     );
   }
  }
}
