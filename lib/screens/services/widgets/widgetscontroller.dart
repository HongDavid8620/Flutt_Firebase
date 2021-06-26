import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutt_firebase/models/detail.dart';
import 'package:flutt_firebase/models/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
      print("detailID: $detailId");
      return Detail(
        link: snapshot['link'],
        constructor: snapshot['constructor'],
        description: snapshot['description'],
        other: snapshot['other'],
        sample: snapshot['sample'],
      );
    } catch(e){
        print('error Detail ${e.message} with ID ${detailId}');
        return Detail();
      }
    }

    Future<dynamic> getSampleImg({String imageName}) async {
      String image;
      image = await firebase_storage.FirebaseStorage.instance
      .ref('sample_img/samwid_container.png')
      .getDownloadURL();
      return image;
    }

  
  Future<void> addWidget({String title, String sample, String infolink, String constructor, String other, String description}){
    return widgetcollection.add({
      'title': title,
      'sample': sample ?? '',
      'link': infolink,
      'category':['Text'],
      'constructor':constructor,
      'other': other,
      'sample':'link',
      'description': description,
    });
  } 


}
