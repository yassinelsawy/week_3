import 'package:image_picker/image_picker.dart';

pickImage(gallery) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
  if (image != null) return await image.readAsBytes();
  print('No image selected.');
}
