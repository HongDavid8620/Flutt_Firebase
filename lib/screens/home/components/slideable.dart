import 'package:flutt_firebase/models/users.dart';
import 'package:flutt_firebase/screens/home/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class slidableWidget extends StatelessWidget {
    final Users users;
  const slidableWidget({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
                      return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            onTap: ((){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> DetailPage(docid: users.docid,title: users.age,) ));
                            }),
                            leading: CircleAvatar(
                              backgroundColor: Colors.indigoAccent,
                              child: Text('U'),
                              foregroundColor: Colors.white,
                            ),
                            title: Text(users.name),
                            subtitle: Text('Age: ${users.age}  Gender: ${users.gender} DocId: ${users.docid},'),
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