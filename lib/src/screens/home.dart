import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sg50/src/provider/homeProvider.dart';
import 'package:sg50/src/screens/splash.dart';
import 'package:sg50/src/utils/constColor.dart';
import 'package:sg50/src/widgets/centerMenu.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar();
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double appbarHeight = appbar.preferredSize.height;
    final double bottomBarHeight = MediaQuery.of(context).padding.bottom;
    final HomeProvider homeProvider = Provider.of(context);
    if (homeProvider.companiesImg.length == 0) {
      return SplashScreen();
    }
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
        onRefresh: () async {
          await Future.value([homeProvider.refresh()]);
        },
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: backgroundItemColor,
              ),
              width: width,
              height: (height * 30) / 100 -
                  statusBarHeight -
                  appbarHeight -
                  bottomBarHeight,
              child: CarouselSlider(
                height: (height * 15) / 100 -
                    statusBarHeight -
                    appbarHeight -
                    bottomBarHeight,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                enlargeCenterPage: false,
                viewportFraction: 1.0,
                autoPlayAnimationDuration: Duration(seconds: 1),
                items: homeProvider.companiesImg.map((company) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'bannerDetail',
                          arguments: company);
                    },
                    child: Image.network(company.imageUrl),
                  );
                }).toList(),
              ),
            ),
            CenterMenu(
              width: width,
              height: (height * 55) / 100 -
                  statusBarHeight -
                  appbarHeight -
                  bottomBarHeight,
            ),
          ],
        ),
      ),
    );
  }
}
