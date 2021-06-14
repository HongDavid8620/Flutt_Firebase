import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutt_firebase/models/detail.dart';
import 'package:flutt_firebase/models/widgets.dart';
class WidgetsController {
  final String detailId;
  final String title='';
  final String constructor='';
  final String description='';
  final String other='';
  var widgetcollection = FirebaseFirestore.instance.collection('widgets');

  WidgetsController({this.detailId});

  List<Widgets> _widgetList (QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      try{
      return Widgets(
        id: doc.id,
        title: doc['title'],
        description: doc['description']
      );
      }catch(e){
        print('error ${e.message}');
        // print( doc.get('gender').toString());
        return Widgets();
      }
    }).toList();
  }

  Stream <List<Widgets>> get widgets {
    return widgetcollection.snapshots().map(_widgetList);
  }

  Future<Detail> currentDetail() async {
    var snapshot =  await widgetcollection.doc(detailId).get();
    try{
      return Detail(
        constructor: snapshot['constructor'],
        description: snapshot['description'],
        other: snapshot['other'],
        sample: snapshot['sample'],
      );
    }catch(e){
        print('error ${e.message}');
        return Detail();
      }
    }

  
  Future<void> addWidget({String title, String constructor, String other, String description}){
    return widgetcollection.add({
      'title': title,
      'category':['Text'],
      'construtor':constructor,
      'other': other,
      'sample':'link',
      'description': description,
    });
  } 


}
