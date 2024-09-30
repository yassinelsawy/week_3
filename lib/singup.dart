//import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fontresoft/fontresoft.dart';
import 'package:image_picker/image_picker.dart';
import 'package:week_3/profile.dart';
import 'package:week_3/utils.dart';
import 'package:csc_picker/csc_picker.dart';

class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _PasswordVisible = false;
  bool ismale = false;
  bool isfemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Center(
          child: Text('Singup',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 65,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 65,
                            child: Image(
                              image: AssetImage('assets/profile.jpeg'),
                              width: 150,
                              height: 150,
                            ),
                          ),
                    Positioned(
                      bottom: 9,
                      left: 85,
                      child: IconButton(
                        onPressed: () {
                          selectImage();
                        },
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                TextField(
                  decoration: InputDecoration(
                    label: Text(
                      'Full Name',
                      style: Font.poppins().copyWith(
                        fontSize: 16,
                        color: const Color(0xffA8A6A7),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    contentPadding:
                        const EdgeInsets.only(left: 20, top: 14, bottom: 14),
                  ),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text(
                      'Email',
                      style: Font.poppins().copyWith(
                        fontSize: 16,
                        color: const Color(0xffA8A6A7),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    contentPadding:
                        const EdgeInsets.only(left: 20, top: 14, bottom: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!value.contains('@') ||
                        !value.contains('.com') ||
                        value.length < 6) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: _PasswordVisible,
                  decoration: InputDecoration(
                    label: Text(
                      'Password',
                      style: Font.poppins().copyWith(
                        fontSize: 16,
                        color: const Color(0xffA8A6A7),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    contentPadding:
                        const EdgeInsets.only(left: 20, top: 14, bottom: 14),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _PasswordVisible = !_PasswordVisible;
                        });
                      },
                      icon: Icon(
                        _PasswordVisible
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        color: Colors.black,
                      ),
                    ),
                    //contentPadding: const EdgeInsets.only(left: 20, top: 14, bottom: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: _PasswordVisible,
                  decoration: InputDecoration(
                    label: Text(
                      'Confirm Password',
                      style: Font.poppins().copyWith(
                        fontSize: 16,
                        color: const Color(0xffA8A6A7),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),

                    contentPadding:
                        const EdgeInsets.only(left: 20, top: 14, bottom: 14),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _PasswordVisible = !_PasswordVisible;
                        });
                      },
                      icon: Icon(
                        _PasswordVisible
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        color: Colors.black,
                      ),
                    ),
                    //contentPadding: const EdgeInsets.only(left: 20, top: 14, bottom: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    } else if (value != passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 10,
                ),
                CSCPicker(
                  layout: Layout.horizontal,
                  flagState: CountryFlag.ENABLE,
                  onCountryChanged: (Country) => print(Country),
                  onStateChanged: (State) => print(State),
                  onCityChanged: (City) => print(City),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: const Color(0xffA8A6A7)),
                  ),
                  disabledDropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                    border: Border.all(color: const Color(0xffA8A6A7)),
                  ),
                  selectedItemStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  dropdownHeadingStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: ismale,
                      onChanged: (value) {
                        setState(() {
                          ismale = value!;
                          if (ismale) isfemale = false;
                        });
                      },
                      focusColor: Colors.white,
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                    ),
                    Text(
                      'Male',
                      style: Font.poppins().copyWith(
                        fontSize: 16,
                        color: const Color(0xffA8A6A7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Checkbox(
                      value: isfemale,
                      onChanged: (value) {
                        setState(() {
                          isfemale = value!;
                          if (isfemale) ismale = false;
                        });
                      },
                      focusColor: Colors.white,
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                    ),
                    Text(
                      'Female',
                      style: Font.poppins().copyWith(
                        fontSize: 16,
                        color: const Color(0xffA8A6A7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate())
                      {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profile(
                                email: emailController.text,
                                password: passwordController.text))
                        );
                      }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.only(
                        left: 50, right: 50, top: 10, bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
