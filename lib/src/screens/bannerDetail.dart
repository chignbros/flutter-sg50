import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:sg50/src/model/company.dart';
import 'package:sg50/src/services/launcher.dart';
import 'package:sg50/src/utils/constColor.dart';

class BannerDetail extends StatelessWidget {
  BannerDetail({this.company});
  final CompanyModel company;
  @override
  Widget build(BuildContext context) {
    LanuchService lanuchService = LanuchService();
    final appbar = GradientAppBar(
      centerTitle: true,
      title: Text(company.name),
      backgroundColorStart: mainColor,
      backgroundColorEnd: mainColorbottom,
    );
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appbar,
        body: Container(
          margin: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
          width: double.infinity,
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
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: backgroundItemColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 3,
                    child: Image.network(
                      company.imageUrl,
                      fit: BoxFit.contain,
                      width: 150,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      company.name,
                      style: TextStyle(
                          color: mainColorbottom,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    company.description,
                    style: TextStyle(
                      color: mainColorbottom,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  HeaderDetail(
                    icon: FontAwesomeIcons.mapPin,
                    title: 'Address',
                  ),
                  Text(
                    company.address,
                    style: TextStyle(
                      color: mainColorbottom,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  HeaderDetail(
                    icon: FontAwesomeIcons.phoneVolume,
                    title: 'Phone',
                  ),
                  GestureDetector(
                    onTap: () {
                      _showAlertAndroid(
                        phone: company.phone,
                        onTap: () {
                          lanuchService.goToWeb('tel://${company.phone}');
                        },
                        context: context,
                      );
                      //lanuchService.goToWeb('tel://${company.phone}');
                    },
                    child: Text(
                      company.phone,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: mainColorbottom,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  HeaderDetail(
                    icon: FontAwesomeIcons.envelope,
                    title: 'Email',
                  ),
                  GestureDetector(
                    onTap: () {
                      lanuchService.goToWeb('mailto:${company.email}');
                    },
                    child: Text(
                      company.email,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: mainColorbottom,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  HeaderDetail(
                    icon: FontAwesomeIcons.chrome,
                    title: 'Website',
                  ),
                  GestureDetector(
                    onTap: () {
                      lanuchService.goToWeb(company.website);
                    },
                    child: Text(
                      company.website,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: mainColorbottom,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: (){
                      lanuchService.goToWeb(company.website);
                    },
                    child: Center(
                      child: Container(
                        width: 180.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            'Vist us on website',
                            style: TextStyle(color: mainColorbottom),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showAlertAndroid({String phone, Function onTap, BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Outgoing Call'),
      content: Text("Do you want to call: $phone"),
      actions: <Widget>[
        FlatButton(
          child: Text("CANCEL"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text("CALL"),
          onPressed: onTap,
        ),
      ],
    ),
  );
}

class HeaderDetail extends StatelessWidget {
  HeaderDetail({this.title, this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: mainColorbottom,
        ),
        Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: mainColorbottom)),
      ],
    );
  }
}
