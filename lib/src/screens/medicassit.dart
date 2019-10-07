import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sg50/src/model/company.dart';
import 'package:sg50/src/provider/homeProvider.dart';
import 'package:sg50/src/screens/bannerDetail.dart';
import 'package:sg50/src/utils/constColor.dart';

class MedicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider = Provider.of(context);
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
      child: FutureBuilder<List<CompanyModel>>(
        future: homeProvider.httpService.getApi(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              final company = snapshot.data[index];
              return CompanyCard(
                onTap: () {
                  Navigator.pushNamed(context, 'bannerDetail',
                      arguments: company);
                },
                image: AspectRatio(
                  aspectRatio: 16 / 3,
                  child: Image.network(company.imageUrl),
                ),
                title: company.name,
                content: company.description,
                phone: company.phone,
                email: company.email,
                address: company.address,
              );
            },
          );
        },
      ),
    );
  }
}

class CompanyCard extends StatelessWidget {
  CompanyCard(
      {this.content,
      this.title,
      this.address,
      this.image,
      this.email,
      this.phone,
      this.onTap});
  final Widget image;
  final String content;
  final String address;
  final String title;
  final String phone;
  final String email;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(5.0, 0, 5.0, 5.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: backgroundItemColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            image,
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              content,
              maxLines: 5,
            ),
            SizedBox(
              height: 10.0,
            ),
            HeaderDetail(
              icon: FontAwesomeIcons.mapPin,
              title: 'Address',
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(address),
            SizedBox(
              height: 10.0,
            ),
            HeaderDetail(
              icon: FontAwesomeIcons.phoneVolume,
              title: 'Phone',
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(phone),
            SizedBox(
              height: 10.0,
            ),
            HeaderDetail(
              icon: FontAwesomeIcons.envelope,
              title: 'Email',
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(email),
          ],
        ),
      ),
    );
  }
}
