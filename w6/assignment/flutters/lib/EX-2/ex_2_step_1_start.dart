import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: const Column(
          children: [
            FavoriteCard(),
            FavoriteCard(),
            FavoriteCard(),
          ],
        ),
      ),
    ));


class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    super.key,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  IconData get icon => isFavorite ? Icons.favorite : Icons.favorite_border;
  Color get color => isFavorite ? Colors.red : Colors.grey;


  @override
  Widget build(BuildContext context) {
    return Container(
        // YOUR CODE
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Colors.grey,
            )
          )
        ),
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  Text('Description'),
                ],
              ),
            ),
            IconButton(
              onPressed: toggleFavorite, 
              icon: Icon(
                icon,
                color: color,
              )
            )
          ],
        ),
      );
  }
}