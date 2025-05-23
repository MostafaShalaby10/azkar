import 'package:azkar/features/azkar/model/azkar_repo_interface.dart';
import 'package:flutter/services.dart';

class AzkarRepoImp implements AzkarRepoInterface {
  @override
  Future getAzkarElsabah() async {
    return await rootBundle.loadString('assets/azkar/morning.json');
  }

  @override
  Future getAzkarElmasaa() async {
    return await rootBundle.loadString('assets/azkar/night.json');
  }
}
