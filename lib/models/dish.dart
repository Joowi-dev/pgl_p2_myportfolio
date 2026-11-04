enum DishCategory {
  starter('Entrante', 'assets/images/categories/entrante.png'),
  mainCourse('Principal', 'assets/images/categories/principal.png'),
  dessert('Postre', 'assets/images/categories/postre.png');

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
