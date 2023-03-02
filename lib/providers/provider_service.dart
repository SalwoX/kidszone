import 'package:flutter/material.dart';

enum ProviderServiceState {
  InitialState,
  LoadingState,
  LoadedState,
  ErrorState,
  RefleshState,
}

class ProviderService<T> with ChangeNotifier {
  ProviderServiceState? _state;

  ProviderService() {
    this._state = ProviderServiceState.InitialState;
  }

  ProviderServiceState get state => _state!;
  set state(ProviderServiceState value) {
    _state = value;
    notifyListeners();
  }
}
