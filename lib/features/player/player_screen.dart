import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  final String episodeId;
  const PlayerScreen({super.key, required this.episodeId});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  String selectedServer = 'VidStreaming';
  String selectedQuality = '1080p';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('الحلقة ${widget.episodeId}'),
        actions: [
          IconButton(icon: const Icon(Icons.cast), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Row(
        children: [
          // مشغل الفيديو الرئيسي
          Expanded(
            flex: 3,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.grey[900],
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(Icons.play_circle_fill, size: 80, color: Color(0xFFFF9800)),
                        Positioned(
                          bottom: 12,
                          left: 12,
                          right: 12,
                          child: Column(
                            children: [
                              Slider(value: 0.3, onChanged: (_) {}, activeColor: const Color(0xFFFF9800)),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('10:23 / 24:00', style: TextStyle(color: Colors.white, fontSize: 11)),
                                  Row(children: [Icon(Icons.volume_up, color: Colors.white, size: 18), SizedBox(width: 8), Icon(Icons.fullscreen, color: Colors.white, size: 18)]),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(top: 12, right: 12, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(6)), child: Text(selectedQuality, style: const TextStyle(color: Colors.white, fontSize: 12)))),
                      ],
                    ),
                  ),
                ),
                // معلومات الحلقة
                Container(
                  color: const Color(0xFF1A1A1A),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.thumb_up), label: const Text('إعجاب'), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9800))),
                      const SizedBox(width: 8),
                      OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.comment, color: Colors.white), label: const Text('تعليقات', style: TextStyle(color: Colors.white))),
                      const Spacer(),
                      IconButton(icon: const Icon(Icons.download, color: Colors.white), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.share, color: Colors.white), onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // قائمة السيرفرات (مطابق لـ ServerActivity)
          Container(
            width: 300,
            color: const Color(0xFF212121),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  color: const Color(0xFFFF9800),
                  child: const Text('السيرفرات', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      for (final s in ['VidStreaming', 'Mp4Upload', 'Ok.ru', 'GogoCDN', 'FileMoon'])
                        RadioListTile(
                          title: Text(s, style: const TextStyle(color: Colors.white, fontSize: 13)),
                          value: s,
                          groupValue: selectedServer,
                          activeColor: const Color(0xFFFF9800),
                          onChanged: (v) => setState(() => selectedServer = v!),
                        ),
                      const Divider(color: Colors.white24),
                      const Padding(padding: EdgeInsets.all(12), child: Text('الجودات', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                      for (final q in ['1080p', '720p', '480p', '360p'])
                        RadioListTile(
                          title: Text(q, style: const TextStyle(color: Colors.white, fontSize: 13)),
                          value: q,
                          groupValue: selectedQuality,
                          activeColor: const Color(0xFFFF9800),
                          onChanged: (v) => setState(() => selectedQuality = v!),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
