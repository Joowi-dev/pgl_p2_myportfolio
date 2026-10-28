import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/portfolio_screen.dart';

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 213, 13, 13),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PortfolioScreen(),
    );
  }
}