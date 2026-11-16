# دليل الأصول - Assets Guide

تم نسخ الأصول المرجعية من `F:\AnimeSlayyer\apk_decompiled\` إلى هذا المشروع:

## الملفات المنسوخة
- `docs/extracted/colors.xml` (244 سطر، 15.7KB) → `lib/core/theme/app_colors.dart` (محول)
- `docs/extracted/strings.xml` (41.7KB) → `lib/core/constants/strings_ar.dart`
- `docs/extracted/dimens.xml` (31.1KB) → `lib/core/theme/dimens.dart`
- `docs/extracted/styles.xml` (275KB) → مرجع للثيمات
- `docs/extracted/AndroidManifest.xml` → مرجع الصلاحيات
- `docs/REVERSE_SPEC.md` (10.7KB) → المواصفة الكاملة

## الأصول الرسومية
المجلد الأصلي `res/` يحتوي 159 مجلد فرعي:
- `res/drawable*` (20 مجلد) → نسخ جزئي إلى `assets/images/drawable_ref/`
- `res/mipmap*` (أيقونات) → انسخ يدويا إلى `assets/icons/`
- `res/layout/` (299 ملف) → موثق في `docs/ARCHITECTURE.md`
- `res/values/` (12 ملف) → `docs/extracted/`
- `assets/fonts/` → `assets/fonts/` (Tajawal)

## للتصدير الكامل
```powershell
robocopy F:\AnimeSlayyer\apk_decompiled\res F:\AnimeSlayer_Desktop\assets\extracted_res /S
```

## الخطوات التالية
1. صدّر الصور من `drawable-*dpi` إلى `assets/images/` بصيغة PNG/WebP
2. حوّل `drawables.xml` vectors إلى SVG
3. أضف الخطوط إلى `pubspec.yaml` (Tajawal موجود)
4. شغّل `flutter pub get`

## ملاحظة
الصور الحالية في `assets/images/drawable_ref/` هي عينة. للحصول على كل الصور، استخدم الأمر أعلاه.
