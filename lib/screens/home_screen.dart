import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    this.backgroundAsset,
  });

  final String? backgroundAsset;

  @override
  Widget build(BuildContext context) {
    final background = backgroundAsset;

    return Scaffold(
      backgroundColor: AppColors.text,
      extendBodyBehindAppBar: true,

      // Menú superpuesto sobre la fotografía.
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.onPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      drawer: const AppDrawer(currentRoute: '/'),

      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fondo recibido desde el router.
          if (background != null)
            Image.asset(
              background,
              fit: BoxFit.cover,
            ),

          // Oscurece la fotografía para destacar los textos.
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.text.withValues(alpha: 0.40),
                  AppColors.text.withValues(alpha: 0.75),
                ],
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 12, 28, 28),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                          maxWidth: 420,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Reserva espacio para el menú superior.
                            const SizedBox(height: kToolbarHeight),

                            // Logo y nombre.
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/logo_sabor_canario.png',
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.contain,
                                    semanticLabel: 'Logo de Sabor Canario',
                                  ),
                                  const SizedBox(height: 12),
                                  const Text(
                                    'Sabor Canario',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.onPrimary,
                                      fontSize: 27,
                                      fontFamily: 'serif',
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Mensaje central.
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 32),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    width: 64,
                                    child: Divider(
                                      color: AppColors.primary,
                                      thickness: 2,
                                    ),
                                  ),
                                  const SizedBox(height: 28),
                                  const Text(
                                    'El sabor de\nnuestras islas.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.onPrimary,
                                      fontSize: 44,
                                      height: 1.1,
                                      fontFamily: 'serif',
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  Text(
                                    'Saborea nuestras islas.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.onPrimary.withValues(
                                        alpha: 0.90,
                                      ),
                                      fontSize: 18,
                                      fontFamily: 'serif',
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Botón morado, únicamente visual.
                            SizedBox(
                              height: 56,
                              child: FilledButton(
                                onPressed: null,
                                style: FilledButton.styleFrom(
                                  disabledBackgroundColor: AppColors.secondary,
                                  disabledForegroundColor: AppColors.onSecondary,
                                  shape: const StadiumBorder(),
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'serif',
                                  ),
                                ),
                                child: const Text('Ver platos'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}