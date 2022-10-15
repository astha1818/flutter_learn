import 'package:flutter_learn/bloc/bloc.dart';
import 'package:flutter_learn/modules/tutorial/data/tutorial_list.dart';

import '../view_model/tutorial_model.dart';

class TutorialBloc extends Bloc<TutorialModal> {
  @override
  TutorialModal initDefaultValue() {
    return TutorialModal(0);
  }

  updateIndex(int currentIndex) {
    int length = TutorialList.list.length;
    int offset = currentIndex - 1000;
    int index = offset % length;
    state.index = index;
    emit(state);
  }
}
