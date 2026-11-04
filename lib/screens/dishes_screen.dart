import 'package:flutter/material.dart';

import '../models/dish.dart';
import '../styles/app_colors.dart';
import '../widgets/add_dish_dialog.dart';
import '../widgets/app_drawer.dart';
import '../widgets/dish_card.dart';
import '../widgets/delete_all_dishes_dialog.dart';

class DishesScreen extends StatefulWidget {
  const DishesScreen({super.key});

  @override
  State<DishesScreen> createState() => _DishesScreenState();
}

class _DishesScreenState extends State<DishesScreen> {
  final List<Dish> _dishes = [
    const Dish(
      name: 'Papas arrugadas',
      description: 'Con mojo rojo y mojo verde',
      category: DishCategory.starter,
    ),
    const Dish(
      name: 'Ropa vieja',
      description: 'Garbanzos con carne y papas',
      category: DishCategory.mainCourse,
    ),
    const Dish(
      name: 'Bienmesabe',
      description: 'Crema de almendra y miel',
      category: DishCategory.dessert,
    ),
  ];

  Future<void> _addDish() async {
    final newDish = await showDialog<Dish>(
      context: context,
      builder: (context) => const AddDishDialog(),
    );

    // Es null si se ha cancelado el modal.
    if (newDish == null) {
      return;
    }

    setState(() {
      _dishes.add(newDish);
    });
  }

  void _deleteDish(int index) {
    setState(() {
      _dishes.removeAt(index);
    });
  }

  Future<void> _deleteAllDishes() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => const DeleteAllDishesDialog(),
    );

    // Solo se borra si se ha pulsado "Borrar todo".
    if (confirmed != true) {
      return;
    }

    setState(() {
      _dishes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(currentRoute: '/platos'),
      appBar: AppBar(
        title: const Text('Platos'),
        actions: [
          IconButton(
            // Desactivado si la lista ya está vacía.
            onPressed: _dishes.isEmpty ? null : _deleteAllDishes,
            tooltip: 'Borrar todos los platos',
            icon: const Icon(Icons.delete_sweep),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDish,
        tooltip: 'Añadir plato',
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.onSecondary,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Marcador con el total de elementos.
            ColoredBox(
              color: AppColors.surface,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Total de platos: ${_dishes.length}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _dishes.isEmpty
                  ? const Center(child: Text('Todavía no hay platos'))
                  : ListView.builder(
                      // El espacio inferior evita que el botón tape la lista.
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 88),
                      itemCount: _dishes.length,
                      itemBuilder: (context, index) {
                        return DishCard(
                          dish: _dishes[index],
                          onDelete: () => _deleteDish(index),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
