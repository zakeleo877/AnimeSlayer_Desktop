import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'ابحث عن أنمي...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.grey[100],
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(icon: const Icon(Icons.tune), onPressed: () => _showFilter(context)),
          ),
        ),
      ),
      body: Column(
        children: [
          // فلاتر سريعة (مطابق لـ FilterActivity)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                for (final f in ['الكل', 'أكشن', 'مغامرة', 'كوميديا', 'دراما', 'خيال', 'موسم 2024', 'مكتمل'])
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(label: Text(f, style: const TextStyle(fontSize: 12)), selected: f == 'الكل', onSelected: (_) {}, selectedColor: const Color(0xFFFF9800).withOpacity(0.2)),
                  ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 0.75, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemCount: 8,
              itemBuilder: (context, i) => Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => context.push('/series/${i + 1}'),
                  child: Column(
                    children: [
                      Expanded(child: Container(color: Colors.grey[300], child: const Center(child: Icon(Icons.search)))),
                      Padding(padding: const EdgeInsets.all(8), child: Text('نتيجة ${i + 1}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => ListView(
          controller: scrollController,
          padding: const EdgeInsets.all(16),
          children: [
            const Text('تصفية متقدمة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            DropdownButtonFormField(items: const [DropdownMenuItem(value: 'all', child: Text('الكل')), DropdownMenuItem(value: 'tv', child: Text('TV'))], onChanged: (_) {}, decoration: const InputDecoration(labelText: 'النوع')),
            const SizedBox(height: 12),
            DropdownButtonFormField(items: const [DropdownMenuItem(value: 'all', child: Text('الكل')), DropdownMenuItem(value: '2024', child: Text('2024'))], onChanged: (_) {}, decoration: const InputDecoration(labelText: 'الموسم')),
            const SizedBox(height: 12),
            DropdownButtonFormField(items: const [DropdownMenuItem(value: 'rating', child: Text('التقييم')), DropdownMenuItem(value: 'latest', child: Text('الأحدث'))], onChanged: (_) {}, decoration: const InputDecoration(labelText: 'الترتيب')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9800)), child: const Text('تطبيق')),
          ],
        ),
      ),
    );
  }
}
