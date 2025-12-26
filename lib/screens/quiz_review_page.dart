import 'package:flutter/material.dart';
import 'quiz_question_review_page.dart';

class QuizReviewPage extends StatelessWidget {
  const QuizReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primary = const Color(0xFFB52F2F);

    // Sample data from the example
    final String startedAt = 'Kamis 25 Februari 2021 10:25';
    final String status = 'Selesai';
    final String completedAt = 'Kamis 25 Februari 2021 10:40';
    final String duration = '13 Menit 22 Detik';
    final String score = '0 / 100';

    final List<Map<String, String>> questions = [
      {'question': 'Radio button dapat digunakan untuk menentukan ?', 'answer': 'A. Jenis Kelamin'},
      {'question': 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?', 'answer': 'B. Konsistensi'},
      {'question': 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?', 'answer': 'C. Konsistensi'},
      {'question': 'Radio button dapat digunakan untuk menentukan ?', 'answer': 'A. Jenis Kelamin'},
      {'question': 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?', 'answer': 'C. Konsistensi'},
      {'question': 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?', 'answer': 'C. Konsistensi'},
      {'question': 'Radio button dapat digunakan untuk menentukan ?', 'answer': 'A. Jenis Kelamin'},
    ];

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
                      child: Text('Review Jawaban', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
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
                  // Quiz Summary
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
                        const Text('Di Mulai Pada', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(startedAt, style: TextStyle(color: Colors.black87)),
                        const SizedBox(height: 12),
                        const Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(status, style: TextStyle(color: Colors.black87)),
                        const SizedBox(height: 12),
                        const Text('Selesai Pada', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(completedAt, style: TextStyle(color: Colors.black87)),
                        const SizedBox(height: 12),
                        const Text('Waktu Penyelesaian', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(duration, style: TextStyle(color: Colors.black87)),
                        const SizedBox(height: 12),
                        const Text('Nilai', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(score, style: TextStyle(color: Colors.black87)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Questions Review
                  ...questions.asMap().entries.map((entry) {
                    int index = entry.key + 1;
                    Map<String, String> q = entry.value;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Pertanyaan $index', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 8),
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
                              Text(q['question']!, style: TextStyle(color: Colors.black87)),
                              const SizedBox(height: 12),
                              Text('Jawaban Tersimpan', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text(q['answer']!, style: TextStyle(color: Colors.black87)),
                              const SizedBox(height: 12),
                              Align(
                                alignment: Alignment.centerRight,
                                child: OutlinedButton(
                                  onPressed: () {
                                    String selectedAnswer = q['answer']!.split('.')[0];
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => QuizQuestionReviewPage(
                                          questionIndex: index - 1,
                                          selectedAnswer: selectedAnswer,
                                        ),
                                      ),
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: primary),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Text('Lihat Soal', style: TextStyle(color: primary)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }).toList(),

                  const SizedBox(height: 24),

                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      // Show confirmation message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Jawaban sudah dikirim')),
                      );
                      // Navigate back to the class list page
                      Navigator.of(context).pop(); // back to quiz_detail
                      Navigator.of(context).pop(); // back to course_detail
                      Navigator.of(context).pop(); // back to class_list
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Kirim Jawaban', style: TextStyle(color: Colors.white)),
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