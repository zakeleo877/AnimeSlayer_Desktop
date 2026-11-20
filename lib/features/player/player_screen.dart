import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import '../../core/api/api_client.dart';
import '../../core/constants/api_constants.dart';

/// شاشة تشغيل حقيقية - تربط episodes/get-episodes + سيرفرات الفيديو
/// مع تمرير Referer/User-Agent لـ media_kit (هام لـ mp4upload/voe/ok.ru)
class PlayerScreen extends StatefulWidget {
  final String episodeId;
  final String? animeId;
  const PlayerScreen({super.key, required this.episodeId, this.animeId});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final Player player;
  late final VideoController controller;
  bool isLoading = true;
  String? errorMsg;
  List<Map<String, dynamic>> servers = [];
  String selectedServer = '';
  String selectedQuality = '720p';
  String? currentVideoUrl;

  // هيدرز مطابقة لـ WebViewPlayerActivity في APK
  static const _videoHeaders = {
    'Referer': 'https://anslayer.com/',
    'Origin': 'https://anslayer.com',
    'User-Agent':
        'Mozilla/5.0 (Linux; Android 10; SM-G975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36',
    'X-Requested-With': 'com.anslayer',
  };

  @override
  void initState() {
    super.initState();
    player = Player();
    controller = VideoController(player);
    _loadEpisodeServers();
  }

  Future<void> _loadEpisodeServers() async {
    setState(() { isLoading = true; errorMsg = null; });
    try {
      final api = ApiClient();
      // جلب تفاصيل الحلقة/السيرفرات (مطابق لـ SeriesEndpoint episodes/get-episodes)
      final res = await api.dio.post(
        ApiConstants.getEpisodes,
        data: {
          'anime_id': widget.animeId ?? widget.episodeId,
          'episode_id': widget.episodeId,
        },
      );
      if (res.statusCode == 200) {
        final data = res.data;
        // السيرفر يحب أن يعيد list من السيرفرات أو روابط مباشرة
        final List raw = (data is Map ? (data['data'] ?? data['servers'] ?? data['episodes'] ?? []) : data) as List? ?? [];
        // fallback: إن لم يرجع شيء نستخدم السيرفرات المعروفة
        if (raw.isEmpty) {
          servers = [
            {'name': 'VidStreaming', 'url': '', 'quality': '1080p'},
            {'name': 'Mp4Upload', 'url': '', 'quality': '720p'},
            {'name': 'Ok.ru', 'url': '', 'quality': '480p'},
            {'name': 'GogoCDN', 'url': '', 'quality': '720p'},
            {'name': 'FileMoon', 'url': '', 'quality': '1080p'},
          ];
        } else {
          servers = raw.map((e) => Map<String, dynamic>.from(e as Map)).toList();
          // استخراج رابط الفيديو الأول إن وجد
          final firstUrl = servers.first['url'] ?? servers.first['link'] ?? servers.first['video_url'];
          if (firstUrl != null && (firstUrl as String).isNotEmpty) {
            selectedServer = servers.first['name'] ?? servers.first['server'] ?? 'VidStreaming';
            await _playUrl(firstUrl);
          }
        }
        if (servers.isNotEmpty && selectedServer.isEmpty) {
          selectedServer = servers.first['name']?.toString() ?? 'VidStreaming';
        }
      }
    } catch (e) {
      errorMsg = 'فشل تحميل السيرفرات: $e';
      // fallback servers للعرض حتى مع الخطأ
      servers = [
        {'name': 'VidStreaming', 'url': 'https://example.com/video.mp4'},
        {'name': 'Mp4Upload', 'url': 'https://example.com/video2.mp4'},
        {'name': 'Ok.ru', 'url': ''},
      ];
      if (selectedServer.isEmpty) selectedServer = 'VidStreaming';
    }
    if (mounted) setState(() => isLoading = false);
  }

  Future<void> _playUrl(String url) async {
    if (url.isEmpty) return;
    currentVideoUrl = url;
    try {
      await player.open(Media(url, httpHeaders: _videoHeaders));
    } catch (e) {
      if (mounted) setState(() => errorMsg = 'فشل التشغيل: $e');
    }
  }

  void _onServerSelected(String name) async {
    setState(() => selectedServer = name);
    final srv = servers.firstWhere((s) => (s['name'] ?? s['server']) == name, orElse: () => {});
    final url = (srv['url'] ?? srv['link'] ?? srv['video_url'] ?? '') as String;
    if (url.isNotEmpty) await _playUrl(url);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

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
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadEpisodeServers),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.grey[900],
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator(color: Color(0xFFFF9800)))
                        : errorMsg != null && currentVideoUrl == null
                            ? Center(child: Padding(padding: const EdgeInsets.all(16), child: Text(errorMsg!, style: const TextStyle(color: Colors.white70), textAlign: TextAlign.center)))
                            : currentVideoUrl != null
                                ? Video(controller: controller)
                                : Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      const Icon(Icons.play_circle_fill, size: 80, color: Color(0xFFFF9800)),
                                      Positioned(
                                        bottom: 12, left: 12, right: 12,
                                        child: Column(children: [
                                          Slider(value: 0.3, onChanged: (_) {}, activeColor: const Color(0xFFFF9800)),
                                          const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                            Text('10:23 / 24:00', style: TextStyle(color: Colors.white, fontSize: 11)),
                                            Row(children: [Icon(Icons.volume_up, color: Colors.white, size: 18), SizedBox(width: 8), Icon(Icons.fullscreen, color: Colors.white, size: 18)]),
                                          ]),
                                        ]),
                                      ),
                                      Positioned(top: 12, right: 12, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(6)), child: Text(selectedQuality, style: const TextStyle(color: Colors.white, fontSize: 12)))),
                                    ],
                                  ),
                  ),
                ),
                Container(
                  color: const Color(0xFF1A1A1A),
                  padding: const EdgeInsets.all(12),
                  child: Row(children: [
                    ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.thumb_up), label: const Text('إعجاب'), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9800))),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.comment, color: Colors.white), label: const Text('تعليقات', style: TextStyle(color: Colors.white))),
                    const Spacer(),
                    IconButton(icon: const Icon(Icons.download, color: Colors.white), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.share, color: Colors.white), onPressed: () {}),
                  ]),
                ),
                if (errorMsg != null) Padding(padding: const EdgeInsets.all(8), child: Text(errorMsg!, style: const TextStyle(color: Colors.orangeAccent, fontSize: 11))),
              ],
            ),
          ),
          Container(
            width: 300,
            color: const Color(0xFF212121),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Container(padding: const EdgeInsets.all(12), color: const Color(0xFFFF9800), child: Text('السيرفرات  ${isLoading ? "(تحميل...)" : ""}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
              Expanded(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator(color: Color(0xFFFF9800)))
                    : ListView(children: [
                        for (final s in servers)
                          RadioListTile(
                            title: Text((s['name'] ?? s['server'] ?? 'Unknown').toString(), style: const TextStyle(color: Colors.white, fontSize: 13)),
                            subtitle: s['quality'] != null ? Text(s['quality'].toString(), style: const TextStyle(color: Colors.white54, fontSize: 11)) : null,
                            value: (s['name'] ?? s['server']).toString(),
                            groupValue: selectedServer,
                            activeColor: const Color(0xFFFF9800),
                            onChanged: (v) => _onServerSelected(v!),
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
                      ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
