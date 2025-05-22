import 'dart:convert';
import 'dart:developer';

import 'package:azkar/features/azkar/model/azkar_repo_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  final AzkarRepoInterface azkarRepo;
  AzkarCubit(this.azkarRepo) : super(AzkarInitial());
  static AzkarCubit get(context) => BlocProvider.of(context);

  Map<String, dynamic> azkar = {};

  Future<void> getAzkarElsabah({required bool isMorning}) async {
    azkar.clear();
    emit(LoadingGetAzkar());
   return isMorning?
     await azkarRepo
        .getAzkarElsabah()
        .then((value) {
          azkar = jsonDecode(value);
          emit(SuccessfullyGetAzkar());
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetAzkar(error.toString()));
        }): await azkarRepo
        .getAzkarElmasaa()
        .then((value) {
          azkar = jsonDecode(value);
          emit(SuccessfullyGetAzkar());
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetAzkar(error.toString()));
        });
  }
}
