import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/switch_example/switch_event.dart';
import 'package:bloc_state_management/bloc/switch_example/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates>{

  // Constructor
  SwitchBloc():super(SwitchStates()){

    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification events , Emitter<SwitchStates> emit){

    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
  void _slider(SliderEvent events , Emitter<SwitchStates> emit){

    emit(state.copyWith(slider: events.slider));
  }

}