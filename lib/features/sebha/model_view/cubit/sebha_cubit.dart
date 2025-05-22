import 'dart:developer';

import 'package:azkar/features/sebha/model/sebha_repo_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  final SebhaRepoInterface _sebhaRepo;
  SebhaCubit(this._sebhaRepo) : super(SebhaInitial());
  static SebhaCubit get(context) => BlocProvider.of(context);
  int counter = 0;

  Future addCounter(int counter) async {
    emit(LoadingAddCounterState());
    return _sebhaRepo
        .addCounter(key: "count", value: counter)
        .then((value) {
          emit(SuccessfullyAddCounterState());
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorAddCounterState(error: error.toString()));
        });
  }

  Future getCounter() async {
    emit(LoadingGetCounterState());
    return _sebhaRepo
        .getCounter(key: "count")
        .then((value) {
          counter = value;
          log(counter.toString());
          emit(SuccessfullyGetCounterState());
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetCounterState(error: error.toString()));
        });
  }

  Future resetCounter() async {
    emit(LoadingResetCounterState());
    return _sebhaRepo
        .resetCounter(key: "count")
        .then((value) {
          counter = 0;
          emit(SuccessfullyResetCounterState());
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorResetCounterState(error: error.toString()));
        });
  }
}
