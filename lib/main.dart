import 'package:flutter/material.dart';

import 'app_router.dart';
import 'styles/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sabor Canario',
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
