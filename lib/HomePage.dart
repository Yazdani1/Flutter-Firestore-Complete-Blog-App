import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {


  
  Future getAllPost() async{
    
    var firestore=Firestore.instance;
    QuerySnapshot sp=await firestore.collection("posts").getDocuments();
    return sp.documents;
  }
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Flutter Blog App"),
        backgroundColor: Colors.orange,
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

      body: new FutureBuilder(
        future: getAllPost(),
          builder: (_,snapshot){
          
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: new Text("Loading Data"),
            );
          }else{
            return ListView.builder(
              itemCount: snapshot.data.length,
                itemBuilder: (_,index){
                
                return Card(
                  margin: EdgeInsets.all(10.0),
                  elevation: 8.0,
                  child: new Padding(padding: EdgeInsets.all(10.0),
                  
                    child: new  Container(

                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          new CircleAvatar(

                            child: new Text(snapshot.data[index].data["title"][0]),
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                          ),
                          new SizedBox(width: 10.0,),
                          new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              new Text(snapshot.data[index].data["title"],
                                maxLines: 2,
                                style: TextStyle(fontSize: 23.0,color: Colors.orange),
                              ),
                              new Padding(padding: EdgeInsets.all(5.0)),
                              new Text(snapshot.data[index].data["content"],
                              maxLines: 2,
                              style: TextStyle(color: Colors.black,),
                              )


                            ],
                          ),
                          new Padding(padding: EdgeInsets.only(left: 10.0)),
                             Text("\$"+snapshot.data[index].data["amount"],
                                style: TextStyle(fontSize: 21.0,color: Colors.orange),
                              )

                          
                        ],
                      ),
                      
                    ),
                  
                  ),
                  
                );
                
                }
            );
          }
            
          }
      ),
      

    );
  }
}
