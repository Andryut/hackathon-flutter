import 'package:flutter/material.dart';


class PostCard extends StatefulWidget{
  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  int likes = 0;
  int comments = 0;
  String name = 'Santiago Velandia';
  String message = 'I loved having participated in this hackathon';

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.account_circle, size: 35,),
                      margin: EdgeInsets.all(10),
                    ),
                    Container(
                      child: Text(
                        '$name',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "RobotoBold"
                        ),
                      ),
                    )
                  ],
                )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text("$message"),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 11, 0, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Color(0xff828282),
                          ),
                          onPressed: () { setState(() {likes+=1;});},
                        ),
                        Text(
                          '$likes Likes',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: new IconButton(
                              icon: Icon(
                                Icons.comment,
                                color: Color(0xff828282),
                              ),
                              onPressed: () { setState(() {comments+=1;});},
                            ),
                          ),
                          Text(
                            '$comments Comments',
                          ),
                        ],
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}