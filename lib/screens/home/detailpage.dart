import 'package:flutt_firebase/components/loading.dart';
import 'package:flutt_firebase/models/detail.dart';
import 'package:flutt_firebase/screens/services/widgets/widgetscontroller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

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
          future: WidgetsController(detailId: docid).currentDetail(),
          builder:(context, detail)
          {
            if (detail.hasData && detail.data.constructor != null){
              return Scaffold(
                backgroundColor: Color.fromRGBO(43, 54, 72, 1),
                appBar: AppBar(title: Text(title,style: TextStyle(color: Color.fromRGBO(175, 189, 209, 1)),)),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sample
                    (false)? SizedBox():
                      Header(text: 'Sample',),                      
                      Container(height: (MediaQuery.of(context).size.width -40) *0.4878,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(33, 41, 54, 1)
                      ),
                      child:FutureBuilder(
                        future: WidgetsController().getSampleImg(imageName: detail.data.sample),
                        builder: (context, snapshot){
                          if(snapshot.connectionState == ConnectionState.done && snapshot.data != null){
                          return Image(image: NetworkImage("${snapshot.data}"),fit: BoxFit.fitWidth,);
                          }
                          else{
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                      ),
                      
                      //video
                      Header(text: 'Flutter Video',),
                      Padding(padding: EdgeInsets.only(left: 30,top: 10),
                         child: RichText(text: TextSpan(
                                      text: '${detail.data.link}',
                                      style: TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async{ var url = ('${detail.data.link}');
                                      if(await canLaunch(url)){
                                          await launch(url);
                                      }else{
                                        throw "Cannot load url";
                                      }
                                      },
                                    ), 
                         ),
                       ),                 
                      //  YoutubePlayer(
                      //       controller: _controller,
                      //       showVideoProgressIndicator: true,
                      //       progressIndicatorColor: Colors.blueAccent,
                      //   ),

                      //Constructor
                      Header(text: 'Constructor',),
                      TextBody(text: detail.data.constructor),
                      TextBody(text: detail.data.constructor,)
                      ,
                      // Description
                      Header(text: 'Description',),
                      TextBody(text: detail.data.description),
                      //Other
                      
                      (detail.data.other != '')?Header(text: 'Other',): SizedBox(height: 1,),
                      TextBody(text: (detail.data.other)),
                      
                      SizedBox(height: 50,)
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

class TextBody extends StatelessWidget {
  final String text;
  const TextBody({
    Key key, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width,margin: EdgeInsets.symmetric(horizontal: 20),
    padding: EdgeInsets.only(left:10,top: 10), 
    child: ReadMoreText(
      "$text",
      style: TextStyle(height: 1.5,letterSpacing: 0.0,wordSpacing: 0.0,color: Color.fromRGBO(175, 189, 209, 1)),
      trimLines: 2,
      colorClickableText: Colors.white,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Expand',
      trimExpandedText: 'Show less',
      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
          )
    );
  }
}

class Header extends StatelessWidget {
  final String text;
  const Header({
    Key key, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(child: Text('$text',style: TextStyle(fontSize: 25,color: Color.fromRGBO(175, 189, 209, 1)),),
                    padding:EdgeInsets.only(top:20, left: 15 ,bottom: 5));
  }
}

