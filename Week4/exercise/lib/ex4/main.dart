import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.menu, color: Colors.white),
            ),
          ],
          backgroundColor: Colors.blue[200],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              WeatherBlock(
                city: 'Phnom Penh',
                min: '10.0',
                max: '30.0',
                currentTemp: '12.2',
                weather: Weather.cloudy,
                startColor: Colors.purple[100]!,
                endColor: Colors.purple[200]!,
              ),
              WeatherBlock(
                city: 'Paris',
                min: '10.0',
                max: '30.0',
                currentTemp: '22.2',
                weather: Weather.sunnyCloudy,
                startColor: Colors.teal[200]!,
                endColor: Colors.teal,
              ),
              WeatherBlock(
                city: 'Rome',
                min: '10.0',
                max: '40.0',
                currentTemp: '45.2',
                weather: Weather.sunny,
                startColor: Colors.pink[200]!,
                endColor: Colors.pink,
              ),
              WeatherBlock(
                city: 'Toulouse',
                min: '10.0',
                max: '40.0',
                currentTemp: '45.2',
                weather: Weather.veryCloudycloudy,
                startColor: Colors.orange[200]!,
                endColor: Colors.orange,
              ),

              
            ],
          ),
        ),
      ),
    ),
  );
}

enum Weather {
  cloudy('assets/images/ex4/cloudy.png'),
  sunny('assets/images/ex4/sunny.png'),
  sunnyCloudy('assets/images/ex4/sunnyCloudy.png'),
  veryCloudycloudy('assets/images/ex4/veryCloudy.png');

  const Weather(this.icon);

  final String icon;
}

class WeatherBlock extends StatelessWidget {
  const WeatherBlock({
    super.key,
    required this.city,
    required this.min,
    required this.max,
    required this.currentTemp,
    required this.weather,
    required this.startColor,
    required this.endColor,
  });

  final String city;
  final String min;
  final String max;
  final String currentTemp;
  final Weather weather;
  final Color startColor;
  final Color endColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(25),
        shadowColor: Colors.black,
        shape: BoxShape.rectangle,
        elevation: 20,
        color: Colors.white,

        child: Container(
          height: 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [startColor, endColor]),
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(weather.icon),
                  backgroundColor: Colors.white,
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Min $min℃',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 12,
                      fontWeight: FontWeight(10),
                    ),
                  ),
                  Text(
                    'Max $max℃',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 12,
                      fontWeight: FontWeight(10),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Stack(
                children: [
                  Positioned(
                    right: -40,
                    top: 10,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      '$currentTemp℃',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
