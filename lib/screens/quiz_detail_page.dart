import 'package:flutter/material.dart';

class QuizDetailPage extends StatelessWidget {
  const QuizDetailPage({Key? key}) : super(key: key);

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
                      child: Text('Informasi Kuis', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
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
                  const Text('Instruksi:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  const Text(
                    'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis. Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.',
                    style: TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Kerjakan sebelum hari Jum\'at, 26 Februari 2021 jam 23:59 WIB.',
                    style: TextStyle(color: Colors.black87),
                  ),

                  const SizedBox(height: 24),

                  const Text('Detail Kuis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),

                  // Detail box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.03), blurRadius: 8)],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Kuis Akan di tutup pada:', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        const Text('Jumat, 26 February 2021, 11:59 PM', style: TextStyle(color: Colors.black87)),
                        const SizedBox(height: 12),
                        const Text('Batas Waktu:', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        const Text('15 menit', style: TextStyle(color: Colors.black87)),
                        const SizedBox(height: 12),
                        const Text('Metode Penilaian:', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        const Text('Nilai Tertinggi', style: TextStyle(color: Colors.black87)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text('Percobaan yang Sudah Dilakukan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),

                  // Table
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.03), blurRadius: 8)],
                    ),
                    child: Table(
                      border: TableBorder.all(color: Colors.grey.shade300),
                      children: [
                        TableRow(
                          decoration: BoxDecoration(color: Colors.grey.shade100),
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Nilai / 100.00', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Tinjau Kembali', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Selesai\nDikirim Pada Kamis, 25 Februari 2021, 10:40'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('85.0'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Lihat'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text('Ringkasan Nilai', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.03), blurRadius: 8)],
                    ),
                    child: const Text(
                      'Nilai Akhir Anda Untuk Kuis Ini Adalah 85.0 / 100.00',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Action buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text('Ambil Kuis', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: BorderSide(color: primary),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text('Kembali Ke Kelas', style: TextStyle(color: primary)),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}