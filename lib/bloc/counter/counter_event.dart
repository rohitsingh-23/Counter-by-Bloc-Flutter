part of 'counter_bloc.dart';

abstract class CounterEvent {}

class CountIncrementEvent extends CounterEvent {}

class CountDecrementEvent extends CounterEvent {}
class CountResetEvent extends CounterEvent {}
