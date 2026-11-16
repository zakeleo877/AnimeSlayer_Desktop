import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app.dart';
import '../../core/constants/strings_ar.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(StringsAr.settings)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('المظهر', style: TextStyle(fontWeight: FontWeight.bold)),
          RadioListTile(
            title: const Text(StringsAr.lightTheme),
            value: AppThemeType.light,
            groupValue: appTheme,
            activeColor: const Color(0xFFFF9800),
            onChanged: (v) => ref.read(appThemeProvider.notifier).state = v!,
          ),
          RadioListTile(
            title: const Text(StringsAr.darkBlueTheme),
            value: AppThemeType.darkBlue,
            groupValue: appTheme,
            activeColor: const Color(0xFFFF9800),
            onChanged: (v) => ref.read(appThemeProvider.notifier).state = v!,
          ),
          RadioListTile(
            title: const Text(StringsAr.darkGrayTheme),
            value: AppThemeType.darkGray,
            groupValue: appTheme,
            activeColor: const Color(0xFFFF9800),
            onChanged: (v) => ref.read(appThemeProvider.notifier).state = v!,
          ),
          RadioListTile(
            title: const Text(StringsAr.amoledTheme),
            value: AppThemeType.amoled,
            groupValue: appTheme,
            activeColor: const Color(0xFFFF9800),
            onChanged: (v) => ref.read(appThemeProvider.notifier).state = v!,
          ),
          const Divider(),
          ListTile(leading: const Icon(Icons.block), title: const Text(StringsAr.wordsBlocking), onTap: () {}),
          ListTile(leading: const Icon(Icons.info), title: const Text(StringsAr.about), onTap: () {}),
          ListTile(leading: const Icon(Icons.shield), title: const Text(StringsAr.disclaimer), onTap: () {}),
          ListTile(leading: const Icon(Icons.notifications), title: const Text(StringsAr.notifications), trailing: Switch(value: true, onChanged: (_) {}, activeColor: const Color(0xFFFF9800))),
          const SizedBox(height: 24),
          const Center(child: Text('أنمي سلاير 1.5.10 (47)\nنسخة سطح المكتب - Flutter', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 11))),
        ],
      ),
    );
  }
}
