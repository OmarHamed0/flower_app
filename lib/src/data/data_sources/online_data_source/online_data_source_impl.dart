import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/online_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OnlineDataSource)
class OnlineDataSourceImpl implements OnlineDataSource{
  ApiServices _apiServices;
  OnlineDataSourceImpl(this._apiServices);

}