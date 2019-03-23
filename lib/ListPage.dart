import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ListPageDetails.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => new _ListPageState();
}

class _ListPageState extends State<ListPage> {

  StreamSubscription<QuerySnapshot>subscription;

  List<DocumentSnapshot>snapshot;

  final CollectionReference collectionReference=Firestore.instance.collection("All Post");


  @override
  void initState() {
    super.initState();

    subscription=collectionReference.snapshots().listen((datasnapshot){
      setState(() {
        snapshot=datasnapshot.documents;
      });
    });

  }

  listPage(DocumentSnapshot snap){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>ListPageDetails(snapshot: snap,)));
  }


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
      ),//end drawer..

      body: new ListView.builder(
          itemCount: snapshot.length,
          itemBuilder: (context,index){

            return Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              child: new Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10.0),

                child: new Row(
                  children: <Widget>[

                    new CircleAvatar(
                      child: new Text(snapshot[index].data["title"][0]),
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    ),

                    new Container(
                      width: 250.0,
                      padding: EdgeInsets.all(10.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          new InkWell(
                            child: new Text(snapshot[index].data["title"],
                              maxLines: 1,
                              style: TextStyle(fontSize: 20.0,color: Colors.green),
                            ),

                            onTap: (){
                              listPage(snapshot[index]);
                            },

                          ),

                          new Padding(padding: EdgeInsets.all(5.0)),

                          new Text(snapshot[index].data["content"],
                          maxLines: 2,

                          style: TextStyle(fontSize: 17.0,color: Colors.blue),
                          )

                        ],
                      ),
                    )


                  ],
                ),

              ),
            );

          }
      ),


    );
  }
}
