import 'package:intl/intl.dart';

class Helpers {
  static String formatDate(String iso) {
    try {
      final dt = DateTime.parse(iso);
      return DateFormat('yyyy/MM/dd').format(dt);
    } catch (_) {
      return iso;
    }
  }

  static String imageUrl(String? path) {
    if (path == null || path.isEmpty) return '';
    if (path.startsWith('http')) return path;
    return 'https://anslayer.com/$path';
  }

  // تحويل حالة الأنمي (watching/watched إلخ) إلى عربي
  static String statusToAr(String status) {
    return switch (status.toLowerCase()) {
      'watching' => 'أشاهد',
      'watched' || 'completed' => 'مكتمل',
      'on-hold' => 'متوقف',
      'dropped' => 'متروك',
      'plan-to-watch' => 'أخطط للمشاهدة',
      'favorites' => 'المفضلة',
      _ => status,
    };
  }
}
