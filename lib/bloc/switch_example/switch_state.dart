import 'package:equatable/equatable.dart';

class SwitchStates extends Equatable{


  bool isSwitch ;
  double slider;

  SwitchStates({
   this.isSwitch = false,
   this.slider = 1.0,
});

  SwitchStates copyWith({bool? isSwitch , double? slider }){
    return SwitchStates(

      // return by default is false if null
      isSwitch: isSwitch ?? this.isSwitch,
      slider: slider ?? this.slider,


    );
}

  @override
  List<Object?> get props => [isSwitch,slider];

}