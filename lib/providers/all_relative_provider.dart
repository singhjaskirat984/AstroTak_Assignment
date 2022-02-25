import 'package:astrotak_assignment/services/all_relatives_service.dart';
import 'package:flutter/cupertino.dart';

import '../models/all_relatives_model.dart';
import '../utilities/loading_enum.dart';

class AllRelativeProvider with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  AllRelativesModel? allRelativesModel;

  Future<void> getAllRelativesData() async {
    loadingStatus = LoadingStatus.searching;
    try{
      allRelativesModel = await AllRelativesService().fetchAllRelatives();
      loadingStatus = LoadingStatus.completed;
      notifyListeners();
    }catch(e){
      print("exception $e");
      loadingStatus = LoadingStatus.empty;
      notifyListeners();
    }
  }

}