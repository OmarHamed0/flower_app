sealed class ApiResult<T> {
  void when(
      {required Null Function(T data) success,
      required Null Function(dynamic message) error}){}
}

class Success<T> extends ApiResult<T> {
  final T? data;

  Success({this.data});
}

class Failures<T> extends ApiResult<T> {
  final Exception exception;

  Failures({required this.exception});
}
