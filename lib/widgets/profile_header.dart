import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.selectedOption});

  final int selectedOption;

  static const _profileImage = "assets/images/jowi.jpg";

  static const _repositoryImage =
      "assets/images/char_spider_man.jpg";

  static const _description =
      "Me llamo Joel, me suelen llamar Jowi o Mendoza, me metí en el curso de programación porque me gustan los videojuegos, pero hay asignaturas que se me están atragantando y acabamos de empezar. Estoy con una ansiedad de la ostia, pero bueno, de todo se sale :)";

  @override
  Widget build(BuildContext context) {
    final imageChange = selectedOption == 1 ? _repositoryImage : _profileImage;

    return ColoredBox(
      color: const Color.fromARGB(255, 238, 238, 238),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                imageChange,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(width: 90, height: 90, child: Icon(Icons.person, size: 60));
                },
              ),
            ),
            const SizedBox(width: 15),
            const Expanded(
              child: Text(_description, style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
