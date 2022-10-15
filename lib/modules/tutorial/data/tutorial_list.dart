import '../../../res/images.dart';
import '../../../res/strings.dart';
import 'tutorial_data_model.dart';

class TutorialList {
  static final List<TutorialDataModal> list = [
    TutorialDataModal(
      AppStrings.tutorialTitle1,
      AppStrings.tutorialDescription,
      AppImages.tutorial1,
    ),
    TutorialDataModal(
      AppStrings.tutorialTitle2,
      AppStrings.tutorialDescription,
      AppImages.tutorial2,
    ),
    TutorialDataModal(
      AppStrings.tutorialTitle3,
      AppStrings.tutorialDescription,
      AppImages.tutorial3,
    ),
    TutorialDataModal(
      AppStrings.tutorialTitle4,
      AppStrings.tutorialDescription,
      AppImages.tutorial4,
    ),
  ];
}
