import 'dart:math';

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

  void editAppliancePower(String applianceId, double newPowerKwh) {
    int index = _applianceList.indexWhere(
      (currentAppliance) => currentAppliance.id == applianceId,
    );
    _applianceList[index].powerKwh = newPowerKwh;
    notifyListeners();
  }

  void loadAppliances(List<Appliance> applianceList) {
    _applianceList = applianceList;
    notifyListeners();
  }

  void resetAppliances() {
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

  Future<void> testProviderForBubbleChart() async {
    await Future.delayed(Duration(seconds: 1));
    resetAppliances();
    List<String> applianceNames = ["A", "B", "C", "D", "E"];
    loadAppliances(
      List.generate(
        applianceNames.length,
        (index) => Appliance(
          name: applianceNames[index],
          powerKwh: Random().nextDouble(),
        ),
      ),
    );
    testProviderForBubbleChartEditPower();
  }

  Future<void> testProviderForBubbleChartEditPower() async {
    await Future.delayed(Duration(seconds: 3));
    for (Appliance currentAppliance in _applianceList) {
      editAppliancePower(currentAppliance.id, Random().nextDouble());
    }
    testProviderForBubbleChartEditPower();
  }
}
