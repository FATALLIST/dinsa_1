// lib/app.dart

import 'package:flutter/material.dart';
import 'package:material/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
// import 'package:go_router/go_router.dart';

import 'ui/theme/app_theme.dart';
import 'routes/app_routes.dart';
import 'services/auth_service.dart';
import 'repositories/user_repository.dart';
import 'repositories/child_repository.dart';
import 'repositories/activity_repository.dart';
import 'repositories/menu_repository.dart';
import 'repositories/media_repository.dart';
import 'sample_data/data.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Services
        Provider<AuthService>(create: (_) => AuthService()),
        
        // Repositories with initial sample data for offline
        ChangeNotifierProvider<UserRepository>(
          create: (_) => UserRepository(initialUsers: users),
        ),
        ChangeNotifierProvider<ChildRepository>(
          create: (_) => ChildRepository(initialChildren: children),
        ),
        ChangeNotifierProvider<ActivityRepository>(
          create: (_) => ActivityRepository(initialActivities: activities),
        ),
        ChangeNotifierProvider<MenuRepository>(
          create: (_) => MenuRepository(initialMenus: menus),
        ),
        ChangeNotifierProvider<MediaRepository>(
          create: (_) => MediaRepository(initialMedia: media),
        ),
      ],
      child: MaterialApp.router(
        title: 'Dinda Daycare',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        // Use system setting by default
        themeMode: ThemeMode.system,
        routerConfig: AppRoutes.router,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('id'), // Bahasa Indonesia
          Locale('en'),
        ],
      ),
    );
  }
}

