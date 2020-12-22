// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'infrastructure/retail_banking/retail_banking.dart';
import 'infrastructure/vision/vision.dart';
import 'infrastructure/voice/voice.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingletonAsync<RetailBankingApiClient>(
      () => RetailBankingApiClient.getClient());
  gh.lazySingletonAsync<VisionApiClient>(() => VisionApiClient.getClient());
  gh.lazySingletonAsync<VoiceApiClient>(() => VoiceApiClient.getClient());
  return get;
}
