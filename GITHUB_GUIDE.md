# دليل رفع المشروع إلى GitHub

## حسابك
- **المستخدم:** زاكي (`zakeleo877`)
- **البريد:** `189930201+zakeleo877@users.noreply.github.com`
- **المشروع المحلي:** `F:\AnimeSlayer_Desktop` (جاهز، git init تم)

## المشكلة الحالية
عملية `git add .` السابقة علقت بسبب القفل `index.lock` (896 ملف أصول ثقيلة).
تم حلها بسكربت `push_to_github.bat` الذي يضيف الملفات على دفعات.

## الحل السريع (شغّل السكربت)

1. افتح `F:\AnimeSlayer_Desktop` في المستكشف
2. انقر نقرا مزدوجا على `push_to_github.bat`
3. اتبع التعليمات:
   - سيقتل عمليات git العالقة
   - سيضيف الملفات الأساسية أولا
   - سيسألك عن رفع الأصول الثقيلة (اختر `Y` أو `N`)
   - سيطلب رابط المستودع

## إنشاء المستودع على GitHub

1. افتح https://github.com/new (تم فتحه تلقائيا على جهازك)
2. **Repository name:** `AnimeSlayer_Desktop`
3. **Description:** `أنمي سلاير - نسخة سطح المكتب Flutter/Dart من الهندسة العكسية 1.5.10`
4. **Public** ✓
5. لا تضف README / .gitignore / license (موجودة محليا)
6. اضغط **Create repository**
7. انسخ الرابط: `https://github.com/zakeleo877/AnimeSlayer_Desktop.git`
8. الصقه في نافذة `push_to_github.bat`

## البديل اليدوي (PowerShell)

```powershell
cd F:\AnimeSlayer_Desktop
taskkill /F /IM git.exe; Remove-Item -Force .git\index.lock -ErrorAction SilentlyContinue
git add .gitignore pubspec.yaml README.md lib/ docs/ windows/
git commit -m "feat: initial"
git remote add origin https://github.com/zakeleo877/AnimeSlayer_Desktop.git
git push -u origin main
```

## المصادقة
GitHub لم يعد يقبل كلمة المرور. استخدم:
- **GitHub Desktop** (موصى به) أو
- **Personal Access Token:**
  1. https://github.com/settings/tokens/new
  2. اختر `repo` scope
  3. انسخ التوكن واستخدمه ككلمة مرور عند `git push`
  4. المستخدم: `zakeleo877`

## بعد الرفع
```powershell
flutter pub get
flutter run -d windows
```

## ملاحظة الأصول
المجلد `assets/images/drawable` يحتوي 896 ملف (15MB+). إذا كان المستودع ثقيلا:
- اتركه مستبعدا عبر `.gitignore` (أضف `assets/images/drawable/`)
- أو استخدم Git LFS: `git lfs track "*.png"`
