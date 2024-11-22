// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../src/data/api/api_services.dart' as _i687;
import '../src/data/api/network_factory.dart' as _i13;
import '../src/data/data_sources/offline_data_source/offline_data_source.dart'
    as _i136;
import '../src/data/data_sources/offline_data_source/offline_data_source_impl.dart'
    as _i649;
import '../src/data/data_sources/online_data_source/online_data_source.dart'
    as _i787;
import '../src/data/data_sources/online_data_source/online_data_source_impl.dart'
    as _i824;
import '../src/data/repositories/auth_repo_impl.dart' as _i566;
import '../src/data/repositories/auth_repo_impl/sign_in_repo_impl.dart'
    as _i940;
import '../src/domain/repositories/auth_repo.dart' as _i862;
import '../src/domain/repositories/auth_repo/sign_in_repo.dart' as _i209;
import '../src/domain/use_case/signup_user_use_case.dart' as _i444;
import '../src/domain/use_cases/auth_use_cases/sign_in_use_case.dart' as _i207;
import '../src/presentation/auth/signup/manager/signup_viewmodel.dart'
    as _i1070;
import '../src/presentation/managers/product_details/product_details_view_model.dart'
    as _i196;
import '../src/presentation/managers/sign_in/sign_in_view_model.dart' as _i558;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioProvider = _$DioProvider();
    gh.factory<_i196.ProductDetailsViewModel>(
        () => _i196.ProductDetailsViewModel());
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.factory<_i136.SignInOfflineDataSource>(
        () => _i649.SignInOfflineDataSourceImpl());
    gh.singleton<_i687.ApiServices>(() => _i687.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i787.SignInOnlineDataSource>(
        () => _i824.SignInOnlineDataSourceImpl(gh<_i687.ApiServices>()));
    gh.factory<_i862.AuthRepository>(() => _i566.AuthRepositoryImpl(
          gh<_i136.SignInOfflineDataSource>(),
          gh<_i787.SignInOnlineDataSource>(),
        ));
    gh.factory<_i209.SignInRepo>(() => _i940.SignInRepositoryImpl(
          gh<_i136.SignInOfflineDataSource>(),
          gh<_i787.SignInOnlineDataSource>(),
        ));
    gh.factory<_i444.SignupUserUseCase>(
        () => _i444.SignupUserUseCase(gh<_i862.AuthRepository>()));
    gh.factory<_i1070.SignUpViewModel>(
        () => _i1070.SignUpViewModel(gh<_i444.SignupUserUseCase>()));
    gh.factory<_i207.SignInUseCase>(
        () => _i207.SignInUseCase(gh<_i209.SignInRepo>()));
    gh.factory<_i558.SignInViewModel>(
        () => _i558.SignInViewModel(gh<_i207.SignInUseCase>()));
    return this;
  }
}

class _$DioProvider extends _i13.DioProvider {}
