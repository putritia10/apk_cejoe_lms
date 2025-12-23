import 'package:flutter/material.dart';
import 'session_detail_page.dart';

class CourseDetailPage extends StatefulWidget {
  final String title;
  final String code;

  const CourseDetailPage({Key? key, required this.title, required this.code}) : super(key: key);

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  int _selectedTab = 0;

  final List<Map<String, dynamic>> _sessions = List.generate(6, (i) => {
    'label': 'Pertemuan ${i + 1}',
    'title': '${(i + 1).toString().padLeft(2, '0')} - ${[
      'Pengantar User Interface Design',
      'Konsep User Interface Design',
      'Interaksi pada User Interface Design',
      'Ethnographic Observation',
      'UID Testing',
      'Assessment 1'
    ][i]}',
    'meta': '3 URLs, 2 Files, 3 Interactive Content',
    'done': i % 2 == 1,
  });

  final List<Map<String, dynamic>> _tasks = [
    {'title': 'Latihan 1: Observasi UI', 'due': '20 Jan', 'done': false},
    {'title': 'Kuis: Pengantar UI', 'due': '25 Jan', 'done': false},
  ];
  @override
  Widget build(BuildContext context) {
    final Color primary = const Color(0xFFB52F2F);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // header area with color
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
                    Expanded(
                      child: Text(widget.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Deskripsi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  const Text(
                    'Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna. Lalu dipelajari juga poin-poin penting pada interaction desain seperti visibility, feedback, limitation, consistency dan affordance.',
                    style: TextStyle(color: Colors.black87),
                  ),

                  const SizedBox(height: 18),

                  // tabs
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: [BoxShadow(color: Color.fromRGBO(0,0,0,0.03), blurRadius: 6)]),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedTab = 0),
                            child: Column(
                              children: [
                                Text('Materi', style: TextStyle(color: _selectedTab == 0 ? Colors.black87 : Colors.grey)),
                                const SizedBox(height: 8),
                                Container(height: 3, color: _selectedTab == 0 ? Colors.black54 : Colors.transparent),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedTab = 1),
                            child: Column(
                              children: [
                                Text('Tugas Dan Kuis', style: TextStyle(color: _selectedTab == 1 ? Colors.black87 : Colors.grey)),
                                const SizedBox(height: 8),
                                Container(height: 3, color: _selectedTab == 1 ? Colors.black54 : Colors.transparent),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  if (_selectedTab == 0) ..._sessions.map((s) => _buildSessionItem(s)),
                  if (_selectedTab == 1) ..._tasks.map((t) => _buildTaskItem(t)),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionItem(Map<String, dynamic> s) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => SessionDetailPage(
            label: s['label'] as String,
            title: s['title'] as String,
            meta: s['meta'] as String,
          )));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Color.fromRGBO(0,0,0,0.03), blurRadius: 8)],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(color: const Color(0xFF9ECFF0), borderRadius: BorderRadius.circular(8)),
                child: Text(s['label'] as String, style: const TextStyle(color: Colors.white, fontSize: 12)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(s['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text(s['meta'] as String, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              if (s['done'] == true)
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(color: Colors.green[600], shape: BoxShape.circle),
                  child: const Icon(Icons.check, color: Colors.white, size: 18),
                )
              else
                const SizedBox(width: 28, height: 28),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskItem(Map<String, dynamic> t) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Color.fromRGBO(0,0,0,0.03), blurRadius: 8)],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.assignment, color: Colors.grey),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(t['title'] as String, style: const TextStyle(fontWeight: FontWeight.w500))),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(t['due'] as String, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 6),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(color: (t['done'] as bool) ? Colors.green[600] : Colors.grey[300], shape: BoxShape.circle),
                  child: Icon((t['done'] as bool) ? Icons.check : Icons.hourglass_empty, color: (t['done'] as bool) ? Colors.white : Colors.grey[700], size: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
