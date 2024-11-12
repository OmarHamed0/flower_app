import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'core/apis_baseurl.dart';
part 'api_services.g.dart';
@injectable
@RestApi(baseUrl: ApisBaseurl.authBaseUrl)
abstract class ApiServices{
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

}