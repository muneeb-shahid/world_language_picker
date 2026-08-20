class Language {
  final String name;
  final String code;
  final String countryCode;
  final String nativeName;
  final bool isRtl;

  const Language({
    required this.name,
    required this.code,
    required this.countryCode,
    required this.nativeName,
    this.isRtl = false,
  });
}
