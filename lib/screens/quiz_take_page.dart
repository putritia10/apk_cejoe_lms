import 'package:flutter/material.dart';

class QuizTakePage extends StatefulWidget {
  const QuizTakePage({Key? key}) : super(key: key);

  @override
  State<QuizTakePage> createState() => _QuizTakePageState();
}

class _QuizTakePageState extends State<QuizTakePage> {
  int _currentQuestion = 0;
  String _selectedAnswer = 'A'; // Default selected
  int _timeLeft = 15 * 60; // 15 minutes in seconds

  final List<String> _questions = [
    'Radio button dapat digunakan untuk menentukan ?',
    // Add more questions if needed, but for now just one
  ];

  final List<List<String>> _options = [
    ['Jenis Kelamin', 'Alamat', 'Hobby', 'Riwayat Pendidikan', 'Umur'],
  ];

  @override
  void initState() {
    super.initState();
    // Start timer
    // Note: In a real app, you'd use a Timer.periodic
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')} : ${secs.toString().padLeft(2, '0')}';
  }

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
                      child: Text('Quiz Review 1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    const Text('⏰ 15 : 00', style: TextStyle(color: Colors.white, fontSize: 16)),
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
                  // Question navigation
                  const Text('Navigasi Nomor Soal', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(15, (index) {
                      bool isCurrent = index == _currentQuestion;
                      return Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: isCurrent ? primary : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: isCurrent ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 24),

                  // Question info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.03), blurRadius: 8)],
                    ),
                    child: Text(
                      'Soal Nomor ${_currentQuestion + 1} / 15',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Question
                  const Text('Pertanyaan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.03), blurRadius: 8)],
                    ),
                    child: Text(_questions[_currentQuestion]),
                  ),

                  const SizedBox(height: 24),

                  // Answer options
                  const Text('Pilihan Jawaban', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.03), blurRadius: 8)],
                    ),
                    child: Column(
                      children: _options[_currentQuestion].asMap().entries.map((entry) {
                        int idx = entry.key;
                        String option = entry.value;
                        String letter = String.fromCharCode(65 + idx); // A, B, C, etc.
                        return RadioListTile<String>(
                          title: Text('$letter. $option'),
                          value: letter,
                          groupValue: _selectedAnswer,
                          onChanged: (value) {
                            setState(() {
                              _selectedAnswer = value!;
                            });
                          },
                          activeColor: primary,
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Navigation button
                  ElevatedButton(
                    onPressed: () {
                      // Next question logic
                      if (_currentQuestion < 14) {
                        setState(() {
                          _currentQuestion++;
                          _selectedAnswer = 'A'; // Reset selection
                        });
                      } else {
                        // Submit quiz
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Kuis selesai!')),
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      _currentQuestion < 14 ? 'Soal Selanjutnya' : 'Selesai',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
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