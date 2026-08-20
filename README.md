# World Language Picker 🌍

A modern, fast, zero-dependency Flutter language picker supporting **50+ world languages** with native flag emojis, instant search filtering, and clean UI.

---

<!-- ## Preview 🎬

<p align="center">
<img width="380" height="826" alt="Image" src="https://github.com/user-attachments/assets/b769a2ba-70e7-498b-a0d4-562fc72f2025" />

</p> -->

## Preview 🎬

![World Language Picker Demo](https://github.com/user-attachments/assets/b769a2ba-70e7-498b-a0d4-562fc72f2025)
---

## Features 🚀

* 🌐 **50+ Pre-configured World Languages** with ISO 639-1 language codes.
* 🏁 **Native Emoji Flags** with zero external image assets.
* ⚡ **Zero External Dependencies** — lightweight, fast, and framework agnostic.
* 🔍 **Instant Search Filtering** by English name, Native name, or ISO code.
* 🎨 **Fully Customizable** — adjust primary colors, background, border radius, and titles.

---

## Installation 📦

Add `world_language_picker` to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  world_language_picker: ^1.0.0

```

Or run this command in your terminal:

```bash
flutter pub add world_language_picker

```

---

## Usage 💡

### Basic Example

Open the language picker bottom sheet with a single function call:

```dart
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

```

---

## Author 👨‍💻

**Muneeb Shahid**

* **GitHub:** [@muneeb-shahid](https://github.com/muneeb-shahid/)
* **LinkedIn:** [Muneeb Shahid](https://www.linkedin.com/in/muneeb--shahid/)
* **Email:** [muneebshahid0102@gmail.com](https://www.google.com/search?q=mailto%3Amuneebshahid0102%40gmail.com)

---

## Contributing 🤝

Contributions, issues, and feature requests are welcome!

Feel free to check out the [Issues Page](https://www.google.com/search?q=https://github.com/muneeb-shahid/world_language_picker/issues) if you want to contribute.

---

## License 📄

This project is licensed under the MIT License - see the [LICENSE](https://www.google.com/search?q=LICENSE) file for details.