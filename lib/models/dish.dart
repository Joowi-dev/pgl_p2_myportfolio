enum DishCategory {
  starter('Entrante', 'assets/images/categorias/entrante.png'),
  mainCourse('Principal', 'assets/images/categorias/principal.png'),
  dessert('Postre', 'assets/images/categorias/postre.png');

  const DishCategory(this.label, this.imagePath);

  final String label;
  final String imagePath;
}

class Dish {
  const Dish({
    required this.name,
    required this.description,
    required this.category,
  });

  final String name;
  final String description;
  final DishCategory category;
}
