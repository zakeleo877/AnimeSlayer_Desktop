import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الملف الشخصي')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(radius: 40, backgroundColor: Color(0xFFFF9800), child: Icon(Icons.person, size: 40, color: Colors.white)),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('زاكي', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('@zaki', style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 6),
                        Row(children: [Icon(Icons.star, size: 14, color: Colors.orange), SizedBox(width: 4), Text('1,240 نقطة')]),
                      ],
                    ),
                  ),
                  OutlinedButton(onPressed: () {}, child: const Text('تعديل')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // إحصائيات (مطابق لـ user_statics_fragment)
          Row(
            children: [
              for (final s in [
                {'label': 'يشاهد', 'count': '24'},
                {'label': 'مكتمل', 'count': '132'},
                {'label': 'مخطط', 'count': '18'},
                {'label': 'مفضلة', 'count': '45'},
              ])
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(children: [Text(s['count']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFFFF9800))), Text(s['label']!, style: const TextStyle(fontSize: 11))]),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          ListTile(leading: const Icon(Icons.list), title: const Text('قائمتي'), trailing: const Icon(Icons.chevron_right), onTap: () {}),
          ListTile(leading: const Icon(Icons.favorite), title: const Text('المفضلة'), trailing: const Icon(Icons.chevron_right), onTap: () {}),
          ListTile(leading: const Icon(Icons.history), title: const Text('السجل'), trailing: const Icon(Icons.chevron_right), onTap: () {}),
          ListTile(leading: const Icon(Icons.block), title: const Text('المحظورون'), trailing: const Icon(Icons.chevron_right), onTap: () {}),
        ],
      ),
    );
  }
}
