import 'package:flutt_firebase/components/loading.dart';
import 'package:flutt_firebase/models/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/widgetslideable.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final widget = context.watch<List<Widgets>>() ?? [];

      if(widget !=null){
        print(widget.length);
        return ListView.builder(  
                  itemCount: widget.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                         return Widgetslidable(obj: widget[index],);
                  }
                       
                );
    }else{
      return Loading();
    }
  }
}