import 'package:flutter/material.dart';

class AnnouncementDetailPage extends StatelessWidget {
  const AnnouncementDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primary = const Color(0xFFB52F2F);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // header
          Container(
            color: primary,
            padding: const EdgeInsets.only(bottom: 12),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text('Pengumuman', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Announcement Title
                  Text(
                    'Maintenance Pra UAS Semester Genap 2020/2021',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 24),

                  // Announcement Content
                  Text(
                    'Maintenance LMS',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Diinformasikan kepada seluruh pengguna LMS, kami dari tim CeLOE akan melakukan maintenance pada tanggal 12 Juni 2021, untuk meningkatkan layanan server dalam menghadapi ujian akhir semester (UAS).\n\nDengan adanya kegiatan maintenance tersebut maka situs LMS (lms.telkomuniversity.ac.id) tidak dapat diakses mulai pukul 00.00 s/d 06.00 WIB.\n\nDemikian informasi ini kami sampaikan, mohon maaf atas ketidaknyamanannya.\n\nHormat Kami, CeLOE Telkom University',
                    style: TextStyle(color: Colors.black87, fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 0, // Home selected
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Kelas Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
        ],
        onTap: (index) {
          // TODO: Handle navigation
        },
      ),
    );
  }
}