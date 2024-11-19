
import 'api_result.dart';

Future<ApiResult<T>> executeApi<T>({required Future Function() apiCall}) async {
  try {
    var result = await apiCall.call();
    return Success(data: result);
  }
  catch (e) {
    return Failures(exception: e as Exception);
  }
}
