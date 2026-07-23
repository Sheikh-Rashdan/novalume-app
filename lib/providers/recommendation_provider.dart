import 'dart:math';

import 'package:flutter/material.dart';
import 'package:novalume_app/models/recommendation.dart';

class RecommendationProvider with ChangeNotifier {
  List<Recommendation> _recommendationList = [];

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

  final List<String> _fakeRecommendations = [
    "Turn off the water pump",
    "Close the fridge door properly",
    "Use ceiling fans instead of AC",
    "Switch off balcony lights",
    "Unplug idle chargers",
    "Turn off the TV when not in use",
    "Run the washing machine with full loads",
    "Use natural light during the day",
    "Switch to LED lighting",
    "Keep the refrigerator at optimal temperature",
    "Turn off kitchen exhaust after cooking",
    "Reduce AC cooling by 1°C",
    "Turn off decorative lighting",
    "Keep windows closed while AC is running",
    "Use sleep mode on your AC",
    "Avoid leaving devices on standby",
    "Turn off bathroom lights",
    "Charge devices during off-peak hours",
    "Turn off the microwave display",
    "Use the fan before switching on the AC",
    "Turn off the inverter when away",
    "Reduce screen brightness",
    "Switch off the Wi-Fi router at night",
    "Avoid overcharging your phone",
    "Use cold water for laundry",
    "Turn off outdoor lights at dawn",
    "Keep the freezer frost-free",
    "Turn off the iron immediately after use",
    "Use pressure cookers for cooking",
    "Limit oven preheating time",
    "Turn off unused power strips",
    "Keep air filters clean",
    "Turn off room lights before leaving",
    "Lower water heater temperature",
    "Defrost frozen food naturally",
    "Keep curtains closed during hot afternoons",
    "Avoid opening the refrigerator frequently",
    "Turn off computer monitors when idle",
    "Switch appliances off at the socket",
    "Use eco mode on home appliances",
    "Turn off the dishwasher after the cycle",
    "Use task lighting instead of all room lights",
    "Keep doors closed in air-conditioned rooms",
    "Turn off speakers when not in use",
    "Reduce unnecessary appliance usage",
    "Schedule heavy appliances during daytime",
    "Air-dry clothes instead of using a dryer",
    "Turn off the coffee maker after use",
    "Limit hot water usage",
    "Turn off charging stations when empty",
  ];
  void testAddRandomRecommendation() {
    addRecommendationWithParameters(
      text: _fakeRecommendations[Random().nextInt(_fakeRecommendations.length)],
    );
  }
}
