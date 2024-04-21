import 'package:country_time/services/world_time_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  bool loading = false;
  bool isDayTime = true;
  String bgImage = 'day.jpg';

  void getWorldTime()async {
    loading = true;
    WorldTime worldTime = WorldTime(
      location: 'London', 
      flag: 'uk.webp', 
      url: 'Europe/London'
    );
    await worldTime.getTime();
    loading = false;
    
   
    Navigator.of(context).pushReplacementNamed(
      '/home',
      arguments: {
        'location': worldTime.location,
        'flag': worldTime.flag,
        'time': worldTime.time,
        'isDayTime':worldTime.isDayTime,
      }
    );
  }

  @override
  void initState() {
    super.initState();
    getWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading ? const Center(
        child: SpinKitPouringHourGlassRefined(
          color: Colors.purple,
          size: 100.0,
        ),
      ): null,
    );
  }
}