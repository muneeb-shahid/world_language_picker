# World Language Picker 🌍

A modern, fast, zero-dependency Flutter language picker supporting **80+ world languages** with native flag emojis, instant search filtering, and clean UI.

[![pub package](https://img.shields.io/pub/v/world_language_picker.svg)](https://pub.dev/packages/world_language_picker)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter)](https://flutter.dev)

---

## Features 🚀

- 🌐 **50+ Pre-configured World Languages** with ISO 639-1 language codes.
- 🏁 **Native Emoji Flags** with zero external image assets.
- ⚡ **Zero External Dependencies** — lightweight, fast, and framework agnostic.
- 🔍 **Instant Search Filtering** by English name, Native name, or ISO code.
- 🎨 **Fully Customizable** — adjust primary colors, background, border radius, and titles.

---

## Installation 📦

Add `world_language_picker` to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  world_language_picker: ^1.0.0

Or run this command in your terminal:
flutter pub add world_language_picker    

Usage:

Basic Example
Open the language picker bottom sheet with a single function call:

import 'package:flutter/material.dart';
import 'package:world_language_picker/world_language_picker.dart';

void openLanguagePicker(BuildContext context) async {
final Language? selectedLanguage = await WorldLanguagePicker.showBottomSheet(
context,
primaryColor: const Color(0xFF6366F1),
title: 'Select Language',
searchHint: 'Search language...',
);

if (selectedLanguage != null) {
print('Native Name: ${selectedLanguage.nativeName}'); // e.g. Español
print('English Name: ${selectedLanguage.name}');      // e.g. Spanish
print('ISO Code: ${selectedLanguage.code}');           // e.g. es
print('Country Code: ${selectedLanguage.countryCode}');// e.g. ES
}
}


Author: 👨‍💻 
Muneeb Shahid

GitHub: https://github.com/muneeb-shahid/

LinkedIn: https://www.linkedin.com/in/muneeb--shahid/

Email: muneebshahid0102@gmail.com

Contributing 🤝
Contributions, issues, and feature requests are welcome!

Feel free to check out the Issues Page if you want to contribute.

License 📄
This project is licensed under the MIT License - see the LICENSE file for details.