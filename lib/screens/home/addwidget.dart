import 'package:flutt_firebase/components/loading.dart';
import 'package:flutt_firebase/models/widgets.dart';
import 'package:flutt_firebase/screens/services/widgets/widgetscontroller.dart';
import 'package:flutter/material.dart';

class AddWidget extends StatefulWidget {
  const AddWidget({ Key key }) : super(key: key);

  @override
  _AddWidgetState createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  
  final _formKey = GlobalKey<FormState>();
  String _title = '';
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
                  InputField(title: 'Construtor',labeltext: 'Enter constructor',lines: 5,onChanged: (val){setState(() => _constructor = val);}, validator:(val) => val.isEmpty ?'Pleases enter construtor':null , ),
                  InputField(title: 'Description',labeltext: 'Description for this widget',lines: 4,onChanged: (val){setState(() => _description = val);}, validator: (val) => val.isEmpty ?'Pleases enter description':null,),
                  InputField(title: 'Other',labeltext: 'Enter Other',lines: 3,onChanged: (val){setState(() => _other = val);}, validator: (val) => val.isEmpty ?'Please enter other':null,),
                  Padding(padding: EdgeInsets.only(top: 20),
                   child: ElevatedButton(
                      onPressed: () async {
                        setState(() => _loading = true);
                        if(_formKey.currentState.validate()){
                             dynamic result = WidgetsController().addWidget(title: _title,description: _description,constructor: _constructor,other: _other);
                             print('Widget Added');
                                if (result == null){
                                  print("Please supply a valid more info");
                                }
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

class InputField extends StatefulWidget {
  final title,labeltext,lines;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  const InputField({
    Key key, this.title, this.labeltext, this.lines, this.onChanged, this.validator
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: 30, left: 10,bottom: 15),
                child: Text(widget.title,style: TextStyle(fontSize: 18,color: Color.fromRGBO(175, 189, 209, 1)),),
               ),
          TextFormField(
                    style: TextStyle(color: Color.fromRGBO(175, 189, 209, 1),fontSize: 13),
                    validator: widget.validator,
                    onChanged: widget.onChanged,
                    keyboardType: TextInputType.multiline,
                    maxLength: null,
                    maxLines: widget.lines,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(33, 41, 54, 1),
                      border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                      )),
                      labelText: widget.labeltext,
                      labelStyle: TextStyle(color: Color.fromRGBO(175, 189, 209, 1)),
                    ),
                  ),
      ],
    );
  }
}