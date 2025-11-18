import 'package:flutter/material.dart';


const List<String> weatherImages = [
  'lib/assets/image/fall.png',
  'lib/assets/image/Spring.png',
  'lib/assets/image/Summer.png',
  'lib/assets/image/Winter.png',
];


class CountrySeasonCard extends StatefulWidget {
  final String countryName;

  const CountrySeasonCard({super.key, required this.countryName});

  @override
  State<CountrySeasonCard> createState() => CountrySeasonCardState();
}

class CountrySeasonCardState extends State<CountrySeasonCard> {
  int currentWeatherIndex = 0;

  void changeWeather() {
    setState(() {
      currentWeatherIndex = (currentWeatherIndex + 1) % weatherImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeWeather,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                weatherImages[currentWeatherIndex],
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              Text(
                widget.countryName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'SEASONS',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CountrySeasonCard(countryName: 'FRANCE'),
                  const SizedBox(width: 30),
                  CountrySeasonCard(countryName: 'CAMBODIA'),
                ],
              ),
            ],
          ),
        ),
      ),
    ),

  ),
);
