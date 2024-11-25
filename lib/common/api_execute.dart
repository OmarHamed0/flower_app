
import 'package:flower_app/common/api_result.dart';

Future<ApiResult<T>> executeApi<T>({required Future<T> Function() apiCall}) async {
  try {
    var result = await apiCall.call();
    return Success<T>(data: result);
  } on Exception catch (e){
    return Failures(exception: e);
  }
}
