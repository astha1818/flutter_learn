import '../../../bloc/bloc.dart';
import '../view_model/counter_model.dart';

class CounterBloc extends Bloc<CounterModel> {
  @override
  CounterModel initDefaultValue() {
    return CounterModel(0);
  }

  updateCounter() {
    state.counter++;
    emit(state);
  }
}
