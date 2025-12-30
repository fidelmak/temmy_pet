import 'package:go_router/go_router.dart';
import 'package:temmy_pet/splash_screen.dart';
import 'package:temmy_pet/view/onboarding_view/onboarding_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: 'onboardingView', // Path parameter example
          builder: (context, state) => OnboardingView(
            // Access param
          ),
        ),
      ],
    ),
  ],
);
