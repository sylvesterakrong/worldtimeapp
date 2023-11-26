import 'package:flutter/material.dart';
import 'package:timeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Paris', flag: 'france.jpg', url: 'Europe/Paris'),
    WorldTime(location: 'London', flag: 'uk.jpg', url: 'Europe/London'),
    WorldTime(location: 'Toronto', flag: 'canada.jpg', url: 'America/Toronto'),
    WorldTime(
        location: 'NewYork', flag: 'america.jpg', url: 'America/New_York'),
    WorldTime(
        location: 'Johannesburg',
        flag: 'southafrica.jpg',
        url: 'Africa/Johannesburg'),
    WorldTime(location: 'Nairobi', flag: 'kenya.jpg', url: 'Africa/Nairobi'),
    WorldTime(location: 'Tokyo', flag: 'japan.jpg', url: 'Asia/Tokyo'),
    WorldTime(
        location: 'Singapore', flag: 'singapore.jpg', url: 'Asia/Singapore')
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate the homescreen
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  // ignore: avoid_print
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
