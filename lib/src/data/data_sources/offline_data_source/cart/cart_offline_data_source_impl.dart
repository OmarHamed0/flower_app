import 'package:injectable/injectable.dart';

import '../../../../../config/helpers/shared_pre_keys.dart';
import '../../../../../config/helpers/shared_pref_helper.dart';
import 'cart_offline_data_source.dart';
@Injectable(as: CartOfflineDataSource)
class CartOfflineDataSourceImpl implements CartOfflineDataSource{
  @override
  Future<String> getToken()async {
    var token=await SharedPrefHelper.getSecureString(SharedPrefKeys.userToken) ?? "";
   return "Bearer $token";
  }
}