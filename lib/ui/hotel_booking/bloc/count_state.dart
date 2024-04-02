part of 'count_bloc.dart';

class CountState {
  int count;
  int count2;

  CountState({this.count = 1, this.count2 = 1});

  CountState copyWith({int? count, int? count2}) {
    return CountState(
      count: count ?? this.count,
      count2: count2 ?? this.count2,
    );
  }
}