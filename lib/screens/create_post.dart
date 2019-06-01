import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget{

  CreatePost({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreatePost();
}

class _CreatePost extends State<CreatePost> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Create new post',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                ),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter the title of the post'
                    )
                )
              ],
            )),
      )

      );
  }


}