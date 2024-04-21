import 'package:country_time/services/world_time_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'uk.webp', url: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Athens', flag: 'greece.png', url: 'Europe/Athens'),
    WorldTime(location: 'Cairo', flag: 'egypt.webp', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'usa.webp', url: 'America/Chicago'),
    WorldTime(location: 'New York', flag: 'usa.webp', url: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: 'south_korea.webp', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
    WorldTime(location: 'Sri Lanka', flag: 'srilanka.png', url: 'Asia/Colombo'),
    WorldTime(location: 'India', flag: 'india.webp', url: 'Asia/Dili'),
    WorldTime(location: 'Canada', flag: 'canada.png', url: 'America/Toronto'),


  ];

  void changeLocation(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    Navigator.pop(context, {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Change Location", 
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.purple[900],

      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 8.0
            
            ),
            child: Card(
              child: ListTile(
                onTap: (){
                  changeLocation(index);
                },
                title: Text(locations[index].location!),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/img/${locations[index].flag}'),
                ),
            
              ),
            ),
          );
        },
      ),
    );
  }
}