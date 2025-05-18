// lib/presentation/routes/app_routes.dart

import 'package:edu_quiz_app/presentation/screens/auth/forgot_password_screen.dart';
import 'package:edu_quiz_app/presentation/screens/auth/login_screen.dart';
import 'package:edu_quiz_app/presentation/screens/auth/signup_screen.dart';
import 'package:edu_quiz_app/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';


class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';

  static final Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
    login: (_) => const LoginScreen(),
    signup: (_) => const SignupScreen(),
    forgotPassword: (_) => const ForgotPasswordScreen(),
  };
}
