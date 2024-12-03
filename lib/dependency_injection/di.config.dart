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
import '../src/data/data_sources/online_data_source/auth_datasource/online_data_source.dart'
    as _i557;
import '../src/data/data_sources/online_data_source/auth_datasource/online_data_source_impl.dart'
    as _i808;
import '../src/data/data_sources/online_data_source/catigories_online_data_source/categories_online_data_source_impl.dart'
    as _i98;
import '../src/data/data_sources/online_data_source/catigories_online_data_source/catigories_data_source.dart'
    as _i838;
import '../src/data/data_sources/online_data_source/home_online_datasource.dart'
    as _i902;
import '../src/data/data_sources/online_data_source/home_online_datasource_impl.dart'
    as _i1054;
import '../src/data/data_sources/online_data_source/occasion_online_data_source/OccasionOnlineDataSource.dart'
    as _i241;
import '../src/data/data_sources/online_data_source/occasion_online_data_source/OccasionOnlineDataSourceImpl.dart'
    as _i491;
import '../src/data/data_sources/online_data_source/product_data_source/product_online_data_source.dart'
    as _i866;
import '../src/data/data_sources/online_data_source/product_data_source/product_online_data_source_impl.dart'
    as _i352;
import '../src/data/repositories/auth_repo_impl/auth_repo_impl.dart' as _i531;
import '../src/data/repositories/categories_repo/categories_repo_impl.dart'
    as _i545;
import '../src/data/repositories/home_repository_impl.dart' as _i283;
import '../src/data/repositories/occasion_repo_impl/OccasionRepoImpl.dart'
    as _i475;
import '../src/data/repositories/product_repo_impl/product_repo_impl.dart'
    as _i974;
import '../src/domain/repositories/auth_repo.dart' as _i862;
import '../src/domain/repositories/categories_repo/categories_repo.dart'
    as _i139;
import '../src/domain/repositories/home_repository.dart' as _i781;
import '../src/domain/repositories/occasion_repo/OccasionRepo.dart' as _i492;
import '../src/domain/repositories/product_repo/product_repo.dart' as _i170;
import '../src/domain/use_cases/auth_use_cases/sign_in_use_case.dart' as _i207;
import '../src/domain/use_cases/auth_use_cases/signup_user_use_case.dart'
    as _i625;
import '../src/domain/use_cases/category_use_case.dart' as _i551;
import '../src/domain/use_cases/home_usecase.dart' as _i729;
import '../src/domain/use_cases/occasions_use_case.dart' as _i845;
import '../src/domain/use_cases/product_use_cases/get_product_use_case.dart'
    as _i902;
import '../src/domain/use_cases/product_use_cases/product_by_id_use_case.dart'
    as _i1042;
import '../src/domain/use_cases/profile_usecase/profile_usecase.dart' as _i346;
import '../src/domain/use_cases/reset_password_use_case.dart' as _i448;
import '../src/presentation/auth/signup/manager/signup_viewmodel.dart'
    as _i1070;
import '../src/presentation/managers/base_screen/base_screen_viewmodel.dart'
    as _i450;
import '../src/presentation/managers/categories/categories_view_model.dart'
    as _i822;
import '../src/presentation/managers/home/home_viewmodel.dart' as _i363;
import '../src/presentation/managers/occasion/occasions_view_model.dart'
    as _i1022;
import '../src/presentation/managers/product/product_cubit.dart' as _i699;
import '../src/presentation/managers/product_details/product_details_view_model.dart'
    as _i196;
import '../src/presentation/managers/profile/edit_profile_viewmodel/edit_profile_viewmodel.dart'
    as _i1044;
import '../src/presentation/managers/profile/profile_viewmodel/profile_screen_viewmodel.dart'
    as _i3;
import '../src/presentation/managers/reset_password/reset_password_view_model.dart'
    as _i545;
import '../src/presentation/managers/sign_in/sign_in_view_model.dart' as _i558;
import '../src/presentation/managers/splash/splash_view_model.dart' as _i992;

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
    gh.factory<_i450.BaseScreenViewmodel>(() => _i450.BaseScreenViewmodel());
    gh.factory<_i992.SplashViewModel>(() => _i992.SplashViewModel());
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.factory<_i136.AuthOfflineDataSource>(
        () => _i649.AuthOfflineDataSourceImpl());
    gh.singleton<_i687.ApiServices>(() => _i687.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i838.CategoriesOnlineDataSource>(
        () => _i98.CategoriesOnlineDataSourceImpl(gh<_i687.ApiServices>()));
    gh.factory<_i139.CategoriesRepo>(
        () => _i545.CategoriesRepoImpl(gh<_i838.CategoriesOnlineDataSource>()));
    gh.factory<_i551.CategoryUseCase>(
        () => _i551.CategoryUseCase(gh<_i139.CategoriesRepo>()));
    gh.factory<_i241.OccasionOnlineDataSource>(
        () => _i491.OccasionOnlineDataSourceImpl(gh<_i687.ApiServices>()));
    gh.factory<_i557.AuthOnlineDataSource>(
        () => _i808.AuthOnlineDataSourceImpl(gh<_i687.ApiServices>()));
    gh.factory<_i866.ProductOnlineDataSource>(
        () => _i352.ProductOnlineDataSourceImpl(gh<_i687.ApiServices>()));
    gh.factory<_i170.ProductRepo>(
        () => _i974.ProductRepoImpl(gh<_i866.ProductOnlineDataSource>()));
    gh.factory<_i902.GetProductUseCase>(
        () => _i902.GetProductUseCase(gh<_i170.ProductRepo>()));
    gh.factory<_i1042.ProductByIdUseCase>(
        () => _i1042.ProductByIdUseCase(gh<_i170.ProductRepo>()));
    gh.factory<_i902.HomeOnlineDataSource>(
        () => _i1054.HomeOnlineDataSourceImpl(gh<_i687.ApiServices>()));
    gh.factory<_i862.AuthRepository>(() => _i531.AuthRepositoryImpl(
          gh<_i136.AuthOfflineDataSource>(),
          gh<_i557.AuthOnlineDataSource>(),
        ));
    gh.factory<_i699.ProductCubit>(
        () => _i699.ProductCubit(gh<_i902.GetProductUseCase>()));
    gh.factory<_i492.OccasionRepo>(
        () => _i475.OccasionsRepoImpl(gh<_i241.OccasionOnlineDataSource>()));
    gh.factory<_i822.CategoriesViewModel>(
        () => _i822.CategoriesViewModel(gh<_i551.CategoryUseCase>()));
    gh.factory<_i207.SignInUseCase>(
        () => _i207.SignInUseCase(gh<_i862.AuthRepository>()));
    gh.factory<_i346.ProfileUseCase>(
        () => _i346.ProfileUseCase(gh<_i862.AuthRepository>()));
    gh.factory<_i625.SignupUserUseCase>(
        () => _i625.SignupUserUseCase(gh<_i862.AuthRepository>()));
    gh.factory<_i781.HomeRepository>(() => _i283.HomeRepositoryImpl(
        homeDataSource: gh<_i902.HomeOnlineDataSource>()));
    gh.factory<_i196.ProductDetailsViewModel>(
        () => _i196.ProductDetailsViewModel(gh<_i1042.ProductByIdUseCase>()));
    gh.factory<_i1044.EditProfileViewModel>(
        () => _i1044.EditProfileViewModel(gh<_i346.ProfileUseCase>()));
    gh.factory<_i3.ProfileScreenViewModel>(
        () => _i3.ProfileScreenViewModel(gh<_i346.ProfileUseCase>()));
    gh.factory<_i448.ResetPasswordUseCase>(
        () => _i448.ResetPasswordUseCase(gh<_i862.AuthRepository>()));
    gh.factory<_i845.OccasionUseCase>(
        () => _i845.OccasionUseCase(gh<_i492.OccasionRepo>()));
    gh.factory<_i729.HomeUseCase>(
        () => _i729.HomeUseCase(gh<_i781.HomeRepository>()));
    gh.factory<_i363.HomeViewModel>(
        () => _i363.HomeViewModel(gh<_i729.HomeUseCase>()));
    gh.factory<_i1070.SignUpViewModel>(
        () => _i1070.SignUpViewModel(gh<_i625.SignupUserUseCase>()));
    gh.factory<_i558.SignInViewModel>(
        () => _i558.SignInViewModel(gh<_i207.SignInUseCase>()));
    gh.factory<_i545.ResetPasswordViewModel>(
        () => _i545.ResetPasswordViewModel(gh<_i448.ResetPasswordUseCase>()));
    gh.factory<_i1022.OccasionViewModel>(
        () => _i1022.OccasionViewModel(gh<_i845.OccasionUseCase>()));
    return this;
  }
}

class _$DioProvider extends _i13.DioProvider {}
