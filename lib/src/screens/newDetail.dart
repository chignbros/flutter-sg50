import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:sg50/src/model/newsmodel.dart';
import 'package:sg50/src/utils/constColor.dart';
import 'package:html/dom.dart' as dom;

class NewDetail extends StatelessWidget {
  NewDetail({this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    final appbar = GradientAppBar(
      centerTitle: true,
      title: Text('News Detail'),
      backgroundColorStart: mainColor,
      backgroundColorEnd: mainColorbottom,
    );
    return Scaffold(
      appBar: appbar,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              mainColor,
              mainColorbottom,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.network(newsModel.newsImages[0].imageURL),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              newsModel.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Posted: ${newsModel.postDate}',
              style: TextStyle(color: Colors.white),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.all(10.0),
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Html(
                    data: newsModel.content,
                    customTextStyle: (dom.Node node, TextStyle baseStyle) {
                      if (node is dom.Element) {
                        switch (node.localName) {
                          case "p":
                            return baseStyle
                                .merge(TextStyle(color: Colors.white));
                        }
                      }
                      return baseStyle;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
