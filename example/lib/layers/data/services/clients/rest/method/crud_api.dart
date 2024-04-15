abstract class CrudApi<T> {
  Future<T> create(String path, dynamic body);

  Future<T> read(String path);

  Future<List<T>> reads(String path);

  Future<T> update(String path, dynamic body);

  Future<T> delete(String path);
}
