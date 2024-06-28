import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable{

  const ImagePickerEvent() ;
  @override

  List<Object> get props => [];


}

// These are events
class CameraCapture extends ImagePickerEvent{}

class GalleryImagePicker extends ImagePickerEvent{}