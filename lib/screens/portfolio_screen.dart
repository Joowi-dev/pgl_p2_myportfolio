import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/hobbies_section.dart';
import '../widgets/profile_header.dart';
import '../widgets/repository_section.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int _selectedOption = 0;

  void _changeSelectedOption(int option) {
    setState(() {
      _selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(currentRoute: '/portfolio'),
      appBar: AppBar(title: const Text('Mi portfolio')),
      body: SafeArea(
        child: ListView(
          children: [
            ProfileHeader(selectedOption: _selectedOption),
            Padding(
              padding: const EdgeInsets.all(16),
              child: _selectedOption == 0
                  ? const HobbiesSection()
                  : const RepositorySection(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedOption,
        onTap: _changeSelectedOption,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_esports),
            label: 'Mis hobbies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Mi repositorio',
          ),
        ],
      ),
    );
  }
}
