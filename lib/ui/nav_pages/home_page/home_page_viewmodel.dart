import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/connectivity_service.dart';

class HomePageViewModel extends StreamViewModel {
  void nToPref() {
    NavigationService().navigateTo(Routes.preferenceView);
  }

  nToWorkspace() {
    // NavigationService().navigateTo(Routes.workspaceView);
  void nToWorkspace() {
    NavigationService().navigateTo(Routes.workspaceView);
  }

  navigateToDmUser() {
    locator<NavigationService>().navigateTo(Routes.dmUserView);
  }

  final connectivityService = locator<ConnectivityService>();

  bool connectionStatus = false;

  @override
  void onError(error) {
    log('Error: $error');
  }

  @override
  void onSubscribed() {}

  Stream<bool> checkConnectivity() async* {
    yield await connectivityService.checkConnection();
  }

  @override
  Stream get stream => checkConnectivity();

  bool get status {
    this.stream.listen((event) {
      connectionStatus = event;
      notifyListeners();
    });
    return connectionStatus;
  }

  void nToInfo() {
    NavigationService().navigateTo(Routes.channelInfoView);
  }
}