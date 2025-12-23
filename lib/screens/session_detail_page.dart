import 'package:flutter/material.dart';

class SessionDetailPage extends StatelessWidget {
  final String label;
  final String title;
  final String meta;

  const SessionDetailPage({Key? key, required this.label, required this.title, required this.meta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primary = const Color(0xFFB52F2F);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(label, style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(meta, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(color: Color.fromRGBO(0,0,0,0.04), blurRadius: 8)],
              ),
              child: const Text(
                'Isi materi pertemuan ini akan ditampilkan di sini. Contoh: links, files, dan interactive content.',
                style: TextStyle(height: 1.4),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_circle, color: Colors.white),
              label: const Text('Buka Materi', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: primary),
            ),
          ],
        ),
      ),
    );
  }
}
