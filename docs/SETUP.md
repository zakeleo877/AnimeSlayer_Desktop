# دليل الإعداد - Setup Guide

## المتطلبات
- Windows 10/11 (64-bit)
- Flutter SDK 3.22+ 
- Visual Studio 2022 مع C++ Desktop Development
- Git

## خطوات التثبيت

### 1) تثبيت Flutter (إن لم يكن مثبتا)
```powershell
# الطريقة التلقائية:
powershell -ExecutionPolicy Bypass -File F:\AnimeSlayer_Desktop\install_flutter.ps1

# أو يدويا:
# حمّل من https://docs.flutter.dev/get-started/install/windows
# فك الضغط إلى C:\src\flutter
# أضف C:\src\flutter\bin إلى PATH
```

تحقق:
```powershell
flutter --version
flutter doctor
flutter config --enable-windows-desktop
```

### 2) إعداد المشروع
```powershell
cd F:\AnimeSlayer_Desktop
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

### 3) التشغيل
```powershell
flutter run -d windows          # وضع التطوير
flutter build windows            # بناء الإصدار النهائي
# المخرجات: build\windows\x64\runner\Release\anime_slayer_desktop.exe
```

## الاستكشاف
```powershell
flutter doctor -v
flutter clean
flutter pub get
```

## ملاحظات سطح المكتب
- النافذة الافتراضية 1280×800 (الحد الأدنى 1100×700)
- الثيمات 4: Light / DarkBlue / DarkGray / Amoled
- الاتجاه LTR رغم النص العربي (مطابق للأصل supportsRtl=false)

## البناء للتوزيع
```powershell
flutter build windows --release
# ثم استخدم Inno Setup لإنشاء مثبت:
# F:\anime-slayer-desktop-1.0.0-x64.nsis  (مرجع موجود مسبقا)
```
