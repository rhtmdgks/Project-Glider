import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const ProjectGliderApp());
}

class ProjectGliderApp extends StatelessWidget {
  const ProjectGliderApp({super.key});

  static const Color _seed = Color(0xFF0047AB);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '글라이더',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Paperlogy',
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seed,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.onSurface,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      routerConfig: appRouter,
    );
  }
}
