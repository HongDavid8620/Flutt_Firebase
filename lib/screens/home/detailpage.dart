import 'package:flutt_firebase/components/loading.dart';
import 'package:flutt_firebase/models/detail.dart';
import 'package:flutt_firebase/screens/services/detail/detailController.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/rendering.dart';

class DetailPage extends StatefulWidget {
  final String docid,title;
  const DetailPage({Key key, this.docid, this.title}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState(docid: docid,title: title);
}

class _DetailPageState extends State<DetailPage> {
  final String docid,title ;
  _DetailPageState({this.docid,this.title});
  dynamic detail;

  @SemanticsHintOverrides()
  Widget build(BuildContext context) {    
        return FutureBuilder<Detail>(
          future: DetailController(detailId: docid).currentDetail(),
          builder:(context, detail)
          {
            if (detail.hasData){
              return Scaffold(
                appBar: AppBar(title: Text(title),),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sample
                      Padding(child: Text('Sample',style: TextStyle(fontSize: 30),),padding:EdgeInsets.all(30)),
                      Container(height: (MediaQuery.of(context).size.width -40) *0.2878,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/text.jpg'),fit: BoxFit.fitWidth),
                        color: Colors.grey[300],
                      ),
                      ),
                      //Constructor
                      Padding(child: Text('Constructor',style: TextStyle(fontSize: 20),),padding:EdgeInsets.only(left:30,top: 25,bottom: 10)),
                      Container(width: MediaQuery.of(context).size.width,margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.only(left:10), 
                      child: DetailText(text: detail.data.constructor,)
                      ),
                      Container(width: MediaQuery.of(context).size.width,margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.only(left:10,top:25), 
                      child: DetailText(text: detail.data.constructor,)
                      ),
                      // Description
                      Padding(child: Text('Description',style: TextStyle(fontSize: 20),),padding:EdgeInsets.only(left:30,top: 25,bottom: 10)),
                      Container(width: MediaQuery.of(context).size.width,margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.only(left:10,top:25), 
                      child:DetailText(text: detail.data.description)
                      ),
                      //Other
                      Padding(child: Text('Other',style: TextStyle(fontSize: 20),),padding:EdgeInsets.only(left:30,top: 25,bottom: 10)),
                      Container(width: MediaQuery.of(context).size.width,margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.only(left:10,top:25), 
                      child:DetailText(text: detail.data.other)
                      ),
                      
                    ],
                  ),
                ),
              );
            }
            else {
              return Loading();
            }
          }
        );
  }
}

class DetailText extends StatelessWidget {
  final String text;
  const DetailText({
    Key key, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      "$text",
      style: TextStyle(height: 1.5,letterSpacing: 0.2,wordSpacing: 1),
      trimLines: 2,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Expand',
      trimExpandedText: 'Show less',
      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          );
  }
}
