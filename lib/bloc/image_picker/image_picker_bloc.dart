
import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_state_management/bloc/image_picker/image_picker_state.dart';
import 'package:bloc_state_management/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickerStates>{

    final ImagePickerUtils imagePickerUtils ;
    ImagePickerBloc(this.imagePickerUtils) :super(const ImagePickerStates()){

      on<CameraCapture>(cameraCapture);
  }

  void cameraCapture(CameraCapture event ,Emitter<ImagePickerStates> states)async{

      XFile? file = await imagePickerUtils.cameraCapture();
      emit(state.copyWith(file));

  }
}