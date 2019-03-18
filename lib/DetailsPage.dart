import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Details extends StatefulWidget {

  final DocumentSnapshot snap;

  Details({this.snap});

  @override
  _DetailsState createState() => new _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Blog Post Details"),
        backgroundColor: Colors.purple,
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
      body: new Card(
        margin: EdgeInsets.all(7.0),
        elevation: 7.0,
        child: new Container(
          padding: EdgeInsets.all(10.0),
          child: new ListView(

            children: <Widget>[

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  new CircleAvatar(
                    child: new Text(widget.snap.data["title"][0]),
                    backgroundColor: Colors.purple,
                  ),
                  new Container(
                    width: 150.0,
                    child: Text(widget.snap.data["title"],
                      style: TextStyle(fontSize: 24.0,color: Colors.purple),
                    ),
                  ),
                  new Text("\$"+widget.snap.data["amount"],
                    style: TextStyle(fontSize: 22.0,color: Colors.purple),
                  ),
                ],
              ),
              new SizedBox(height: 10.0,),
              new Text(widget.snap.data["content"],
                style: TextStyle(fontSize: 19.0,color: Colors.black),
              )



            ],
          ),

        ),
      ),


    );
  }
}

