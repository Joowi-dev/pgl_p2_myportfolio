import 'package:flutter/material.dart';

import '../models/dish.dart';
import '../styles/app_colors.dart';

class DishCard extends StatelessWidget {
  const DishCard({super.key, required this.dish, required this.onDelete});

  final Dish dish;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryContainer,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        // La imagen depende de la categoría del plato.
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            dish.category.imagePath,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                width: 56,
                height: 56,
                child: Icon(Icons.restaurant),
              );
            },
          ),
        ),
        title: Text(dish.name),
        subtitle: Text('${dish.category.label} · ${dish.description}'),
        trailing: IconButton(
          onPressed: onDelete,
          tooltip: 'Borrar plato',
          icon: const Icon(Icons.delete_outline),
        ),
      ),
    );
  }
}