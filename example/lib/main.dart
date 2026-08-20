import 'package:flutter/material.dart';
import 'package:world_language_picker/world_language_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6366F1)),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Language? _selectedLanguage;

  String _getCountryFlagEmoji(String countryCode) {
    final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('World Language Picker'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEEF2FF),
                        shape: BoxShape.circle,
                      ),
                      child: _selectedLanguage != null
                          ? Text(
                              _getCountryFlagEmoji(_selectedLanguage!.countryCode),
                              style: const TextStyle(fontSize: 38),
                            )
                          : const Icon(Icons.translate_rounded, color: Color(0xFF6366F1), size: 32),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _selectedLanguage != null ? _selectedLanguage!.nativeName : 'No Language Selected',
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () async {
                  final language = await WorldLanguagePicker.showBottomSheet(
                    context,
                    initialLanguage: _selectedLanguage,
                    primaryColor: const Color(0xFF6366F1),
                  );
                  if (language != null) {
                    setState(() => _selectedLanguage = language);
                  }
                },
                icon: const Icon(Icons.language),
                label: const Text('Select Language'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}