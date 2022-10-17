import 'package:flutter_learn/bloc/bloc.dart';
import 'package:flutter_learn/modules/demo_ui/view_model/movie_type_model.dart';
import 'package:flutter_learn/utlis/helpers/global.dart';

class MovieBloc extends Bloc<MovieTypeModal> {
  @override
  MovieTypeModal initDefaultValue() {
    return MovieTypeModal(0);
  }

  updateIndex(int currentIndex) {
    printDebug('hello ${state.selectedIndex}');
    state.selectedIndex = currentIndex;
    emit(state);
  }
}
