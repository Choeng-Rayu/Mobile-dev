import 'package:flutter/material.dart';

enum TypeWeather {
  sunny(
    location: "Rome",
    imagePath: "assets/ex4/sunny.png",
    minTemp: "Min 10.0°C",
    maxTemp: "Max 40.0°C",
    temp: "45.2°C",
    gradientColor: LinearGradient(colors: [Colors.redAccent, Colors.red]),
  ), 
  cloudy(
    location: "Phnom Penh",
    imagePath: "assets/ex4/cloudy.png",
    minTemp: "Min 10.0°C",
    maxTemp: "Max 30.0°C",
    temp: "12.2°C",
    gradientColor: LinearGradient(colors: [Colors.purpleAccent, Colors.purple]),
  ), 

  sunnyCloudy(
    location: "Paris",
    imagePath: "assets/ex4/sunnyCloudy.png",
    minTemp: "Min 10.0°C",
    maxTemp: "Max 40.0°C",
    temp: "22.2°C",
    gradientColor: LinearGradient(colors: [Colors.greenAccent, Colors.green]),
  ),

  veryCloudy(
    location: "Toulouse",
    imagePath: "assets/ex4/veryCloudy.png",
    minTemp: "Min 10.0°C",
    maxTemp: "Max 40.0°C",
    temp: "",
    gradientColor: LinearGradient(colors: [Colors.orange, Colors.orangeAccent]),
  );

  final String minTemp;
  final String maxTemp;
  final String imagePath;
  final String location;
  final String temp;
  final Gradient gradientColor;
  const TypeWeather({
    required this.location,
    required this.minTemp,
    required this.maxTemp,
    required this.imagePath,
    required this.temp,
    required this.gradientColor,
  });
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Icon(Icons.menu, color: Colors.white)],
          ),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const Column(
              children: [
                WeatherCard(typeWeather: TypeWeather.cloudy),
                SizedBox(height: 15),
                WeatherCard(typeWeather: TypeWeather.sunnyCloudy),
                SizedBox(height: 15),
                WeatherCard(typeWeather: TypeWeather.sunny),
                SizedBox(height: 15),
                WeatherCard(typeWeather: TypeWeather.veryCloudy),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class WeatherCard extends StatelessWidget {
  final TypeWeather typeWeather;
  
  const WeatherCard({super.key, required this.typeWeather});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 10,
      shadowColor: Colors.black.withOpacity(0.7),
      borderRadius: BorderRadius.circular(25),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              // gradient: gradient,
              // TypeWeather.cloudy.gradientColor,
              gradient: typeWeather.gradientColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: CircleAvatar(backgroundImage: AssetImage(typeWeather.imagePath)),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // TypeWeather.cloudy.location,
                      typeWeather.location,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      // minTemp,
                      // TypeWeather.cloudy.minTemp,
                      typeWeather.minTemp,
                      style: TextStyle(color: Colors.grey[300], fontSize: 11),
                    ),
                    Text(
                      // maxTemp,
                      TypeWeather.cloudy.maxTemp,
                      style: TextStyle(color: Colors.grey[300], fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: -60,
            top: -20,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                gradient: typeWeather.gradientColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 35,
            child: Text(
              typeWeather.temp,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}