import 'package:flutter/material.dart';

import 'constants.dart';
import 'post_card.dart';

class BodyLastestPosts extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          switch(index){
            case 0: {
              return newPostButton;
            }
            break;

            case 1: {
              return exploreTitle;
            }
            break;

            default: {
              return PostCard();
            }
            break;
          }
        },
      ),
    );
  }
}