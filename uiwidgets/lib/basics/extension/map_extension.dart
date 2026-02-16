extension FamilyMapExtension on Map<String, List<String>> {
  void addMember(String surname, String name) {
    if (containsKey(surname)) {
      this[surname]!.add(name);
    } else {
      this[surname] = [name];
    }
  }

  String formattedList() {
    if (isEmpty) return 'No data';

    return entries
        .map((e) => '${e.key}: ${e.value.join(', ')}')
        .join('\n');
  }
}
