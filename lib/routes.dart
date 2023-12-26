import 'dart:convert';
import 'package:bmi_calculator/main/main_screen.dart';
import 'package:bmi_calculator/result/result_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) {
        // jsonString 으로 넘겨 받는 방식
        final bmiVar =
        BmiVar.fromJson(jsonDecode(state.uri.queryParameters['BmiVar']!));

        // Object로 넘겨 받는 방식
        // final person = state.extra! as Person;

        return ResultScreen(bmiVar: bmiVar);
      },
    ),
  ],
);