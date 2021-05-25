import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String docname;

  const DetailPage({Key key, this.docname}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          flexibleSpace: const FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Text('Detail'),
              ),
            ]
          )
          )
      ],
    );
  }
}