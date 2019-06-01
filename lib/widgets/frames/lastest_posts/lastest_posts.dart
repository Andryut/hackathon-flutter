import 'package:flutter/material.dart';
import 'package:fluttering/widgets/top_bar_search.dart';

import 'body_lastest_post.dart';

class LastestPosts extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar,
      body: BodyLastestPosts(),
    );
  }

}