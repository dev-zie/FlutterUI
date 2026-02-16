extension DateDifferenceExtension on DateTime {
  int daysBetween(DateTime other) {
    final start = DateTime(year, month, day);
    final end = DateTime(other.year, other.month, other.day);
    return (end.difference(start).inDays).abs();
  }
}
