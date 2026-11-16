# Anime Slayer Desktop - أنمي سلاير لسطح المكتب

> نسخة Flutter/Dart أصلية لسطح المكتب (Windows/Linux/macOS) مبنية من الهندسة العكسية لـ `AnimeSlayyer-1.5.10.apk` (`com.anslayer` v47)

هذا المشروع هو **نسخة مطابقة 1:1** لتطبيق أنمي سلاير الأصلي (Kotlin) لكن بـ Flutter لسطح المكتب.

## 📂 موقع المشروع
`F:\AnimeSlayer_Desktop` — تم إنشاؤه من `F:\AnimeSlayyer` (المصدر: apk_decompiled + spec)

## 🧩 المعمارية
- **اللغة:** Dart 3.4 + Flutter 3.22+
- **إدارة الحالة:** Riverpod (مكافئ Koin في الأصل)
- **الشبكة:** Dio + Retrofit (بديل Retrofit/OkHttp)
- **التخزين:** Hive + SharedPreferences (بديل Room)
- **التنقل:** go_router (كل Activity → Route)
- **الفيديو:** media_kit + chewie
- **الصور:** cached_network_image
- **النوافذ:** window_manager + bitsdojo_window

## 🎨 الثيمات (4 ثيمات مطابقة للأصل)
- Light `#fafafa` / PrimaryDark `#e0e0e0`
- DarkBlue `#252e39` / `#182128`
- DarkGray `#242529` / `#202125`
- Amoled `#000000`

Accent: `#ff9800` + StateBlue `#0091ea` / Green `#00c853` / Orange `#ff6d00` / Red `#c62828`

## 🔌 واجهات البرمجة (API)
Base URL: `https://anslayer.com/anime/public/`
- Auth: login, google-login, twitter, logout, refresh-token, restore-fb
- Series: get-anime-details, save-rating, favorites/watching, episodes, characters
- Comments: anime-comments / episode-comments
- News, Recommendations, Custom Lists, User

راجع `docs/api_endpoints.md` و `lib/core/api/`

## 📱 الشاشات (Activities → Screens)
| الأصل | Flutter |
|-------|---------|
| SplashActivity | `features/splash` |
| MainActivity (Drawer+Tabs) | `features/home` |
| SeriesActivity | `features/anime/series_screen.dart` |
| Search.FilterActivity | `features/search` |
| Player (Server + WebView) | `features/player` |
| Auth | `features/auth` |
| Profile / Settings | `features/profile`, `features/settings` |
| ... 20+ أخرى | ... |

## 🚀 التشغيل

### 1) تثبيت Flutter
```powershell
# بدون Flutter مثبت حاليا على جهازك (فحصنا: flutter غير موجود)
# حمّل Flutter SDK:
Invoke-WebRequest -Uri https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.5-stable.zip -OutFile $env:TEMP\flutter.zip
Expand-Archive $env:TEMP\flutter.zip -DestinationPath C:\src -Force
$env:Path += ";C:\src\flutter\bin"
flutter doctor
flutter config --enable-windows-desktop
```

### 2) تشغيل المشروع
```powershell
cd F:\AnimeSlayer_Desktop
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run -d windows
```

### 3) البناء للإنتاج
```powershell
flutter build windows
# المخرجات: build/windows/x64/runner/Release/
```

## 📦 الأصول المنقولة
- `res/values/colors.xml` → `lib/core/theme/app_colors.dart`
- `res/values/strings.xml` → `lib/core/constants/strings_ar.dart`
- `res/values/dimens.xml` → `lib/core/theme/dimens.dart`
- `res/drawable*` → `assets/images/` (يُصدّر يدويا من apk_decompiled)
- `assets/fonts` → `assets/fonts/`

راجع `docs/extracted/` للمراجع الأصلية.

## 📝 الملفات المولدة
- `AnimeSlayer_ReverseEngineering_Spec.md` → `docs/REVERSE_SPEC.md`
- الألوان والثيمات والـ API كلها موثقة

## ⚠️ ملاحظات
- `supportsRtl=false` في الأصل — الواجهة عربية لكن LTR (تم الحفاظ عليه)
- الإعلانات (Unity/AdMob) اختيارية في الديسكتوب
- FCM/Push يعمل عبر firebase_core

---
تم إنشاؤه تلقائيا في `F:\AnimeSlayer_Desktop` بتاريخ 2026-11-16 عبر جسر MCP.
