
import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable{

  SwitchEvents();

  @override
  List<Object> get prps => [];


}


class EnableOrDisableNotification extends SwitchEvents {
  @override
  List<Object?> get props => throw UnimplementedError();


}
class SliderEvent extends SwitchEvents {

  double slider ;
  SliderEvent({required this.slider});

  List<Object> get props => [slider];
}
