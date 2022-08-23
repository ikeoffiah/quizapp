import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/controller/question_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz/controller/screens/quiz/components/progressbar.dart';
import 'package:quiz/controller/screens/quiz/components/question_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return Stack(
      children: [
        SvgPicture.asset(
          "assets/icons/bg.svg",
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
        SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: ProgressBar(),
            ),
            SizedBox(height: kDefaultPadding),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Obx(() => Text.rich(
                    TextSpan(
                        text:
                            "Question ${_questionController.questionNumber.value}",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: kSecondaryColor),
                        children: [
                          TextSpan(
                            text: "/${_questionController.questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: kSecondaryColor),
                          )
                        ]),
                  )),
            ),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Expanded(
                child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _questionController.pageController,
              onPageChanged: _questionController.updateTheQnNum,
              itemCount: _questionController.questions.length,
              itemBuilder: (context, index) =>
                  QuestionCard(question: _questionController.questions[index]),
            ))
          ],
        ))
      ],
    );
  }
}
