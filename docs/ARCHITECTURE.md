# المعمارية - Architecture

## نظرة عامة
```
lib/
├── main.dart              # نقطة الدخول + window_manager
├── app.dart               # MaterialApp.router + go_router + themes
├── core/
│   ├── api/               # Dio + Retrofit (مطابق لـ Retrofit/OkHttp)
│   │   ├── api_client.dart
│   │   ├── api_constants.dart  # كل endpoints من spec §7
│   │   ├── series_api.dart
│   │   └── auth_api.dart
│   ├── theme/             # 4 ثيمات من colors.xml
│   │   ├── app_colors.dart
│   │   ├── app_theme.dart
│   │   └── dimens.dart
│   ├── constants/
│   │   ├── strings_ar.dart  # من strings.xml
│   │   └── api_constants.dart
│   └── utils/helpers.dart
├── models/                # freezed/json_serializable
│   ├── series.dart        # Series, Episode, CharacterDetails
│   ├── user.dart
│   └── comment.dart
└── features/              # كل Activity → Screen
    ├── splash/            # SplashActivity
    ├── home/              # MainActivity (Drawer+Tabs)
    ├── anime/             # SeriesActivity + fragments
    ├── player/            # ServerActivity + WebViewPlayer
    ├── search/            # FilterActivity
    ├── auth/              # AuthSelection/Auth
    ├── profile/           # ProfileActivity
    ├── settings/          # SettingsActivity
    └── notifications/     # NotificationActivity
```

## التعيين 1:1

| Android (Kotlin) | Flutter (Dart) |
|------------------|----------------|
| `com.anslayer.App` | `main.dart` + Riverpod providers |
| Koin `AppModule` | `flutter_riverpod` providers |
| Retrofit + OkHttp + Gson | Dio + Retrofit + json_serializable |
| Room | Hive + SharedPreferences |
| Glide | cached_network_image |
| WorkManager | background_fetch (اختياري) |
| Firebase | firebase_core/analytics/crashlytics/messaging |
| Google Sign-In | google_sign_in |
| Unity Ads / AdMob | google_mobile_ads (معطل افتراضيا للديسكتوب) |
| `activity_main.xml` | `home_screen.dart` Drawer + TabBar |
| `fragment_series_detail.xml` | `series_screen.dart` |
| `server_activity.xml` | `player_screen.dart` |

## إدارة الحالة
- Riverpod: `themeModeProvider`, `appThemeProvider`, `authProvider`, `animeProvider`
- GoRouter: كل Activity أصبح route `/`, `/series/:id`, `/player/:episodeId` إلخ

## الثيمات
- Light: `#fafafa` / `#e0e0e0`
- DarkBlue: `#252e39` / `#182128`
- DarkGray: `#242529` / `#202125`
- Amoled: `#000000`
- Accent: `#ff9800` + State colors

راجع `lib/core/theme/app_colors.dart` (مستخرج من `colors.xml` 244 سطر)
