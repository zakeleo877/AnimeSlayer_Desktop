import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SeriesScreen extends StatelessWidget {
  final String animeId;
  const SeriesScreen({super.key, required this.animeId});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('تفاصيل الأنمي #$animeId'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'نظرة عامة'),
              Tab(text: 'الحلقات'),
              Tab(text: 'الشخصيات'),
              Tab(text: 'الأخبار'),
              Tab(text: 'الإحصائيات'),
            ],
          ),
          actions: [
            IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
            IconButton(icon: const Icon(Icons.share), onPressed: () {}),
          ],
        ),
        body: TabBarView(
          children: [
            _overviewTab(),
            _episodesTab(context),
            _charactersTab(),
            _newsTab(),
            _statsTab(),
          ],
        ),
      ),
    );
  }

  Widget _overviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(width: 160, height: 230, color: Colors.grey[300], child: const Icon(Icons.image, size: 50)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('اسم الأنمي بالعربية', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    const Text('Anime Name English', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      children: [
                        Chip(label: const Text('أكشن'), backgroundColor: Colors.orange[50]),
                        Chip(label: const Text('مغامرة'), backgroundColor: Colors.orange[50]),
                        Chip(label: const Text('TV'), backgroundColor: Colors.blue[50]),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 18),
                        const SizedBox(width: 4),
                        const Text('8.7', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(color: const Color(0xFF42BD59), borderRadius: BorderRadius.circular(4)),
                          child: const Text('آمن', style: TextStyle(color: Colors.white, fontSize: 11)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('القصة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          const Text('قصة الأنمي تظهر هنا... هذه نسخة سطح المكتب المبنية من الهندسة العكسية للتطبيق الأصلي.'),
          const SizedBox(height: 16),
          // أزرار القوائم (مطابق للأصل: watching/watched/fav...)
          Wrap(
            spacing: 8,
            children: [
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.play_arrow), label: const Text('أشاهد')),
              OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.check), label: const Text('مكتمل')),
              OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.favorite), label: const Text('مفضلة')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _episodesTab(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 24,
      itemBuilder: (context, i) => Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          leading: Stack(
            children: [
              Container(width: 90, height: 60, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(6)), child: const Icon(Icons.play_circle)),
              Positioned(bottom: 2, right: 2, child: Container(padding: const EdgeInsets.symmetric(horizontal: 4), decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(3)), child: const Text('24:00', style: TextStyle(color: Colors.white, fontSize: 10)))),
            ],
          ),
          title: Text('الحلقة ${i + 1}'),
          subtitle: const Text('تمت المشاهدة • تقييم 4.5'),
          trailing: const Icon(Icons.more_vert),
          onTap: () => context.push('/player/${i + 1}'),
        ),
      ),
    );
  }

  Widget _charactersTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.8, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: 9,
      itemBuilder: (context, i) => Card(
        child: Column(
          children: [
            Expanded(child: Container(color: Colors.grey[300], child: const Center(child: Icon(Icons.person)))),
            Padding(padding: const EdgeInsets.all(6), child: Text('شخصية ${i + 1}', style: const TextStyle(fontSize: 12))),
          ],
        ),
      ),
    );
  }

  Widget _newsTab() => const Center(child: Text('أخبار ذات صلة'));
  Widget _statsTab() => const Center(child: Text('الإحصائيات والمخططات'));
}
