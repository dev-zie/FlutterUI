extension BoolLogicExtensions on bool {
  bool get not => !this;

  bool and(bool other) => this && other;

  bool or(bool other) => this || other;

  T choose<T>(T whenTrue, T whenFalse) => this ? whenTrue : whenFalse;
}
