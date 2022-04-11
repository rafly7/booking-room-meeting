extension MyCustomIterate<T> on List<T> {
  Iterable<E> mapIndexed<E>(E Function(int index, T item) map) sync* {
    for (int index = 0; index < length; index++) {
      yield map(index, this[index]);
    }
  }
}
