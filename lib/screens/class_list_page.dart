import 'package:flutter/material.dart';
import 'course_detail_page.dart';

class ClassListContent extends StatelessWidget {
  const ClassListContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              'Daftar Kelas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ClassListItem(
              title: _classList[index]['title']!,
              code: _classList[index]['code']!,
              progress: _classList[index]['progress']!,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => CourseDetailPage(
                    title: _classList[index]['title']!,
                    code: _classList[index]['code']!,
                  ),
                ));
              },
            ),
            childCount: _classList.length,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 80)),
      ],
    );
  }
}

class ClassListItem extends StatelessWidget {
  final String title;
  final String code;
  final double progress;
  final VoidCallback? onTap;

  const ClassListItem({
    Key? key,
    required this.title,
    required this.code,
    required this.progress,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.03), blurRadius: 6)],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(code, style: TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor: Colors.grey.shade200,
                  color: Colors.red.shade400,
                ),
                const SizedBox(height: 4),
                Text('${(progress * 100).toStringAsFixed(0)}% Selesai', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> _classList = [
  {
    'title': 'Desain Antarmuka & Pengalaman Pengguna (UI/UX)',
    'code': 'DGPMAG-D4SI-02 (A)',
    'progress': 0.0,
  },
  {
    'title': 'Kewarganegaraan',
    'code': 'DGPMAG-D4SI-02 (B)',
    'progress': 0.0,
  },
  {
    'title': 'Sistem Operasi',
    'code': 'DGPMAG-D4SI-02 (C)',
    'progress': 0.0,
  },
  {
    'title': 'Pemrograman Perangkat Bergerak (Mobile)',
    'code': 'DGPMAG-D4SI (A)',
    'progress': 0.0,
  },
  {
    'title': 'Bahasa Inggris Bisnis dan Komunikasi',
    'code': 'DGPMAG-D4SI (ARS)',
    'progress': 0.0,
  },
  {
    'title': 'Pemrograman Multimedia Interaktif',
    'code': 'DGPMAG-D4SI (P)',
    'progress': 0.0,
  },
  {
    'title': 'Olahraga',
    'code': 'DGTI-442-02 (R)',
    'progress': 0.0,
  },
];