import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
      ),
      drawer: const AppDrawer(currentRoute: '/'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 64,
                backgroundImage: AssetImage('assets/images/jowi.jpg'),
              ),
              const SizedBox(height: 24),
              Text(
                '¡Hola, soy Joel!',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                'Estudiante de Desarrollo de '
                'Aplicaciones Multiplataforma',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              const Text(
                'Bienvenido a mi aplicación. Aquí puedes conocer '
                'mis aficiones y visitar mi repositorio.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => context.go('/portfolio'),
                  icon: const Icon(Icons.person),
                  label: const Text('Ver mi portfolio'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
