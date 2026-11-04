import 'package:flutter/material.dart';

import 'hobbie_card.dart';

class HobbiesSection extends StatelessWidget {
  const HobbiesSection({super.key});

  static const List<String> _hobbies = [
    'ME GUSTA MUCHO SPIDERMAN',
    'Jugar a Magic(como Fernando)',
    'Programar con Dart(no)',
    'Sacar a la perra a pasear',
    'Ir a la playa',
    'Música variadita',
    'Anime',
    'Ir al gimnasio',
    'Querer mucho a mi gato',
    'Ir al cine',
    'Los videojuegos',
    'Domingos de pecado',
    'Ducharme',
    'Ir de guachinche',
    'Viajar',
    "Soñar a lo grande",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      runSpacing: 12,
      children: _hobbies.map((infoHobbie) {
        return HobbieCard.infoHobbie(infoHobbie: infoHobbie);
      }).toList(),
    );
  }
}
