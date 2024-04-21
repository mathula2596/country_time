import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String? location;
  String? flag;
  String? url;
  String? time;
  bool isDayTime = true;

  WorldTime({required this.location, required this.flag, required this.url});

  Future <void> getTime() async {
    try{
      Response response = await http.get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));

      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset))); 

      time = DateFormat.jm().format(now); 

      isDayTime = now.hour > 6 && now.hour < 22 ? true : false;

    }
    catch(e){
      print(e);
      time = 'Something went wrong, Try again later!';
    }
   
   

  }
}