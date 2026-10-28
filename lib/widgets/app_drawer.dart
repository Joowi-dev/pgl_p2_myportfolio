import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.currentRoute});

  final String currentRoute;

  void _navigateTo(BuildContext context, String route) {
    final router = GoRouter.of(context);

    Navigator.of(context).pop();

    if (currentRoute != route) {
      router.go(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: colors.primary),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Mi portfolio',
                  style: TextStyle(
                    color: colors.onPrimary,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Inicio'),
              selected: currentRoute == '/',
              onTap: () => _navigateTo(context, '/'),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Mi portfolio'),
              selected: currentRoute == '/portfolio',
              onTap: () => _navigateTo(context, '/portfolio'),
            ),
          ],
        ),
      ),
    );
  }
}
