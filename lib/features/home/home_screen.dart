import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/strings_ar.dart';
import '../../core/theme/dimens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _drawerIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsAr.appName),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: StringsAr.latestEpisodes),
            Tab(text: StringsAr.animeList),
            Tab(text: StringsAr.animeSeason),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.push('/search'),
            tooltip: StringsAr.search,
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => context.push('/profile'),
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildLatestEpisodes(),
          _buildAnimeList(),
          _buildSeasonArchive(),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    // مطابق تماما لـ MainActivity Drawer في الأصل (5 مجموعات)
    return Drawer(
      width: Dimens.drawerWidth,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFFFF9800)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(radius: 32, backgroundColor: Colors.white, child: Icon(Icons.person, size: 40)),
                const SizedBox(height: 12),
                const Text('زاكي', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('مرحبا بك', style: TextStyle(color: Colors.white.withOpacity(0.8))),
              ],
            ),
          ),
          const DrawerSectionHeader(title: 'الرئيسية'),
          _drawerItem(Icons.new_releases, StringsAr.latestEpisodes, 0),
          _drawerItem(Icons.list, StringsAr.animeList, 1),
          _drawerItem(Icons.calendar_today, StringsAr.animeSeason, 2),
          const Divider(),
          const DrawerSectionHeader(title: 'التصنيفات'),
          _drawerItem(Icons.leaderboard, StringsAr.malRanking, 3),
          _drawerItem(Icons.star, StringsAr.asRanking, 4),
          const Divider(),
          const DrawerSectionHeader(title: 'قائمتي'),
          _drawerItem(Icons.playlist_play, StringsAr.myList, 5, subtitle: 'مشاهدة/مكتمل/مخطط'),
          _drawerItem(Icons.list_alt, StringsAr.customList, 6),
          _drawerItem(Icons.favorite, StringsAr.favourites, 7),
          _drawerItem(Icons.face, StringsAr.favCharacters, 8),
          _drawerItem(Icons.history, StringsAr.history, 9),
          _drawerItem(Icons.download, StringsAr.downloads, 10),
          const Divider(),
          const DrawerSectionHeader(title: 'أخرى'),
          _drawerItem(Icons.people, StringsAr.topCharacters, 11),
          _drawerItem(Icons.recommend, StringsAr.recommendations, 12),
          _drawerItem(Icons.schedule, StringsAr.schedule, 13),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(StringsAr.settings),
            onTap: () => context.push('/settings'),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, int index, {String? subtitle}) {
    return ListTile(
      leading: Icon(icon, color: _drawerIndex == index ? const Color(0xFFFF9800) : null),
      title: Text(title, style: TextStyle(color: _drawerIndex == index ? const Color(0xFFFF9800) : null)),
      subtitle: subtitle != null ? Text(subtitle, style: const TextStyle(fontSize: 11)) : null,
      selected: _drawerIndex == index,
      onTap: () => setState(() => _drawerIndex = index),
    );
  }

  Widget _buildLatestEpisodes() {
    // شبكة حلقات - مطابق لـ Latest Episodes
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.7,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: 12,
      itemBuilder: (context, i) => AnimeCard(index: i),
    );
  }

  Widget _buildAnimeList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, i) => ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(width: 60, height: 80, color: Colors.grey[300], child: const Icon(Icons.image)),
        ),
        title: Text('أنمي ${i + 1}'),
        subtitle: const Text('TV • 24 حلقة • تقييم 8.5'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push('/series/${i + 1}'),
      ),
    );
  }

  Widget _buildSeasonArchive() {
    return const Center(child: Text('أرشيف المواسم - Season Archive'));
  }
}

class DrawerSectionHeader extends StatelessWidget {
  final String title;
  const DrawerSectionHeader({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[600])),
    );
  }
}

class AnimeCard extends StatelessWidget {
  final int index;
  const AnimeCard({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/series/$index'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[300],
                child: const Icon(Icons.movie, size: 40, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('أنمي ${index + 1}', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  Text('حلقة ${index + 10}', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
