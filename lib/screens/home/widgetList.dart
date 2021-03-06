import 'package:flutt_firebase/components/category_nav.dart';
import 'package:flutt_firebase/components/loading.dart';
import 'package:flutt_firebase/models/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/widgetslideable.dart';

class WidgetList extends StatefulWidget {
  @override
  _WidgetListState createState() => _WidgetListState();
}

class _WidgetListState extends State<WidgetList> {
  @override
  Widget build(BuildContext context) {

    final widget = context.watch<List<Widgets>>() ?? [];
      if(widget !=null){
        print('list lenght: ${widget.length}');
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 5,),
                SingleChildScrollView(                  
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                  child: CatRow(),
                ),
                ListView.builder(  
                          itemCount: widget.length,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                                 return WidgetCard(obj: widget[index],);
                          }                       
                        ),
              ],
            ),
          ),
        );
    }else{
      return Loading();
    }
  }
}
