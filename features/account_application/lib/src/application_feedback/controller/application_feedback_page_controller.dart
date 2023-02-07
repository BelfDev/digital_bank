import 'package:flutter/material.dart';

import '../view/application_feedback_page.dart';

class ApplicationFeedbackPageController extends StatelessWidget {
  const ApplicationFeedbackPageController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApplicationFeedbackPage(
      onFloatingButtonPressed: () {},
      onCopyPressed: (code) {
        print('You code is $code');
      },
    );
  }
}
