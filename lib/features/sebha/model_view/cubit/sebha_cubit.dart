import 'dart:developer';

import 'package:azkar/features/sebha/model/sebha_repo_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  final SebhaRepoInterface _sebhaRepo;
  SebhaCubit(this._sebhaRepo) : super(SebhaInitial());
  static SebhaCubit get(context) => BlocProvider.of(context);
  int zekr1counter = 0;
  int zekr2counter = 0;
  int zekr3counter = 0;

  Future addCounter(int counter, String boxName) async {
    emit(LoadingAddCounterState());
    return _sebhaRepo
        .addCounter(key: "count", value: counter, boxName: boxName)
        .then((value) {
          emit(SuccessfullyAddCounterState());
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorAddCounterState(error: error.toString()));
        });
  }

  Future getCounter({required String boxName}) async {
    emit(LoadingGetCounterState());
    return _sebhaRepo
        .getCounter(key: "count", boxName: boxName)
        .then((value) {
          if (boxName == "zekr1") {
            zekr1counter = value ?? 0;
          } else if (boxName == "zekr2") {
            zekr2counter = value ?? 0;
          } else if (boxName == "zekr3") {
            zekr3counter = value ?? 0;
          }
          emit(SuccessfullyGetCounterState());
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetCounterState(error: error.toString()));
        });
  }

  Future resetCounter({required String boxName}) async {
    emit(LoadingResetCounterState());
    return _sebhaRepo
        .resetCounter(key: "count", boxName: boxName)
        .then((value) {
          emit(SuccessfullyResetCounterState());
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorResetCounterState(error: error.toString()));
        });
  }
}
