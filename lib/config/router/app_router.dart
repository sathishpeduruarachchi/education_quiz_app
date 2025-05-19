// lib/presentation/routes/app_routes.dart

import 'package:edu_quiz_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:edu_quiz_app/features/auth/presentation/screens/login_screen.dart';
import 'package:edu_quiz_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:edu_quiz_app/home_screen.dart';
import 'package:flutter/material.dart';


class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static String quizscreen = '/quiz-screen';

  static final Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
    login: (_) => const LoginScreen(),
    signup: (_) => const SignupScreen(),
    forgotPassword: (_) => const ForgotPasswordScreen(),
    // quizscreen: (_) => const 
  };
}
