import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/internet_connectivity/internet_event.dart';
import 'package:bloc_state_management/bloc/internet_connectivity/internet_state.dart';
import 'package:connectivity/connectivity.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState> {

  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {

    on<InternetLossEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result){

      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){

        add(InternetGainedEvent());
      }
      else{
        add(InternetLossEvent());

      }
    });

  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }

}