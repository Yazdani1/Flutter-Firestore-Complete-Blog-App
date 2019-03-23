import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => new _ListPageState();
}

class _ListPageState extends State<ListPage> {

  StreamBuilder<QuerySnapshot>streamBuilder;

  List<DocumentSnapshot>snapshot;

  final CollectionReference collectionReference=Firestore.instance.collection("All Post");




  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Materil Page"),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: ()=>debugPrint("Search")
          ),
          new IconButton(
              icon: new Icon(Icons.add),
              onPressed: ()=>debugPrint("Add")
          )
        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

            new UserAccountsDrawerHeader(
                accountName: new Text("Code With YDC"),
                accountEmail: new Text("ydc@gmail.com"),
              decoration: new BoxDecoration(
                color: Colors.purple
              ),
            ),
            new ListTile(
              title: new Text("First Page"),
              leading: new Icon(Icons.search,color: Colors.purple,),
            ),
            new ListTile(
              title: new Text("Second Page"),
              leading: new Icon(Icons.print,color: Colors.orange,),
            ),
            new ListTile(
              title: new Text("Third Page"),
              leading: new Icon(Icons.pages,color: Colors.green),
            ),
            new ListTile(
              title: new Text("Fourth Page"),
              leading: new Icon(Icons.cake,color: Colors.blueAccent,),
            ),
            new Divider(
              height: 10.0,
            ),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close,color: Colors.red,),
              onTap: (){
                Navigator.of(context).pop();
              },
            )

          ],
        ),
      ),


    );
  }
}
