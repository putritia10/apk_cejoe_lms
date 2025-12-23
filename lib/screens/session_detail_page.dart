import 'package:flutter/material.dart';

class SessionDetailPage extends StatefulWidget {
  final String label;
  final String title;
  final String meta;

  const SessionDetailPage({Key? key, required this.label, required this.title, required this.meta}) : super(key: key);

  @override
  State<SessionDetailPage> createState() => _SessionDetailPageState();
}

class _SessionDetailPageState extends State<SessionDetailPage> {
  int _selectedTab = 0;

  final List<Map<String, dynamic>> _materials = [
    {'title': 'Zoom Meeting Syncronous', 'type': 'link', 'done': true},
    {'title': 'Pengantar User Interface Design', 'type': 'file', 'done': false},
    {'title': 'Empat Teori Dasar Antarmuka Pengguna', 'type': 'file', 'done': false},
    {'title': 'Empat Teori Dasar Antarmuka Pengguna', 'type': 'file', 'done': false},
    {'title': 'User Interface Design for Beginner', 'type': 'file', 'done': true},
    {'title': '20 Prinsip Desain', 'type': 'file', 'done': true},
    {'title': 'Best Practice UI Design', 'type': 'file', 'done': false},
  ];

  final List<Map<String, dynamic>> _tasks = [
    {'title': 'Quiz Review 01', 'type': 'quiz', 'done': true},
    {'title': 'Tugas 01 - UID Android Mobile Game', 'type': 'tugas', 'done': false},
  ];

  @override
  Widget build(BuildContext context) {
    final Color primary = const Color(0xFFB52F2F);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(widget.label, style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(widget.meta, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 12),

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
                                Text('Lampiran Materi', style: TextStyle(color: _selectedTab == 0 ? Colors.black87 : Colors.grey)),
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
                                Text('Tugas dan Kuis', style: TextStyle(color: _selectedTab == 1 ? Colors.black87 : Colors.grey)),
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

                  if (_selectedTab == 0) ..._materials.map((m) => _buildMaterialCard(m)),
                  if (_selectedTab == 1) ..._tasks.map((t) => _buildTaskRow(t)),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialCard(Map<String, dynamic> m) {
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
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
              child: Icon(m['type'] == 'link' ? Icons.link : Icons.article, color: Colors.grey[700]),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(m['title'] as String, style: const TextStyle(fontWeight: FontWeight.w500))),
            const SizedBox(width: 8),
            if (m['done'] == true)
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
    );
  }

  Widget _buildTaskRow(Map<String, dynamic> t) {
    final isQuiz = (t['type'] as String) == 'quiz';
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: const Color(0xFF9ECFF0), borderRadius: BorderRadius.circular(12)),
              child: Text(isQuiz ? 'QUIZ' : 'TUGAS', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(t['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(width: 8),
            if (t['done'] == true)
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(color: Colors.green[600], shape: BoxShape.circle),
                child: const Icon(Icons.check, color: Colors.white, size: 18),
              )
            else
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                child: const Icon(Icons.more_horiz, color: Colors.grey, size: 18),
              ),
          ],
        ),
      ),
    );
  }
}
