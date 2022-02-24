import 'package:astrotak_assignment/models/ask_question_model.dart';
import 'package:astrotak_assignment/services/ask_question_service.dart';
import 'package:astrotak_assignment/utilities/loading_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AskQuestionProvider with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  AskQuestionModel? askQuestionModel;
  List suggestionsList = [];
  double price = 0.0;

  void getQuestionData() async {
    loadingStatus = LoadingStatus.searching;
    try{
      askQuestionModel = await AskQuestionService().fetchQuestions();
      List<QuestionCategory>? questionCategoryList = askQuestionModel?.data;
      for(QuestionCategory category in questionCategoryList!){
        if(category.name == "Love"){
          suggestionsList = category.suggestions;
          notifyListeners();
          break;
        }
      }
      loadingStatus = LoadingStatus.completed;
    }catch(e){
      print("exception $e");
      loadingStatus = LoadingStatus.empty;
    }
    notifyListeners();
  }

  void getSuggestions(String selectedCategory) async {
    List<QuestionCategory>? questionCategoryList = askQuestionModel?.data;
    for(QuestionCategory category in questionCategoryList!){
      if(category.name == selectedCategory){
        suggestionsList = category.suggestions;
        print("suggestionsList $suggestionsList");
        if(suggestionsList.length >= 1){
          print("notifying listeners");
          price = category.price;
          loadingStatus = LoadingStatus.completed;
          notifyListeners();
        }else{
          loadingStatus = LoadingStatus.empty;
          notifyListeners();
        }
        break;
      }
    }
  }

}