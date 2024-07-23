String convertHindiToArabic(String input) {
  final Map<String, String> hindiArabicToEnglish = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '۳': '3',
    '٤': '4',
    '۵': '5',
    '٦': '6',
    '۷': '7',
    '٨': '8',
    '٩': '9',
  };

  StringBuffer buffer = StringBuffer();

  for (int i = 0; i < input.length; i++) {
    String character = input[i];
    buffer.write(hindiArabicToEnglish[character] ?? character);
  }

  return buffer.toString();
}

String replaceArabicNumbers(String text) {
  // Define a mapping of Arabic/Hindi numerals to English numerals
  final Map<String, String> numeralMap = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '۵': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
  };

  // Replace each Arabic numeral with the corresponding English numeral
  String result = '';
  for (int i = 0; i < text.length; i++) {
    String char = text[i];
    result += numeralMap[char] ??
        char; // Use the mapped numeral or the original char if not found
  }

  return result;
}
