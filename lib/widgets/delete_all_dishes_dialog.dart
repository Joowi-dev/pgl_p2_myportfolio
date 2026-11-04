import 'package:flutter/material.dart';

class DeleteAllDishesDialog extends StatelessWidget {
  const DeleteAllDishesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Borrar todos los platos'),
      content: const Text(
        'Se borrarán todos los platos de la lista. ¿Quieres continuar?',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Borrar todo'),
        ),
      ],
    );
  }
}
