import 'package:flutter/material.dart';
import 'package:novalume_app/models/appliance.dart';

class ApplianceProvider with ChangeNotifier {
  List<Appliance> _applianceList = [];

  void addAppliance(Appliance appliance) {
    _applianceList.add(appliance);
    notifyListeners();
  }

  void addApplianceWithParameters(String name, double powerKwh) {
    addAppliance(Appliance(name: name, powerKwh: powerKwh));
  }

  void removeAppliance(String applianceId) {
    _applianceList.removeWhere(
      (currentAppliance) => currentAppliance.id == applianceId,
    );
    notifyListeners();
  }

  void loadAppliances(List<Appliance> applianceList) {
    _applianceList = applianceList;
    notifyListeners();
  }

  void resetApplieances() {
    _applianceList.clear();
    notifyListeners();
  }

  List<Appliance> get topAppliances {
    final int n = 5;
    final List<Appliance> sortedAppliances = [..._applianceList]
      ..sort((a, b) => a.powerKwh.compareTo(b.powerKwh));
    if (sortedAppliances.length <= n) return sortedAppliances;
    return sortedAppliances.getRange(0, n).toList();
  }
}
