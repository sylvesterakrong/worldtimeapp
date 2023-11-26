import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  late String time; //the time in that location
  String flag; //url to an asset's flag icon
  String url; //location url or api endpoint
  late bool isDaytime; //true or false if night or day

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    //try catch to hanle errors
    try {
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // ignore: avoid_print
      //print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      // ignore: avoid_print
      print('caught error: $e');
      time = 'could not get time data';
    }
  }

  //void getTime() {}
}
