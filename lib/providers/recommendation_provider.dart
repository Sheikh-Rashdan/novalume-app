import 'package:flutter/material.dart';
import 'package:novalume_app/models/recommendation.dart';

class RecommendationProvider with ChangeNotifier {
  List<Recommendation> _recommendationList = [];

  void addRecommendation(Recommendation recommendation) {
    _recommendationList.add(recommendation);
    notifyListeners();
  }

  void addRecommendationWithParameters({String? id, required String text}) {
    addRecommendation(Recommendation(id: id, text: text));
  }

  void removeRecommendation(String recommendationId) {
    _recommendationList.removeWhere(
      (currentRecommendation) => currentRecommendation.id == recommendationId,
    );
    notifyListeners();
  }

  void resetRecommendations() {
    _recommendationList.clear();
    notifyListeners();
  }
}
