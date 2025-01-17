import 'dart:async';

import 'package:admin_ecommerce_app/utils/helpers/network_manager/bloc/network_event.dart';
import 'package:admin_ecommerce_app/utils/helpers/network_manager/bloc/network_state.dart';
import 'package:admin_ecommerce_app/utils/popups/loaders.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final Connectivity _connectivity;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  NetworkBloc(this._connectivity) : super(const NetworkState([])) {
    on<CheckConnectivity>(_onCheckConnectivity);
    on<ConnectivityChanged>(_onConnectivityChanged);

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      add(ConnectivityChanged(result));
    });
  }

  Future<void> _onCheckConnectivity(
      CheckConnectivity event, Emitter<NetworkState> emit) async {
    try {
      final result = await _connectivity.checkConnectivity();
      emit(NetworkState(result));
    } on PlatformException {
      emit(const NetworkState([]));
    }
  }

  void _onConnectivityChanged(
      ConnectivityChanged event, Emitter<NetworkState> emit) {
    emit(NetworkState(event.connectionStatus));
    if (event.connectionStatus.contains(ConnectivityResult.none)) {
      TLoaders.customToast(message: 'No Internet Connection');
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
