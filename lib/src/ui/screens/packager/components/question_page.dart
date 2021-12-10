import 'package:flutter/material.dart';
import 'package:simtech/src/models/answer.dart';
import 'package:simtech/src/models/enums.dart';
import 'package:simtech/src/models/question.dart';
import 'package:simtech/src/ui/screens/packager/components/dropdown_field.dart';

typedef QuestionAnswered = void Function(Question question, Answer anser);

class QuestionPage extends StatelessWidget {
  const QuestionPage({
    Key? key,
    required this.material,
    required this.questions,
    required this.answers,
    required this.onQuestionAnswered,
  }) : super(key: key);

  final PMaterial? material;
  final List<Question> questions;
  final Map<int, Answer> answers;
  final QuestionAnswered onQuestionAnswered;

  bool _validate(Question question) {
    final requirement = question.requirement;
    if (requirement == null) return true;

    final answer = answers[requirement.question];
    if (answer == null) return false;

    return requirement.answers.contains(answer.id);
  }

  ValueChanged<Answer?>? _setAnswer(Question question) {
    return material != null && _validate(question)
        ? (answer) => onQuestionAnswered(question, answer!)
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final secondPageIndex = questions.length > 6 ? 4 : 3;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                _QuestionField(
                  material: material,
                  question: questions[0],
                  value: answers[questions[0].id],
                  onChanged: _setAnswer(questions[0]),
                ),
                const Spacer(),
                _QuestionField(
                  material: material,
                  question: questions[1],
                  value: answers[questions[1].id],
                  onChanged: _setAnswer(questions[1]),
                ),
                const Spacer(),
                _QuestionField(
                  material: material,
                  question: questions[2],
                  value: answers[questions[2].id],
                  onChanged: _setAnswer(questions[2]),
                ),
                const Spacer(),
                if (questions.length > 6)
                  _QuestionField(
                    material: material,
                    question: questions[3],
                    value: answers[questions[3].id],
                    onChanged: _setAnswer(questions[3]),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 50),
          Expanded(
            child: Column(
              children: [
                _QuestionField(
                  material: material,
                  question: questions[secondPageIndex],
                  value: answers[questions[secondPageIndex].id],
                  onChanged: _setAnswer(questions[secondPageIndex]),
                ),
                const Spacer(),
                _QuestionField(
                  material: material,
                  question: questions[secondPageIndex + 1],
                  value: answers[questions[secondPageIndex + 1].id],
                  onChanged: _setAnswer(questions[secondPageIndex + 1]),
                ),
                const Spacer(),
                _QuestionField(
                  material: material,
                  question: questions[secondPageIndex + 2],
                  value: answers[questions[secondPageIndex + 2].id],
                  onChanged: _setAnswer(questions[secondPageIndex + 2]),
                ),
                const Spacer(),
                if (questions.length > 6)
                  _QuestionField(
                    material: material,
                    question: questions[secondPageIndex + 3],
                    value: answers[questions[secondPageIndex + 3].id],
                    onChanged: _setAnswer(questions[secondPageIndex + 3]),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuestionField extends StatelessWidget {
  const _QuestionField({
    Key? key,
    required this.question,
    required this.value,
    required this.material,
    required this.onChanged,
  }) : super(key: key);

  final Question question;
  final Answer? value;
  final PMaterial? material;
  final ValueChanged<Answer?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownField<Answer>(
      value: value,
      onChanged: onChanged,
      hint: question.question,
      options: material == null ? [] : question.getFilteredAnswers(material!),
      optionToString: (answer) => answer.answer,
    );
  }
}
