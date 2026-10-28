import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RepositorySection extends StatelessWidget {
  const RepositorySection({super.key});

  static const _repositoryUrl = 'https://github.com/Joowi-dev';
  static const _imagePath = 'assets/images/ic_splash_icon.png';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Image.asset(
          _imagePath,
          width: 180,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 24),
        const Text(
          'Un gran poder, conlleva una gran responsabilidad',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 6, 31, 96),
            borderRadius: BorderRadius.circular(12),
          ),
          child: QrImageView(
            data: _repositoryUrl,
            version: QrVersions.auto,
            size: 200,
            backgroundColor: Colors.white,
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Colors.black,
            ),
            dataModuleStyle: const QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.square,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}