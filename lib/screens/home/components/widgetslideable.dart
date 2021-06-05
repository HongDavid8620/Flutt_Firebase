import 'package:flutt_firebase/screens/home/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Widgetslidable extends StatelessWidget {
    final obj;
  const Widgetslidable({Key key, this.obj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
                      return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            onTap: ((){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> DetailPage(docid: obj.docid,title: obj.age,) ));
                            }),
                            leading: CircleAvatar(
                              backgroundColor: Colors.indigoAccent,
                              child: Text('U'),
                              foregroundColor: Colors.white,
                            ),
                            title: Text(obj.name),
                            subtitle: Text('Age: ${obj.age}  Gender: ${obj.gender} DocId: ${obj.docid},'),
                          ),
                        ),
                        
                        // // left side
                        // actions: <Widget>[
                        //   IconSlideAction(
                        //     caption: 'Archive',
                        //     color: Colors.blue,
                        //     icon: Icons.archive,
                        //     onTap: () {},
                        //   ),
                        //   IconSlideAction(
                        //     caption: 'Share',
                        //     color: Colors.indigo,
                        //     icon: Icons.share,
                        //     onTap: () {} ,
                        //   ),
                        // ],

                        // right side
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'More',
                            color: Colors.black45,
                            icon: Icons.more_horiz,
                            onTap: () {},
                          ),
                          IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () {},
                          ),
                        ],
                      );;
  
  }
}