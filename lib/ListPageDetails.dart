import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPageDetails extends StatefulWidget {

  DocumentSnapshot snapshot;

  ListPageDetails({this.snapshot});

  @override
  _ListPageDetailsState createState() => new _ListPageDetailsState();
}

class _ListPageDetailsState extends State<ListPageDetails> {



  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("List Page Details"),
        backgroundColor: Colors.green,
      ),

      body: new Container(
        margin: EdgeInsets.all(10.0),

        child: new Card(

          child: new ListView(
            children: <Widget>[

              new Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    new CircleAvatar(
                      child: new Text(widget.snapshot.data["title"][0]),
                    ),
                    new SizedBox(width: 20.0,),
                    new Text(widget.snapshot.data["title"],
                    style: TextStyle(fontSize: 22.0,color: Colors.green),),

                  ],
                ),
              ),
              new SizedBox(height: 10.0,),
              new Padding(padding: EdgeInsets.all(10.0)),
              new Text(widget.snapshot.data["content"]),

            ],
          ),

        ),
      ),

    );
  }
}
