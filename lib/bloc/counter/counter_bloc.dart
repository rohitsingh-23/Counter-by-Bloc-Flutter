import 'package:bloc/bloc.dart';
import "../block_import.dart";
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CountIncrementEvent>((event, emit) {
      emit(IncrementState(state.counterValue + 1));
    });
    on<CountDecrementEvent>((event, emit) {
      emit(DecrementState(state.counterValue - 1));
    });
    on<CountResetEvent>((event, emit) {
      emit(ResetState(0));
    });
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
