abstract interface class Finds<R, P> {
  Future<List<R>> call(P? path);
}

abstract class Find<R, P> {
  Future<R> call(P? path);
}

abstract class ReadOnly<T> {
  Future<T> read(String path);
  Future<List<T>> reads(String path);
}
