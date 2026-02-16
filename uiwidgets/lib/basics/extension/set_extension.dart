extension UniqueSetExtension<T> on List<T> {
  Set<T> toUniqueSet() {
    return toSet();
  }
}
