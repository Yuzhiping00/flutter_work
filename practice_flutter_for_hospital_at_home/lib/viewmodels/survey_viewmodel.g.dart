// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SurveyViewModel)
const surveyViewModelProvider = SurveyViewModelFamily._();

final class SurveyViewModelProvider
    extends $NotifierProvider<SurveyViewModel, SurveyState> {
  const SurveyViewModelProvider._({
    required SurveyViewModelFamily super.from,
    required SurveyDefinition super.argument,
  }) : super(
         retry: null,
         name: r'surveyViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$surveyViewModelHash();

  @override
  String toString() {
    return r'surveyViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SurveyViewModel create() => SurveyViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SurveyState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SurveyState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SurveyViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$surveyViewModelHash() => r'c2ce369bcc8a85a8bd7603fb208c4071bb0529be';

final class SurveyViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          SurveyViewModel,
          SurveyState,
          SurveyState,
          SurveyState,
          SurveyDefinition
        > {
  const SurveyViewModelFamily._()
    : super(
        retry: null,
        name: r'surveyViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SurveyViewModelProvider call(SurveyDefinition survey) =>
      SurveyViewModelProvider._(argument: survey, from: this);

  @override
  String toString() => r'surveyViewModelProvider';
}

abstract class _$SurveyViewModel extends $Notifier<SurveyState> {
  late final _$args = ref.$arg as SurveyDefinition;
  SurveyDefinition get survey => _$args;

  SurveyState build(SurveyDefinition survey);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<SurveyState, SurveyState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SurveyState, SurveyState>,
              SurveyState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
