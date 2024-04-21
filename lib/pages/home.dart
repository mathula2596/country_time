import 'package:country_time/services/world_time_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map timeData = {};
  String bgImage = 'day.jpg';
  @override
  Widget build(BuildContext context) {
    
    timeData = timeData.isEmpty?ModalRoute.of(context)!.settings.arguments as Map:timeData;
    bgImage = timeData['isDayTime']?'day.jpg':'night.webp';

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.icon(
                  icon: const Icon(Icons.location_on),
                  label: const Text('Edit Location',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    
                    ),
                  ),
                  onPressed: () async {
                    dynamic result =  await Navigator.pushNamed(context, '/location');
                    setState(() {
                      timeData = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDayTime': result['isDayTime'],
                      };
                    });
                  },
                ),
                const SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/img/${timeData['flag']}',
                      ),
                      height: 50.0,
                      width: 50.0,
                    ),
                    const SizedBox(width: 20.0),
                    Text(timeData['location'],
                      style: TextStyle(
                        fontSize: 68.0,
                        fontWeight: FontWeight.bold,
                        color: timeData['isDayTime']? Colors.grey[800]:Colors.white
                      ),
                    ),
                  ],
                ),
                Text(timeData['time'],
                  style: TextStyle(
                    fontSize: 78.0,
                    fontWeight: FontWeight.bold,
                    color: timeData['isDayTime']? Colors.grey[800]:Colors.white
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}