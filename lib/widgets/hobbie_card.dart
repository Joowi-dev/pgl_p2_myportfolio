import 'package:flutter/material.dart';

class HobbieCard extends StatelessWidget {
  const HobbieCard.infoHobbie({super.key, required this.infoHobbie});

  final String infoHobbie;

  static const _filledCard = EdgeInsets.symmetric(horizontal: 8, vertical: 12);

  static const _textStyle = TextStyle(color: Colors.black, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      padding: _filledCard,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 249, 147, 147),
        border: Border.all(color: const Color.fromARGB(255, 6, 31, 96), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          infoHobbie,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: _textStyle,
        ),
      ),
    );
  }
}