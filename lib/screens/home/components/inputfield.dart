import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final title,labeltext,lines;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final icon;
  const InputField({
    Key key, this.title, this.labeltext, this.lines, this.onChanged, this.validator, this.icon
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
        widget.title!= null ? Padding(padding: EdgeInsets.only(top: 30, left: 10,bottom: 15),
                                      child: Text(widget.title,style: TextStyle(fontSize: 18,color: Color.fromRGBO(175, 189, 209, 1)),),
                                      )
        :SizedBox(),
               
        TextFormField(
                    
                    style: TextStyle(color: Color.fromRGBO(175, 189, 209, 1),fontSize: 13),
                    validator: widget.validator,
                    onChanged: widget.onChanged,
                    keyboardType: TextInputType.multiline,
                    maxLength: null,
                    maxLines: widget.lines,
                    decoration: InputDecoration(
                      prefixIcon: widget.icon,
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