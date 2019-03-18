import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';
import 'package:flutter_firestore_blogapp/DetailsPage.dart';

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

  passData(DocumentSnapshot snap){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>Details(snap: snap,)));
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
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Code With YDC"),
                accountEmail: new Text("ydc@gmail.com")
            ),
            new ListTile(
              title: new Text("First Page"),
              leading: new Icon(Icons.search,color: Colors.purple,),
            ),
            new ListTile(
              title: new Text("Second Page"),
              leading: new Icon(Icons.pages,color: Colors.orange,),
            ),
            new ListTile(
              title: new Text("Third Page"),
              leading: new Icon(Icons.add,color: Colors.green,),
            ),
            new ListTile(
              title: new Text("Fourth Page"),
              leading: new Icon(Icons.panorama,color: Colors.redAccent,),
            ),
            new ListTile(
              title: new Text("Fifth Page"),
              leading: new Icon(Icons.cake,color: Colors.blueAccent,),
            ),
            new Divider(
              height: 10.0,
              color: Colors.blueAccent,
            ),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: (){
                Navigator.of(context).pop();
              },
            )

          ],
        ),
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
                             new Container(
                               width: 200.0,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                   new InkWell(
                                     onTap: (){
                                       passData(snapshot.data[index]);
                                     },
                                     child:Text(snapshot.data[index].data["title"],
                                       maxLines: 1,
                                       style: TextStyle(fontSize: 23.0,color: Colors.orange),
                                     ),
                                   ),
                                   new Padding(padding: EdgeInsets.all(5.0)),
                                   new Text(snapshot.data[index].data["content"],
                                     maxLines: 2,
                                     style: TextStyle(color: Colors.black,),
                                   )


                                 ],
                               ),

                             ),

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
