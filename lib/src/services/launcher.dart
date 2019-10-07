import 'package:url_launcher/url_launcher.dart';

class LanuchService{
  goToWeb(String url) async{
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could open';
    }
  }
}