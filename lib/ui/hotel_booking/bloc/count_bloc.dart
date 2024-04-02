

import 'package:flutter_bloc/flutter_bloc.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(CountState()) {
    on<CounterIncrement>((event, emit) {
      emit(state.copyWith(count: state.count + 1));
    });
    on<CounterDecrement>((event, emit) {
      if(state.count == 1) {
        emit(state.copyWith(count: state.count = 1 ));
      } else {
        emit(state.copyWith(count: state.count - 1));
      }
    });

    on<CounterIncrement2>((event, emit) {
      emit(state.copyWith(count2: state.count2 + 1));
    });
    on<CounterDecrement2>((event, emit) {
      if(state.count2 == 1) {
        emit(state.copyWith(count2: state.count2 = 1 ));
      } else {
        emit(state.copyWith(count2: state.count2 - 1));
      }
    });
  }
}