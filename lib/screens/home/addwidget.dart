import 'package:flutt_firebase/components/loading.dart';
import 'package:flutt_firebase/models/widgets.dart';
import 'package:flutt_firebase/screens/services/widgets/widgetscontroller.dart';
import 'package:flutter/material.dart';

import 'components/inputfield.dart';

class AddWidget extends StatefulWidget {
  const AddWidget({ Key key }) : super(key: key);

  @override
  _AddWidgetState createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _infolink = '';
  String _constructor = '';
  String _description = '';
  String _other = '';
  var _loading = false;
  @override
  Widget build(BuildContext context) {
    return _loading? Loading() : Scaffold(
      backgroundColor: Color.fromRGBO(43, 54, 72, 1),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 30),child: Text('Add Widget',style: TextStyle(fontSize: 30,color: Color.fromRGBO(175, 189, 209, 1)),)),
                  InputField(title: 'Title',labeltext: 'Enter widget name',lines: 1,onChanged: (val){setState(() => _title = val);}, validator: (val) => val.isEmpty ?'Invalid title':null,),
                  InputField(title: 'Info link',labeltext: 'Enter Link',lines: 5,onChanged: (val){setState(() => _infolink = val);}, validator:(val) => val.isEmpty ?'Pleases enter a link':null , ),
                  Container(
                    child: 
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Category'),
                                GestureDetector(
                                  onTap: (){
                                    print('Tapped Cat');
                                  },
                                  child: Container(
                                    child: Icon(Icons.cancel,size: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    
                  InputField(title: 'Construtor',labeltext: 'Enter constructor',lines: 5,onChanged: (val){setState(() => _constructor = val);}, validator:(val) => val.isEmpty ?'Pleases enter construtor':null , ),
                  InputField(title: 'Description',labeltext: 'Description for this widget',lines: 4,onChanged: (val){setState(() => _description = val);}, validator: (val) => val.isEmpty ?'Pleases enter description':null,),
                  InputField(title: 'Other',labeltext: 'Enter Other',lines: 3,onChanged: (val){setState(() => _other = val);}),
                  Padding(padding: EdgeInsets.only(top: 20),
                   child: ElevatedButton(
                      onPressed: () async {
                        setState(() => _loading = true);
                        if(_formKey.currentState.validate()){
                             dynamic result = WidgetsController().addWidget(title: _title, infolink: _infolink, description: _description,constructor: _constructor,other: _other);
                             print('Widget Added');
                                if (result == null){
                                  print("Please supply a valid more info");
                                }
                              Navigator.pop(context);
                        }
                        setState(() => _loading = false);
                        
                      }, 
                      child: Text("Insert"),
                      style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white70,
                    primary: Color.fromRGBO(33, 41, 54, 1),
                    minimumSize: Size(100,40),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                           ),),
                 ),
                 ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}

 