import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.backgroundAsset});

  // Permite añadir una imagen de fondo a toda la pantalla.
  final String? backgroundAsset;

  @override
  Widget build(BuildContext context) {
    final background = backgroundAsset;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Sabor Canario',
          style: TextStyle(
            fontSize: 27,
            fontStyle: FontStyle.italic,
            fontFamily: 'serif',
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      drawer: const AppDrawer(currentRoute: '/'),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Se mostrará cuando indiques la ruta de un fondo.
          if (background != null) Image.asset(background, fit: BoxFit.cover),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/logo_sabor_canario.png',
                          width: 150,
                          height: 120,
                          fit: BoxFit.contain,
                          semanticLabel: 'Logo de Sabor Canario',
                        ),
                      ),
                      const SizedBox(height: 24),
                      const SizedBox(height: 24),
                      const Text(
                        '¡Bienvenido/a!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: 26,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'serif',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Saborea nuestras islas.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.text, fontSize: 16),
                      ),
                      const SizedBox(height: 30),

                      Center(
                        child: SizedBox(
                          width: 230,
                          height: 48,
                          child: OutlinedButton(
                            // Botón únicamente visual.
                            onPressed: null,
                            style: OutlinedButton.styleFrom(
                              disabledForegroundColor: AppColors.text
                                  .withOpacity(0.8),
                              disabledBackgroundColor: AppColors.surface
                                  .withOpacity(0.8),
                              side: const BorderSide(color: AppColors.border),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('Ver platos'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
