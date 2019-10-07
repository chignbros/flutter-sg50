import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:sg50/src/provider/bottomNavigationProvider.dart';
import 'package:sg50/src/screens/home.dart';
import 'package:sg50/src/screens/medicassit.dart';
import 'package:sg50/src/screens/more.dart';
import 'package:sg50/src/screens/news.dart';
import 'package:sg50/src/utils/constColor.dart';
import 'package:sg50/src/utils/sg_icons.dart';
import 'package:sg50/src/widgets/appbar.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  String titleAppbar = 'Home';
  final currentTab = [
    Home(),
    NewsScreen(),
    MedicScreen(),
    MoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarProvider bottombarprovider = Provider.of(context);
    return Scaffold(
      appBar: AppbarWidget.appbar(title: titleAppbar),
      drawer: Drawer(
        child: Container(
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
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Image.asset('images/SG50 Logo Full.png',width: 50.0,height: 50.0,),
              ),
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(color: selectedColor),
                ),
                leading: Icon(SgIcons.house, color: selectedColor),
                trailing:
                    Icon(FontAwesomeIcons.angleRight, color: selectedColor),
              ),
              ListTile(
                title: Text(
                  'Booking Appointment',
                  style: TextStyle(color: selectedColor),
                ),
                leading:
                    Icon(SgIcons.stethoscope, color: selectedColor),
                trailing:
                    Icon(FontAwesomeIcons.angleRight, color: selectedColor),
              ),
              ListTile(
                title: Text(
                  'Re-Fill Medication',
                  style: TextStyle(color: selectedColor),
                ),
                leading: Icon(SgIcons.pill, color: selectedColor),
                trailing:
                    Icon(FontAwesomeIcons.angleRight, color: selectedColor),
              ),
              ListTile(
                title: Text(
                  'Health Checkup Package',
                  style: TextStyle(color: selectedColor),
                ),
                leading: Icon(FontAwesomeIcons.heartbeat, color: selectedColor),
                trailing:
                    Icon(FontAwesomeIcons.angleRight, color: selectedColor),
              ),
              ListTile(
                title: Text(
                  'Contact US',
                  style: TextStyle(color: selectedColor),
                ),
                leading: Icon(SgIcons.people, color: selectedColor),
                trailing:
                    Icon(FontAwesomeIcons.angleRight, color: selectedColor),
              ),
              ListTile(
                title: Text(
                  'Exit',
                  style: TextStyle(color: selectedColor),
                ),
                leading:
                    Icon(SgIcons.exit, color: selectedColor),
                trailing:
                    Icon(FontAwesomeIcons.angleRight, color: selectedColor),
              ),
            ],
          ),
        ),
      ),
      body: currentTab[bottombarprovider.getcurrentIndex],
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.white,
          ),
          child: GradientBottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColorStart: mainColor,
            backgroundColorEnd: mainColorbottom,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  SgIcons.house,
                  color: bottombarprovider.getcurrentIndex == 0
                      ? selectedColor
                      : unSelectedColor,
                  size: bottombarprovider.getcurrentIndex == 0 ? 30.0 : 25.0,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: bottombarprovider.getcurrentIndex == 0
                        ? selectedColor
                        : unSelectedColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  SgIcons.news,
                  color: bottombarprovider.getcurrentIndex == 1
                      ? selectedColor
                      : unSelectedColor,
                  size: bottombarprovider.getcurrentIndex == 1 ? 30.0 : 25.0,
                ),
                title: Text(
                  "News",
                  style: TextStyle(
                    color: bottombarprovider.getcurrentIndex == 1
                        ? selectedColor
                        : unSelectedColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  SgIcons.sg50,
                  color: bottombarprovider.getcurrentIndex == 2
                      ? selectedColor
                      : unSelectedColor,
                  size: bottombarprovider.getcurrentIndex == 2 ? 30.0 : 25.0,
                ),
                title: Text(
                  "MedicAssist",
                  style: TextStyle(
                    color: bottombarprovider.getcurrentIndex == 2
                        ? selectedColor
                        : unSelectedColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.ellipsisH,
                  color: bottombarprovider.getcurrentIndex == 3
                      ? selectedColor
                      : unSelectedColor,
                  size: bottombarprovider.getcurrentIndex == 3 ? 30.0 : 25.0,
                ),
                title: Text(
                  "More",
                  style: TextStyle(
                    color: bottombarprovider.getcurrentIndex == 3
                        ? selectedColor
                        : unSelectedColor,
                  ),
                ),
              )
            ],
            onTap: (index) {
              bottombarprovider.setcurrentIndex = index;
              switch (index) {
                case 0:
                  titleAppbar = 'Home';
                  break;
                case 1:
                  titleAppbar = 'News';
                  break;
                case 2:
                  titleAppbar = 'MedicAssist';
                  break;
                case 3:
                  titleAppbar = 'More';
                  break;
              }
            },
          )),
    );
  }
}
