import 'package:flutter/material.dart';

const List<String> franceSeasons = [
  'lib/assets/image/Spring.png',
  'lib/assets/image/Summer.png',
  'lib/assets/image/fall.png',
  'lib/assets/image/Winter.png',
];
const List<String> cambodiaSeasons = [
  'lib/assets/image/Spring.png',
  'lib/assets/image/Summer.png',
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
      if (widget.countryName == 'CAMBODIA') {
        currentWeatherIndex = (currentWeatherIndex + 1) % cambodiaSeasons.length;
      } else {
        currentWeatherIndex = (currentWeatherIndex + 1) % franceSeasons.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeWeather,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Image.asset(
                widget.countryName == 'CAMBODIA'
                  ? cambodiaSeasons[currentWeatherIndex]
                  : franceSeasons[currentWeatherIndex],
                width: 150,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                widget.countryName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SeasonsCard extends StatelessWidget {
  const SeasonsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(15),
        // color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(30),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'SEASONS',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CountrySeasonCard(countryName: 'FRANCE'),
              const SizedBox(width: 30),
              CountrySeasonCard(countryName: 'CAMBODIA'),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SeasonsCard(),
          ),
        ),
      ),
    ),
  );
}
