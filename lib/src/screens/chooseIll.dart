import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:sg50/src/model/IllModel.dart';
import 'package:sg50/src/provider/illInformation.dart';
import 'package:sg50/src/utils/constColor.dart';

class IllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IllProvider ill = Provider.of(context);
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text('Choose ill'),
        backgroundColorStart: mainColor,
        backgroundColorEnd: mainColorbottom,
      ),
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
        child: FutureBuilder<List<IllModel>>(
          future: ill.ills.getIll(),
          builder: (context,snapshot){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
                final ill = snapshot.data[index];
                return ListTile(
                  title: Text(ill.name),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
