import '../../../bloc/bloc.dart';
import '../../../modules/demo_ui/view_model/movie_type_model.dart';

class MovieBloc extends Bloc<MovieTypeModal> {
  @override
  MovieTypeModal initDefaultValue() {
    return MovieTypeModal(0);
  }

  updateIndex(int currentIndex) {
    state.selectedIndex = currentIndex;
    emit(state);
  }
}
