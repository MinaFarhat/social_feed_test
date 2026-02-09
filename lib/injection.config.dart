// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import 'Core/api/api_consumer.dart' as _i989;
import 'Core/api/dio_consumer.dart' as _i425;
import 'Core/api/logging_interceptor.dart' as _i777;
import 'Core/error/error_interceptor.dart' as _i731;
import 'Core/Network/network_info.dart' as _i1071;
import 'Core/third_party_injection.dart' as _i540;
import 'Core/utils/shared_preference_utils.dart' as _i131;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyInjection = _$ThirdPartyInjection();
    gh.singleton<_i777.LoggingInterceptor>(() => _i777.LoggingInterceptor());
    gh.singleton<_i731.ErrorInterceptor>(() => _i731.ErrorInterceptor());
    gh.singleton<_i361.Dio>(() => thirdPartyInjection.dio);
    gh.singleton<_i973.InternetConnectionChecker>(
      () => thirdPartyInjection.internetConnectionChecker,
    );
    gh.singleton<_i131.SharedPreferencesUtils>(
      () => thirdPartyInjection.sharedPreferencesUtils,
    );
    gh.singleton<_i989.ApiConsumer>(() => _i425.DioConsumer(gh<_i361.Dio>()));
    gh.lazySingleton<_i1071.NetworkInfo>(
      () => _i1071.NetworkInfoImpl(
        connectionChecker: gh<_i973.InternetConnectionChecker>(),
      ),
    );
    return this;
  }
}

class _$ThirdPartyInjection extends _i540.ThirdPartyInjection {}
