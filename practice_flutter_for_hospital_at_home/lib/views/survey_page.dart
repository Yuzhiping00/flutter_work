import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/survey_definition.dart';
import '../viewmodels/survey_viewmodel.dart';
import 'survey_question_tile.dart';

class SurveyPage extends ConsumerStatefulWidget {
  final SurveyDefinition definition;
  const SurveyPage({super.key, required this.definition});
  @override
  ConsumerState<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends ConsumerState<SurveyPage> {
  final scrollController = ScrollController();
  late List<GlobalKey> keys;
  @override
  void initState() {
    super.initState();
    keys = List.generate(
      widget.definition.questions.length,
      (_) => GlobalKey(),
    );
  }

  void _scrollTo(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = keys[index].currentContext;
      if (ctx != null) {
        Scrollable.ensureVisible(
          ctx,
          duration: const Duration(milliseconds: 400),
          alignment: 0.15,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(surveyViewModelProvider(widget.definition));
    final vm = ref.read(surveyViewModelProvider(widget.definition).notifier);

    /// SAFELY handle scrolling after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final target = state.scrollToIndex;
      if (target != null) {
        _scrollTo(target);
        vm.clearScrollFlag(); // SAFE — runs after frame, not inside build
      }
    });
    return Scaffold(
      appBar: AppBar(title: Text(state.survey.title)),
      body: ListView(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        children: [
          for (int i = 0; i < state.survey.questions.length; i++)
            SurveyQuestionTile(
              key: keys[i],
              question: state.survey.questions[i],
              options: state.survey.options[i],
              selectedIndex: state.answers[i],
              showError: state.showErrors && state.answers[i] == null,
              onSelect: (answer) {
                vm.selectAnswer(i, answer);
              },
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => vm.validateAndScroll(),
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
