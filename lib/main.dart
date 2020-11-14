import 'package:androidx_flutter_test_app/progress_share_feature/contactsButton.dart';
import 'package:androidx_flutter_test_app/progress_share_feature/shareDirectToApp.dart';
import 'package:androidx_flutter_test_app/shareOptions.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "My test App",
    debugShowCheckedModeBanner: false,
    home: MyShareApp(),


  ));
}

//class MyApp extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return MyAppState();
//  }
//}
//
//class MyAppState extends State<MyApp>{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(),
//      body: ListPage(),
//    );}}
//
//    class ListPage extends StatefulWidget {
//      @override
//      _ListPageState createState() => _ListPageState();
//    }
//
//    class _ListPageState extends State<ListPage> {
//  Future _data;
//  Future getPosts() async {
//    var firestore = Firestore.instance;
//    QuerySnapshot qn = await firestore.collection('posts').getDocuments();
//    return qn.documents;
//
//  }
//  navigateToDetail(DocumentSnapshot post){
//    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(post: post,)));
//  }
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _data = getPosts();
//  }
//      @override
//      Widget build(BuildContext context) {
//        return Container( child: FutureBuilder(
//          future: _data,
//            builder: (_, snapshot){
//          if(snapshot.connectionState == ConnectionState.waiting){
//           return Center(
//              child: Text('Loading...'),
//            );}
//          else{
//           return ListView.builder(
//               itemCount: snapshot.data.length,
//               itemBuilder:(_, index){
//                 return ListTile(
//                   title: Text(snapshot.data[index].data["title"]),
//                   onTap: () => navigateToDetail(snapshot.data[index]),
//                 );
//
//           });
//          }}
//          ),);
//  }
//    }
//
//    class DetailPage extends StatefulWidget {
//  final DocumentSnapshot post;
//  DetailPage({this.post});//this is a constructor
//      @override
//      _DetailPageState createState() => _DetailPageState();
//    }
//
//    class _DetailPageState extends State<DetailPage> {
//      @override
//      Widget build(BuildContext context) {
//        return Scaffold(
//          appBar: AppBar(title: Text(widget.post.data["title"]),),
//          body: Container(
//            child: Card(
//              child: ListTile(
//                title: Text(widget.post.data['title']),
//                subtitle: Text(widget.post.data['content']),
//              ),
//            ),
//          ),
//        );
//      }
//    }
//
//