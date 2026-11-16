import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'features/splash/splash_screen.dart';
import 'features/home/home_screen.dart';
import 'features/anime/series_screen.dart';
import 'features/player/player_screen.dart';
import 'features/search/search_screen.dart';
import 'features/auth/auth_screen.dart';
import 'features/profile/profile_screen.dart';
import 'features/settings/settings_screen.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);
final appThemeProvider = StateProvider<AppThemeType>((ref) => AppThemeType.light);

enum AppThemeType { light, darkBlue, darkGray, amoled }

class AnimeSlayerApp extends ConsumerWidget {
  const AnimeSlayerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final appTheme = ref.watch(appThemeProvider);

    return MaterialApp.router(
      title: 'أنمي سلاير',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      theme: AppTheme.lightTheme,
      darkTheme: switch (appTheme) {
        AppThemeType.light => AppTheme.lightTheme,
        AppThemeType.darkBlue => AppTheme.darkBlueTheme,
        AppThemeType.darkGray => AppTheme.darkGrayTheme,
        AppThemeType.amoled => AppTheme.amoledTheme,
      },
      themeMode: themeMode,
      routerConfig: _router,
      builder: (context, child) {
        // الحفاظ على LTR كما في الأصل (supportsRtl=false)
        return Directionality(
          textDirection: TextDirection.ltr,
          child: child!,
        );
      },
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'series/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return SeriesScreen(animeId: id);
          },
        ),
        GoRoute(
          path: 'player/:episodeId',
          builder: (context, state) {
            final eid = state.pathParameters['episodeId']!;
            return PlayerScreen(episodeId: eid);
          },
        ),
        GoRoute(
          path: 'search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: 'auth',
          builder: (context, state) => const AuthScreen(),
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);
