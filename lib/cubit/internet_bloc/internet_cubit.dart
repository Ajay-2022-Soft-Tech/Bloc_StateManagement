import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';

enum InternetState{Initial , Lost , Gained}


class InternetCubit extends Cubit <InternetState>{

 Connectivity _connectivity = Connectivity();

  StreamSubscription? conntectivitySubscription;

  InternetCubit() : super (InternetState.Initial){


  conntectivitySubscription = _connectivity.onConnectivityChanged.listen((result){

    if (result == ConnectivityResult.wifi || result == ConnectivityResult.mobile){
      emit(InternetState.Gained);
  }
    else{
      emit(InternetState.Lost);

    }

  });


  }

  @override
  Future<void> close() {
    conntectivitySubscription?.cancel();
    return super.close();
  }
}