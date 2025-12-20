import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final primary = const Color(0xFFB52F2F); // warm red from screenshot

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              // Top image with diagonal cut
              ClipPath(
                clipper: _TopClipper(),
                child: Container(
                  height: size.height * 0.38,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1529101091764-c3526daf38fe?auto=format&fit=crop&w=1350&q=80'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Circular logo overlapping
              Positioned(
                top: size.height * 0.22,
                left: (size.width / 2) - 36,
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: primary,
                    child: Text(
                      'U',
                      style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              // White form card
              Positioned(
                top: size.height * 0.32,
                left: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Login', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 18),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email 365',
                          labelStyle: TextStyle(color: Colors.grey[700]),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primary, width: 1.2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primary, width: 2),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 18),
                      TextField(
                        obscureText: _obscure,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.grey[700]),
                          suffixIcon: GestureDetector(
                            onTap: () => setState(() => _obscure = !_obscure),
                            child: Icon(
                              _obscure ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey[700],
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primary, width: 1.2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primary, width: 2),
                          ),
                        ),
                      ),

                      const SizedBox(height: 26),

                      // Login button
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                          ),
                          child: Text('Log In', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),

                      const SizedBox(height: 12),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Bantuan ?', style: TextStyle(color: primary)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom red wave
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper: _BottomWaveClipper(),
                  child: Container(
                    height: size.height * 0.18,
                    color: primary.withOpacity(0.95),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(size.width * 0.5, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.25, 0, size.width * 0.5, 20);
    path.quadraticBezierTo(size.width * 0.75, 40, size.width, 30);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
