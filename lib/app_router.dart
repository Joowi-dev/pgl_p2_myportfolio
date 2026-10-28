import 'package:go_router/go_router.dart';

import 'screens/home_screen.dart';
import 'screens/portfolio_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/portfolio',
      builder: (context, state) => const PortfolioScreen(),
    ),
  ],
);
