import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإشعارات')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 6,
        itemBuilder: (context, i) => Card(
          child: ListTile(
            leading: const CircleAvatar(backgroundColor: Color(0xFFFF9800), child: Icon(Icons.comment, color: Colors.white)),
            title: Text('تعليق جديد على أنمي ${i + 1}'),
            subtitle: const Text('قبل ساعتين'),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
      ),
    );
  }
}
