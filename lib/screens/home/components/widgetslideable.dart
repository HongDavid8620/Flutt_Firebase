import 'package:flutt_firebase/models/detail.dart';
import 'package:flutt_firebase/models/widgets.dart';
import 'package:flutt_firebase/screens/home/addwidget.dart';
import 'package:flutt_firebase/screens/home/detailpage.dart';
import 'package:flutt_firebase/screens/services/widgets/widgetscontroller.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Widgetslidable extends StatelessWidget {
  final Widgets obj;
  const Widgetslidable({Key key, this.obj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var descriplength = (obj.description.length * 0.5).round();
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),                          
                          color: Color.fromRGBO(33, 41, 54, 1),
                        ),  
                          child: Row(                
                            crossAxisAlignment: CrossAxisAlignment.start,      
                            children: [
                              Padding(padding: EdgeInsets.only(right: 10 ,top: 5),
                              child: Icon(Icons.favorite,color: Colors.pink,size: 35,)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(child: Text('${obj.title}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromRGBO(175, 189, 209, 1)),)),
                                    Container(padding: EdgeInsets.only(top: 10,bottom: 10),
                                      child: Text('${obj.description.substring(0 ,descriplength > 250 ? 250 : descriplength)} . . . ',
                                    style: TextStyle(fontSize: 14,color: Color.fromRGBO(175, 189, 209, 0.7)),),),
                                    ElevatedButton(onPressed: (){
                                        WidgetsController().getSampleImg(imageName: 'samwid_container');
                                        Navigator.push(context,PageTransition(type: PageTransitionType.fade, child: DetailPage(title: obj.title,docid: obj.id,) ));
                                    },                                         
                                        child: Text('Read More',
                                        style: TextStyle(fontSize: 13,color: Colors.white70)),
                                        style: ElevatedButton.styleFrom(
                                          primary: Color.fromRGBO(25, 118, 210, 1),
                                        )
                                        )
                                  ],
                                ),
                              )
                            ],
                          
                          ) 



                          // ListTile(
                          //   onTap: ((){
                          //     Navigator.push(context,MaterialPageRoute(builder: (context)=> DetailPage(docid: obj.id,title: obj.title,) ));
                          //     }),
                          //   leading: CircleAvatar(
                          //     backgroundColor: Colors.indigoAccent,
                          //     child: Text('U'),
                          //     foregroundColor: Colors.white,
                          //   ),
                          //   title: Text(obj.title),
                          //   subtitle: Text('Age: ${obj.subtitle},'),
                          // )
                      );
                        
                        
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
                         
  }
}