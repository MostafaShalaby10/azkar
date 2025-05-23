import 'dart:developer';

import 'package:azkar/features/prayers/model/repos/prayer_repo_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  final PrayerRepoInterface _prayerRepoInterface;
  PrayerCubit(this._prayerRepoInterface) : super(PrayerInitial());

  static PrayerCubit get(context) => BlocProvider.of(context);

  Map<String, dynamic> prayerTimes = {};
  Future getTimes() async {
    prayerTimes.clear();
    emit(LoadingGetPrayerTime());
    _prayerRepoInterface
        .getPrayerTimes()
        .then((value) {
          prayerTimes = value.data["data"]["timings"];
          emit(SuccessfullyGetPrayerTime());
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetPrayerTime(error: error.toString()));
        });
  }
}
