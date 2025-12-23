import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'course_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final Color _primary = const Color(0xFFB52F2F);

  void _onNavTap(int idx) {
    setState(() => _selectedIndex = idx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (_selectedIndex == 0) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: _buildHeader(context)),
                  SliverToBoxAdapter(child: SizedBox(height: 10)),
                  SliverToBoxAdapter(child: _buildUpcomingTask(context)),
                  SliverToBoxAdapter(child: SizedBox(height: 10)),
                  SliverToBoxAdapter(child: _buildAnnouncements(context)),
                  SliverToBoxAdapter(child: SizedBox(height: 10)),
                  SliverToBoxAdapter(child: _buildProgressTitle()),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => CourseProgressItem(
                        title: _sampleCourses[index]['title']!,
                        code: _sampleCourses[index]['code']!,
                        imageAsset: _sampleCourses[index]['image']!,
                        progress: _sampleCourses[index]['progress']!,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => CourseDetailPage(
                            title: _sampleCourses[index]['title']!,
                            code: _sampleCourses[index]['code']!,
                          )));
                        },
                      ),
                      childCount: _sampleCourses.length,
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 80)),
                ],
              );
            } else if (_selectedIndex == 3) {
              return ProfileContent(onRequestBack: () => setState(() => _selectedIndex = 0));
            } else {
              return const Center(child: Text('Belum tersedia'));
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
        selectedItemColor: _primary,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Kelas Saya'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: _primary,
            child: Text('D', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Hallo,', style: TextStyle(fontSize: 12, color: Colors.grey)),
                SizedBox(height: 2),
                Text('PUTRI TIA', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildUpcomingTask(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tugas Yang Akan Datang', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Color.fromRGBO(0,0,0,0.03), blurRadius: 8)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('DESAIN ANTARMUKA & PENGALAMAN PENGGUNA', style: TextStyle(fontWeight: FontWeight.bold, color: _primary)),
                const SizedBox(height: 8),
                Text('Tugas: Uas - Ujian Akhir Semester', style: TextStyle(color: Colors.grey[700])),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Waktu Pengumpulan', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        SizedBox(height: 4),
                        Text('Jumat 31 Desember, 23:59 WIB', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: _primary),
                      child: const Text('Buka Tugas', style: TextStyle(color: Colors.white),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncements(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Pengumuman Terakhir', style: TextStyle(fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text('Lihat Semua'))
            ],
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Color.fromRGBO(0,0,0,0.03), blurRadius: 8)],
            ),
            child: Column(
              children: [
                // sample announcement with image
                Row(
                  children: [
                    Container(
                      width: 110,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                      ),
                      child: const Center(child: Icon(Icons.image, color: Colors.grey)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Maintenance Pro LMS Semester Genap 2025', style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 6),
                            Text('Detail: Ada pemeliharaan pada sistem pada tanggal 31 desember', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: const Text('Progres Kelas', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class CourseProgressItem extends StatelessWidget {
  final String title;
  final String code;
  final String imageAsset;
  final double progress; // 0..1
  final VoidCallback? onTap;

  const CourseProgressItem({Key? key, required this.title, required this.code, required this.imageAsset, required this.progress, this.onTap}) : super(key: key);

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
            boxShadow: [BoxShadow(color: Color.fromRGBO(0,0,0,0.03), blurRadius: 6)],
          ),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(child: Icon(Icons.image, color: Colors.grey[600])),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(code, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(value: progress, minHeight: 6, backgroundColor: Colors.grey.shade200, color: Colors.red.shade400),
                      const SizedBox(height: 4),
                      Text('${(progress * 100).toStringAsFixed(0)}% lengkap', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> _sampleCourses = [
  {'title': 'MOBILE PROGRAMMING', 'code': 'DESAIN-UI/UX', 'image': 'assets/images/image.png', 'progress': 0.25},
  {'title': 'PENGEMBANGAN MOBILE', 'code': 'MOBDEV-02', 'image': 'assets/images/image.png', 'progress': 0.5},
  {'title': 'SISTEM OPERASI', 'code': 'SYS-01', 'image': 'assets/images/image.png', 'progress': 0.75},
  {'title': 'JARINGAN', 'code': 'NET-01', 'image': 'assets/images/image.png', 'progress': 0.1},
  {'title': 'DESAIN GRAFIS', 'code': 'DG-01', 'image': 'assets/images/image.png', 'progress': 0.9},
];