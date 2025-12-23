import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Color _primary = const Color(0xFFB52F2F);

  final _firstNameCtl = TextEditingController(text: 'PUTRI');
  final _lastNameCtl = TextEditingController(text: 'TIA');
  final _emailCtl = TextEditingController(text: 'Putritia@gmail.com');
  final _countryCtl = TextEditingController(text: 'Indonesia');
  final _descCtl = TextEditingController(text: 'Deskripsi singkat tentang mahasiswa...');

  late String _initialFirst;
  late String _initialLast;
  late String _initialEmail;
  late String _initialCountry;
  late String _initialDesc;

  @override
  void initState() {
    super.initState();
    _initialFirst = _firstNameCtl.text;
    _initialLast = _lastNameCtl.text;
    _initialEmail = _emailCtl.text;
    _initialCountry = _countryCtl.text;
    _initialDesc = _descCtl.text;
  }

  bool _hasChanges() {
    return _firstNameCtl.text != _initialFirst ||
        _lastNameCtl.text != _initialLast ||
        _emailCtl.text != _initialEmail ||
        _countryCtl.text != _initialCountry ||
        _descCtl.text != _initialDesc;
  }

  Future<bool> _maybePop() async {
    if (!_hasChanges()) return true;

    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Perubahan belum disimpan'),
        content: const Text('Anda memiliki perubahan yang belum disimpan. Keluar tanpa menyimpan?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Batal')),
          TextButton(onPressed: () => Navigator.of(ctx).pop(true), child: const Text('Keluar')),
        ],
      ),
    );

    return result == true;
  }

  @override
  void dispose() {
    _firstNameCtl.dispose();
    _lastNameCtl.dispose();
    _emailCtl.dispose();
    _countryCtl.dispose();
    _descCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: _maybePop,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: size.height * 0.28,
                color: _primary,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () async {
                            final navigator = Navigator.of(context);
                            final ok = await _maybePop();
                            if (!mounted) return;
                            if (ok) navigator.pop();
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),

          // content card
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.06),
                // avatar
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 8)],
                    ),
                    child: CircleAvatar(
                      radius: 56,
                      backgroundColor: _primary,
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('PUTRI TIA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                const SizedBox(height: 16),

                // white card with tabs
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('About Me', style: TextStyle(color: Colors.grey[700])),
                            Text('Kelas', style: TextStyle(color: Colors.grey[700])),
                            Column(
                              children: [
                                Text('Edit Profile', style: TextStyle(color: _primary, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 6),
                                Container(height: 3, width: 40, color: Colors.black54),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildLabeledTextField('Nama Pertama', controller: _firstNameCtl),
                      const SizedBox(height: 12),
                      _buildLabeledTextField('Nama Terakhir', controller: _lastNameCtl),
                      const SizedBox(height: 12),
                      _buildLabeledTextField('E-mail Address', controller: _emailCtl),
                      const SizedBox(height: 12),
                      _buildLabeledTextField('Negara', controller: _countryCtl),
                      const SizedBox(height: 12),
                      _buildLabeledTextField('Deskripsi', controller: _descCtl, maxLines: 6),

                      const SizedBox(height: 18),

                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            // Simulate save and mark as saved
                            setState(() {
                              _initialFirst = _firstNameCtl.text;
                              _initialLast = _lastNameCtl.text;
                              _initialEmail = _emailCtl.text;
                              _initialCountry = _countryCtl.text;
                              _initialDesc = _descCtl.text;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profil disimpan')));
                          },

                          style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: _primary, elevation: 0, padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                          child: const Text('Simpan'),
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));  }
  Widget _buildLabeledTextField(String label, {required TextEditingController controller, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.black54, fontSize: 12)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: Colors.grey.shade300)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: Colors.grey.shade300)),
          ),
        ),
      ],
    );
  }
}
