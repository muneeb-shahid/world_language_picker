import 'package:flutter/material.dart';
import 'data/language_data.dart';
import 'models/language.dart';

class WorldLanguagePicker {
  static Future<Language?> showBottomSheet(
    BuildContext context, {
    Language? initialLanguage,
    String title = 'Select Language',
    String searchHint = 'Search language...',
    Color? primaryColor,
    Color? backgroundColor,
    BorderRadiusGeometry? borderRadius,
  }) {
    return showModalBottomSheet<Language>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _LanguagePickerSheet(
        initialLanguage: initialLanguage,
        title: title,
        searchHint: searchHint,
        primaryColor: primaryColor ?? Theme.of(context).primaryColor,
        backgroundColor: backgroundColor ?? Colors.white,
        borderRadius: borderRadius,
      ),
    );
  }
}

class _LanguagePickerSheet extends StatefulWidget {
  final Language? initialLanguage;
  final String title;
  final String searchHint;
  final Color primaryColor;
  final Color backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  const _LanguagePickerSheet({
    this.initialLanguage,
    required this.title,
    required this.searchHint,
    required this.primaryColor,
    required this.backgroundColor,
    this.borderRadius,
  });

  @override
  State<_LanguagePickerSheet> createState() => _LanguagePickerSheetState();
}

class _LanguagePickerSheetState extends State<_LanguagePickerSheet> {
  late List<Language> _filteredLanguages;
  late Language? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _filteredLanguages = defaultWorldLanguages;
    _selectedLanguage = widget.initialLanguage ?? defaultWorldLanguages.first;
  }

  void _filterLanguages(String query) {
    setState(() {
      _filteredLanguages = defaultWorldLanguages.where((lang) {
        return lang.name.toLowerCase().contains(query.toLowerCase()) ||
            lang.nativeName.toLowerCase().contains(query.toLowerCase()) ||
            lang.code.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius ??
            const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey.shade100,
                  foregroundColor: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: _filterLanguages,
            decoration: InputDecoration(
              hintText: widget.searchHint,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFF8FAFC),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: _filteredLanguages.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final lang = _filteredLanguages[index];
                final isSelected = lang.code == _selectedLanguage?.code;

                return InkWell(
                  onTap: () {
                    setState(() => _selectedLanguage = lang);
                    Navigator.pop(context, lang);
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? widget.primaryColor.withValues(alpha: 0.1)
                          : const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected
                            ? widget.primaryColor
                            : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          _getCountryFlagEmoji(lang.countryCode),
                          style: const TextStyle(fontSize: 22),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lang.nativeName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                color: isSelected
                                    ? widget.primaryColor
                                    : Colors.black.withValues(alpha: 0.8),
                              ),
                            ),
                            Text(
                              lang.name,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        if (isSelected)
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: widget.primaryColor,
                            child: const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getCountryFlagEmoji(String countryCode) {
    final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }
}