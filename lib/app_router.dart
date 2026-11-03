import 'package:go_router/go_router.dart';

import 'screens/dishes_screen.dart';
import 'screens/home_screen.dart';
import 'screens/portfolio_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          const HomeScreen(backgroundAsset: 'assets/images/fondo.jpg'),
    ),
    GoRoute(
      path: '/portfolio',
      builder: (context, state) => const PortfolioScreen(),
    ),
    GoRoute(path: '/platos', builder: (context, state) => const DishesScreen()),
  ],
);
