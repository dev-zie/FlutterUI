extension UniqueListExtension<T> on List<T> {
  List<T> removeDuplicates() {
    return toSet().toList();
  }
}
