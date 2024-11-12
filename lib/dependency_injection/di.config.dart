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

import '../src/data/api/api_services.dart' as _i687;
import '../src/data/data_sources/offline_data_source/offline_data_source.dart'
    as _i136;
import '../src/data/data_sources/offline_data_source/offline_data_source_impl.dart'
    as _i649;
import '../src/data/data_sources/online_data_source/online_data_source.dart'
    as _i787;
import '../src/data/data_sources/online_data_source/online_data_source_impl.dart'
    as _i824;
import '../src/data/repositories/auth_repo_impl.dart' as _i566;
import '../src/domain/repositories/auth_repo.dart' as _i862;
import '../src/domain/use_cases/auth_use_cases.dart' as _i715;

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
    gh.factory<_i687.ApiServices>(() => _i687.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i136.OfflineDataSource>(() => _i649.OfflineDataSourceImpl());
    gh.factory<_i862.AuthRepository>(() => _i566.AuthRepositoryImpl());
    gh.factory<_i715.AuthUseCase>(
        () => _i715.AuthUseCase(gh<_i862.AuthRepository>()));
    gh.factory<_i787.OnlineDataSource>(
        () => _i824.OnlineDataSourceImpl(gh<_i687.ApiServices>()));
    return this;
  }
}
