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
import '../src/data/repositories/auth_repo_impl/forget_password_repo_impl.dart'
    as _i580;
import '../src/data/repositories/auth_repo_impl/sign_in_repo_impl.dart'
    as _i940;
import '../src/domain/repositories/auth_repo.dart' as _i862;
import '../src/domain/repositories/auth_repo/forget_password_repo.dart'
    as _i680;
import '../src/domain/repositories/auth_repo/sign_in_repo.dart' as _i209;
import '../src/domain/use_case/signup_user_use_case.dart' as _i444;
import '../src/domain/use_cases/auth_use_cases/forget_password_use_case.dart'
    as _i745;
import '../src/domain/use_cases/auth_use_cases/otp_verify_use_case.dart'
    as _i1046;
import '../src/domain/use_cases/auth_use_cases/reset_password_use_case.dart'
    as _i180;
import '../src/domain/use_cases/auth_use_cases/sign_in_use_case.dart' as _i207;
import '../src/presentation/auth/signup/manager/signup_viewmodel.dart'
    as _i1070;
import '../src/presentation/managers/forget_password/forget_password_view_model.dart'
    as _i1012;
import '../src/presentation/managers/otp_verify/otp_verify_view_model.dart'
    as _i673;
import '../src/presentation/managers/reset_password/reset_password_view_model.dart'
    as _i545;
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
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.factory<_i136.SignInOfflineDataSource>(
        () => _i649.SignInOfflineDataSourceImpl());
    gh.singleton<_i687.ApiServices>(() => _i687.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i787.SignInOnlineDataSource>(
        () => _i824.SignInOnlineDataSourceImpl(gh<_i687.ApiServices>()));
    gh.factory<_i680.ForgetPasswordRepository>(() =>
        _i580.ForgetPasswordRepositoryImpl(gh<_i787.SignInOnlineDataSource>()));
    gh.factory<_i862.AuthRepository>(
        () => _i566.AuthRepositoryImpl(gh<_i787.SignInOnlineDataSource>()));
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
    gh.factory<_i745.ForgetPasswordUseCase>(() =>
        _i745.ForgetPasswordUseCase(gh<_i680.ForgetPasswordRepository>()));
    gh.factory<_i180.ResetPasswordUseCase>(
        () => _i180.ResetPasswordUseCase(gh<_i680.ForgetPasswordRepository>()));
    gh.factory<_i1046.OtpVerifyUseCase>(
        () => _i1046.OtpVerifyUseCase(gh<_i680.ForgetPasswordRepository>()));
    gh.factory<_i545.ResetPasswordViewModel>(
        () => _i545.ResetPasswordViewModel(gh<_i180.ResetPasswordUseCase>()));
    gh.factory<_i558.SignInViewModel>(
        () => _i558.SignInViewModel(gh<_i207.SignInUseCase>()));
    gh.factory<_i673.OtpVerifyViewModel>(
        () => _i673.OtpVerifyViewModel(gh<_i1046.OtpVerifyUseCase>()));
    gh.factory<_i1012.ForgetPasswordViewModel>(() =>
        _i1012.ForgetPasswordViewModel(gh<_i745.ForgetPasswordUseCase>()));
    return this;
  }
}

class _$DioProvider extends _i13.DioProvider {}
