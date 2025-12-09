// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(surveyRepository)
const surveyRepositoryProvider = SurveyRepositoryProvider._();

final class SurveyRepositoryProvider
    extends
        $FunctionalProvider<
          SurveyRepository,
          SurveyRepository,
          SurveyRepository
        >
    with $Provider<SurveyRepository> {
  const SurveyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'surveyRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$surveyRepositoryHash();

  @$internal
  @override
  $ProviderElement<SurveyRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SurveyRepository create(Ref ref) {
    return surveyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SurveyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SurveyRepository>(value),
    );
  }
}

String _$surveyRepositoryHash() => r'7bcb393844465ff0ae5bc1b54a8f182cf53058ca';
