import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutt_firebase/models/detail.dart';

class DetailController {
  final String detailId;
  
  DetailController({this.detailId});

  var detailCollection = FirebaseFirestore.instance.collection('widget_detail');

  Future<Detail> currentDetail() async {
    var snapshot =  await detailCollection.doc(detailId).get();
    try{
      return Detail(
        constructor: snapshot['constructor'],
        description: snapshot['description'],
        other: snapshot['other'],
        property: snapshot['property'],
        sample: snapshot['sample'],
      );
    }catch(e){
        print('error ${e.message}');
        return Detail();
      }
    }

}