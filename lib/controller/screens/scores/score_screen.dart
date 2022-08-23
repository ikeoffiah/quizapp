import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/controller/question_controller.dart';
import 'package:get/get.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        SvgPicture.asset(
          "assets/icons/bg.svg",
          fit: BoxFit.fill,
        ),
        Column(
          children: [
            Spacer(
              flex: 3,
            ),
            Text(
              "Score",
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: kSecondaryColor),
            ),
            Spacer(),
            Text(
              "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: kSecondaryColor),
            ),
            Spacer(
              flex: 3,
            )
          ],
        )
      ]),
    );
  }
}
