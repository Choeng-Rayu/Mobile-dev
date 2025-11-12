// import 'package:flutter/material.dart';

// void main() {
//   runApp(const WeatherApp());
// }

// class WeatherApp extends StatelessWidget {
//   const WeatherApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.grey[200],
//         appBar: AppBar(
//           title: const Text('Weather Forecast'),
//           backgroundColor: Colors.blue[700],
//           foregroundColor: Colors.white,
//         ),
//         body: const WeatherForecastList(),
//       ),
//     );
//   }
// }

// // Model class for weather data
// class WeatherData {
//   final String city;
//   final String condition;
//   final double minTemp;
//   final double maxTemp;
//   final double currentTemp;
//   final Color backgroundColor;
//   final IconData weatherIcon;

//   const WeatherData({
//     required this.city,
//     required this.condition,
//     required this.minTemp,
//     required this.maxTemp,
//     required this.currentTemp,
//     required this.backgroundColor,
//     required this.weatherIcon,
//   });
// }

// // StatelessWidget for the weather forecast list
// class WeatherForecastList extends StatelessWidget {
//   const WeatherForecastList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Sample weather data
//     final List<WeatherData> weatherList = [
//       const WeatherData(
//         city: 'Phnom Penh',
//         condition: 'Partly Cloudy',
//         minTemp: 18,
//         maxTemp: 25,
//         currentTemp: 12,
//         backgroundColor: Color(0xFFB39DDB), // Purple
//         weatherIcon: Icons.cloud,
//       ),
//       const WeatherData(
//         city: 'Paris',
//         condition: 'Rainy',
//         minTemp: 10,
//         maxTemp: 20,
//         currentTemp: 22,
//         backgroundColor: Color(0xFF81C784), // Green
//         weatherIcon: Icons.umbrella,
//       ),
//       const WeatherData(
//         city: 'Rome',
//         condition: 'Sunny',
//         minTemp: 18,
//         maxTemp: 32,
//         currentTemp: 45,
//         backgroundColor: Color(0xFFEF9A9A), // Pink
//         weatherIcon: Icons.wb_sunny,
//       ),
//       const WeatherData(
//         city: 'Stockholm',
//         condition: 'Cloudy',
//         minTemp: 5,
//         maxTemp: 15,
//         currentTemp: 48,
//         backgroundColor: Color(0xFFFFCC80), // Orange
//         weatherIcon: Icons.cloud_queue,
//       ),
//     ];

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: weatherList
//             .map((weather) => WeatherCard(weatherData: weather))
//             .toList(),
//       ),
//     );
//   }
// }

// // StatelessWidget for individual weather card
// class WeatherCard extends StatelessWidget {
//   final WeatherData weatherData;

//   const WeatherCard({
//     super.key,
//     required this.weatherData,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         // Gradient background
//         gradient: LinearGradient(
//           colors: [
//             weatherData.backgroundColor,
//             weatherData.backgroundColor.withOpacity(0.7),
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(16),
//         // Shadow for depth
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: PhysicalModel(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.circular(16),
//         elevation: 0,
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Row(
//             children: [
//               // Left side: Icon and city info
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Weather icon in a circle
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.3),
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         weatherData.weatherIcon,
//                         size: 32,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     // City name
//                     Text(
//                       weatherData.city,
//                       style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     // Min and Max temperature
//                     Text(
//                       'Min: ${weatherData.minTemp.toStringAsFixed(0)}°C - Max: ${weatherData.maxTemp.toStringAsFixed(0)}°C',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.white.withOpacity(0.9),
//                       ),
//                     ),
//                     const SizedBox(height: 2),
//                     // Weather condition
//                     Text(
//                       weatherData.condition,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.white.withOpacity(0.8),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Right side: Current temperature
//               Text(
//                 '${weatherData.currentTemp.toStringAsFixed(0)}°C',
//                 style: const TextStyle(
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }









// import 'package:flutter/material.dart';

// void main() {
//   runApp(const WeatherApp());
// }

// class WeatherApp extends StatelessWidget {
//   const WeatherApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Weather App',
//       theme: ThemeData(
//         useMaterial3: true,
//         fontFamily: 'Roboto',
//       ),
//       home: const WeatherPage(),
//     );
//   }
// }

// // =================== Weather Page ===================
// class WeatherPage extends StatelessWidget {
//   const WeatherPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[50],
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF81D4FA),
//         elevation: 0,
//         title: const Text(
//           'Weather App',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 12),
//             child: Icon(Icons.menu, color: Colors.white),
//           ),
//         ],
//       ),
//       body: ListView(
//         padding: const EdgeInsets.only(top: 16, bottom: 16),
//         children: const [
//           WeatherCard(
//             city: 'PhnomPenh',
//             icon: 'cloud',
//             temperature: 12.2,
//             minTemp: 10.0,
//             maxTemp: 30.0,
//             gradientColors: [Color(0xFF9C27B0), Color(0xFF673AB7)],
//           ),
//           WeatherCard(
//             city: 'Paris',
//             icon: 'suncloud',
//             temperature: 22.2,
//             minTemp: 10.0,
//             maxTemp: 40.0,
//             gradientColors: [Color(0xFF4DD0E1), Color(0xFF80CBC4)],
//           ),
//           WeatherCard(
//             city: 'Rome',
//             icon: 'sun',
//             temperature: 45.2,
//             minTemp: 10.0,
//             maxTemp: 40.0,
//             gradientColors: [Color(0xFFF06292), Color(0xFFEC407A)],
//           ),
//           WeatherCard(
//             city: 'Toulouse',
//             icon: 'cloud',
//             temperature: 45.2,
//             minTemp: 10.0,
//             maxTemp: 40.0,
//             gradientColors: [Color(0xFFFFB74D), Color(0xFFFFA726)],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // =================== Weather Card Widget ===================
// class WeatherCard extends StatelessWidget {
//   final String city;
//   final String icon;
//   final double temperature;
//   final double minTemp;
//   final double maxTemp;
//   final List<Color> gradientColors;

//   const WeatherCard({
//     super.key,
//     required this.city,
//     required this.icon,
//     required this.temperature,
//     required this.minTemp,
//     required this.maxTemp,
//     required this.gradientColors,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: gradientColors,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15),
//             blurRadius: 8,
//             offset: const Offset(2, 4),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Icon(
//                   _getWeatherIcon(icon),
//                   color: Colors.white,
//                   size: 40,
//                 ),
//                 const SizedBox(width: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       city,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       'Min ${minTemp.toStringAsFixed(1)}°C',
//                       style: const TextStyle(color: Colors.white70),
//                     ),
//                     Text(
//                       'Max ${maxTemp.toStringAsFixed(1)}°C',
//                       style: const TextStyle(color: Colors.white70),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Text(
//               '${temperature.toStringAsFixed(1)}°C',
//               style: const TextStyle(
//                 fontSize: 26,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   IconData _getWeatherIcon(String type) {
//     switch (type.toLowerCase()) {
//       case 'sun':
//         return Icons.wb_sunny;
//       case 'cloud':
//         return Icons.cloud;
//       case 'suncloud':
//         return Icons.wb_cloudy;
//       default:
//         return Icons.cloud_queue;
//     }
//   }
// }







// now make it simple 


import 'package:flutter/material.dart';

enum TypeWeather { sunny, cloudy, sunnyCloudy, veryCloudy }

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

  Gradient get gradient {
    switch (typeWeather) {
      case TypeWeather.cloudy:
        return const LinearGradient(colors: [Colors.purpleAccent, Colors.purple]);
      case TypeWeather.sunnyCloudy:
        return const LinearGradient(colors: [Colors.greenAccent, Colors.green]);
      case TypeWeather.sunny:
        return const LinearGradient(colors: [Colors.redAccent, Colors.red]);
      case TypeWeather.veryCloudy:
        return const LinearGradient(colors: [Colors.orange, Colors.orangeAccent]);
    }
  }

  String get image {
    switch (typeWeather) {
      case TypeWeather.cloudy:
        return "assets/ex4/cloudy.png";
      case TypeWeather.sunnyCloudy:
        return "assets/ex4/sunnyCloudy.png";
      case TypeWeather.sunny:
        return "assets/ex4/sunny.png";
      case TypeWeather.veryCloudy:
        return "assets/ex4/veryCloudy.png";
    }
  }

  String get location {
    switch (typeWeather) {
      case TypeWeather.cloudy:
        return "Phnom Penh";
      case TypeWeather.sunnyCloudy:
        return "Paris";
      case TypeWeather.sunny:
        return "Rome";
      case TypeWeather.veryCloudy:
        return "Toulouse";
    }
  }

  String get minTemp {
    return "Min 10.0°C";
  }

  String get maxTemp {
    if(typeWeather == TypeWeather.cloudy) {
      return "Max 30.0°C";
    }
    return "Max 40.0°C";
  }

  String get temp {
    switch(typeWeather) {
      case TypeWeather.cloudy:
        return "12.2°C";
      case TypeWeather.sunnyCloudy:
        return "22.2°C";
      case TypeWeather.sunny:
        return "45.2°C";
      case TypeWeather.veryCloudy:
        return "45.2°C";
    }
  }

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
              gradient: gradient,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: CircleAvatar(backgroundImage: AssetImage(image)),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      minTemp,
                      style: TextStyle(color: Colors.grey[300], fontSize: 11),
                    ),
                    Text(
                      maxTemp,
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
                gradient: gradient,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 35,
            child: Text(
              temp,
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