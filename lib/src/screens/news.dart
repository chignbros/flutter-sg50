import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sg50/src/provider/newsProvider.dart';
import 'package:sg50/src/utils/constColor.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsProvider newsProvider = Provider.of(context);

    return Container(
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
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.builder(
          itemCount: newsProvider.newsData.length,
          itemBuilder: (ctx, index) {
            return Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, 'newsDetail',
                          arguments: newsProvider.newsData[index]);
                    },
                    leading: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            newsProvider.newsData[index].newsImages[0].imageURL,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Image.network(
                          'https://region4.uaw.org/sites/default/files/bio/10546i3dac5a5993c8bc8c_3.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      'Posted : ${newsProvider.newsData[index].postDate}',
                      style: TextStyle(color: Colors.white),
                    ),
                    title: Text(
                      newsProvider.newsData[index].title,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.angleRight,
                      color: Colors.white,
                    ),
                  ),
                  Divider(
                    color: Colors.cyan[100],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
