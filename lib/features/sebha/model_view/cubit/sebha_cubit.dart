import 'dart:developer';

import 'package:azkar/features/sebha/model/sebha_repo_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  final SebhaRepoInterface _sebhaRepo;
  SebhaCubit(this._sebhaRepo) : super(SebhaInitial());
  static SebhaCubit get(context) => BlocProvider.of(context);
  int zekr1counterDB = 0;
  int zekr1counterLocal = 0;
  int zekr2counterDB = 0;
  int zekr2counterLocal = 0;
  int zekr3counterDB = 0;
  int zekr3counterLocal = 0;

  int counter = 1;
  void changeIndex(int index) {
    counter = index;
    emit(ChangeIndexState());
  }

  Future addCounterOnDataBase(int counter, String boxName) async {
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
            zekr1counterDB = value ?? 0;
            // log("zekr1counterDB: $zekr1counterDB");
          } else if (boxName == "zekr2") {
            zekr2counterDB = value ?? 0;
            // log("zekr2counterDB: $zekr2counterDB");
          } else if (boxName == "zekr3") {
            zekr3counterDB = value ?? 0;
            // log("zekr3counterDB: $zekr3counterDB");
          }
          emit(SuccessfullyGetCounterState());
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetCounterState(error: error.toString()));
        });
  }

  void resetCounter() {
    zekr1counterLocal = 0;
    zekr2counterLocal = 0;
    zekr3counterLocal = 0;
    emit(ChangeIndexState());
  }

  Future clearDB({required String boxName}) async {
    emit(LoadingResetCounterState());
    return _sebhaRepo
        .resetCounter(key: "count", boxName: boxName)
        .then((value) {
          zekr1counterLocal = 0;
          getCounter(boxName: boxName);
          emit(SuccessfullyResetCounterState());
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorResetCounterState(error: error.toString()));
        });
  }
}
