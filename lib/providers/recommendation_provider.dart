import 'package:flutter/material.dart';
import 'package:novalume_app/models/recommendation.dart';

class RecommendationProvider with ChangeNotifier {
  List<Recommendation> _recommendationList = [];

  RecommendationProvider() {
    addRecommendationWithParameters(text: "Turn off the geyser");
    addRecommendationWithParameters(text: "Switch AC to Eco Mode");
    addRecommendationWithParameters(text: "Dim bedroom lights at night time");
    addRecommendationWithParameters(text: "Turn off the geyser");
    addRecommendationWithParameters(text: "Switch AC to Eco Mode");
    addRecommendationWithParameters(text: "Dim bedroom lights at night time");
    addRecommendationWithParameters(text: "Turn off the geyser");
    addRecommendationWithParameters(text: "Switch AC to Eco Mode");
    addRecommendationWithParameters(text: "Dim bedroom lights at night time");
  }

  List<Recommendation> get recommendationList => _recommendationList;

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
