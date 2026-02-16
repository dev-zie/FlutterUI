extension PalindromeExtension on String {
  bool get isPalindrome {
    final cleaned = replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    if (cleaned.isEmpty) return false;
    return cleaned == cleaned.split('').reversed.join();
  }
}