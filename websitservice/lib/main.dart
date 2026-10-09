import 'package:flutter/material.dart';

import 'login.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'เริ่มต้นใช้งาน',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF176B5B),
          primary: const Color(0xFF176B5B),
          surface: const Color(0xFFF8F7F2),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F7F2),
        fontFamily: 'NotoSansThai',
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _openPage(String route) {
    Navigator.pushNamed(
      context,
      route,
      arguments: _emailController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 650),
              curve: Curves.easeOutCubic,
              tween: Tween(begin: 0, end: 1),
              builder: (context, progress, child) => Opacity(
                opacity: progress,
                child: Transform.translate(
                  offset: Offset(0, 18 * (1 - progress)),
                  child: child,
                ),
              ),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: const Color(0xFF176B5B),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: const Icon(
                                Icons.auto_awesome,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'เริ่มต้น',
                              style: TextStyle(
                                color: Color(0xFF183B34),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 44),
                        Container(
                          height: 230,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE7D6),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: 25,
                                right: 34,
                                child: Container(
                                  width: 74,
                                  height: 74,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFEF9A59),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Container(
                                width: 138,
                                height: 138,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF176B5B),
                                  borderRadius: BorderRadius.circular(42),
                                ),
                                child: const Icon(
                                  Icons.waving_hand_rounded,
                                  size: 72,
                                  color: Color(0xFFFFF9E9),
                                ),
                              ),
                              Positioned(
                                bottom: 25,
                                left: 34,
                                child: Icon(
                                  Icons.auto_awesome,
                                  size: 38,
                                  color: const Color(
                                    0xFF176B5B,
                                  ).withValues(alpha: 0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          'ยินดีต้อนรับ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF183B34),
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'เข้าสู่ระบบหรือสร้างบัญชีใหม่\nเพื่อเริ่มใช้งาน',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF687A73),
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          key: const Key('homeEmailField'),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            labelText: 'อีเมล',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        FilledButton(
                          key: const Key('loginButton'),
                          onPressed: () => _openPage('/login'),
                          style: FilledButton.styleFrom(
                            minimumSize: const Size.fromHeight(54),
                            backgroundColor: const Color(0xFF176B5B),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton(
                          key: const Key('registerButton'),
                          onPressed: () => _openPage('/register'),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(54),
                            foregroundColor: const Color(0xFF176B5B),
                            side: const BorderSide(color: Color(0xFFB8C9C1)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'สมัครสมาชิก',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
