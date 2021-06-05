import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutt_firebase/models/widgets.dart';
class WidgetsController {

  var widgetcollection = FirebaseFirestore.instance.collection('widgets');

  List<Widgets> _widgetList (QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      try{
      return Widgets(

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
}