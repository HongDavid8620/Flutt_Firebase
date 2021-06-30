import 'package:flutter/material.dart';

class CatRow extends StatefulWidget {
  const CatRow({
    Key key,
  }) : super(key: key);

  @override
  _CatRowState createState() => _CatRowState();
}

class _CatRowState extends State<CatRow> {
  String disable = 'All';
  @override
  Widget build(BuildContext context) {
    print('Rebuilded');
    return Row(
      children: [                    
        Catbtn(text: 'All',onPressed: disable != 'All'? (){setState(() {
          disable = 'All';
          });
          }
        :null
        ),
        Catbtn(text: 'Basic',onPressed: disable != 'Basic'? (){setState(() {
          disable = 'Basic';
          });
          }
        :null
        ),Catbtn(text: 'Decoration',onPressed: disable != 'Decoration'? (){setState(() {
          disable = 'Decoration';
          });
          }
        :null
        ),                  
      ]
    );
  }
}

class Catbtn extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const Catbtn({
    Key key, this.text, this.onPressed,
  }) : super(key: key);
  static String disable;

  @override
  _CatbtnState createState() => _CatbtnState();
}

class _CatbtnState extends State<Catbtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(widget.text),
        style: ButtonStyle(
          shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )), 
        ),
      ),
    );
  }
}