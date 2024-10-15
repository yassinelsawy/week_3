import 'package:flutter/material.dart';
import 'package:fontresoft/fontresoft.dart';
import 'package:get/get.dart';
import 'package:week_3/profile.dart';
import 'package:week_3/singup.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  
  bool _isChecked = false;
  // ignore: non_constant_identifier_names
  bool _PasswordVisible = true;
  final  _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 31, right: 31),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
              Text(
                'Sign In',
                style: Font.poppins().copyWith(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 70,),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text('Email', style: Font.poppins().copyWith(
                      fontSize: 16,
                      color: const Color(0xffA8A6A7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                    border: const UnderlineInputBorder(
                      borderSide:  BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:  BorderSide(color: Colors.white70),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide:  BorderSide(color: Colors.white70),
                    ),
                    contentPadding: const EdgeInsets.only(left: 20, top: 14, bottom: 14),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter your email';
                      }
                      else if(!value.contains('@') || !value.contains('.com')|| value.length < 6) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,                    
                  ),
                  
                 const SizedBox(height: 30,),
                TextFormField(
            
                  controller: passwordController,
                  obscureText: _PasswordVisible,
                  decoration: InputDecoration(
                    label: Text('Password', style: Font.poppins().copyWith(
                    fontSize: 16,
                    color: const Color(0xffA8A6A7),
                    fontWeight: FontWeight.w400,
                    ),
                  ),
                  border: const UnderlineInputBorder(
                      borderSide:  BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:  BorderSide(color: Colors.white70),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide:  BorderSide(color: Colors.white70),
                    ),
                    contentPadding: const EdgeInsets.only(left: 20, top: 14, bottom: 14),
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _PasswordVisible = !_PasswordVisible;
                      });
                    },
                    icon: Icon(_PasswordVisible ? Icons.visibility_off_rounded : Icons.visibility_rounded, color: Colors.black,),
                  ),
                  //contentPadding: const EdgeInsets.only(left: 20, top: 14, bottom: 14),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Please enter your password';
                    }
                    else if(value.length < 6){
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 10,),
                Row(
                  children:[
                    Checkbox(
                      value: _isChecked, 
                      onChanged: (bool? value){
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                      focusColor: Colors.white ,
                      activeColor: Colors.black, 
                      checkColor: Colors.white,
                    ),
                    Text(
                      'Remember me',
                      style: Font.poppins().copyWith(
                        fontSize: 15,
                        color: const Color(0xffA8A6A7),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: (){},
                      child: Text(
                        'Forgot Password?',
                        style: Font.poppins().copyWith(
                          fontSize: 15,
                          color: const Color(0xff56CCF2),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50,),
                Container(
                  width: 350,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.black,
                  ),
                  child: TextButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        Get.to(Profile(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        ));
                      }

                    },
                    child: Text(
                      'LOGIN',
                      style: Font.poppins().copyWith(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: Font.poppins().copyWith(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),),
                    InkWell(
                      onTap: (){
                        Get.to(Singup());
                      
                      },
                      child: Text(
                        ' Sign Up',
                        style: Font.poppins().copyWith(
                          fontSize: 16,
                          color: const Color(0xff56CCF2),
                          fontWeight: FontWeight.w900,
                          //decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
            
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    const Expanded(
                      child: SizedBox(
                        //width: 100,
                        child:
                        Divider(
                          color: Color(0xff9F9F9F),
                          thickness: 3,
                          endIndent: 10,
                          indent: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      'Sign In with',
                      style: Font.poppins().copyWith(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Expanded(
                      child:  SizedBox(
                        //width: 100,
                        child:
                        Divider(
                          color: Color(0xff9F9F9F),
                          thickness: 3,
                          endIndent: 10,
                          indent: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){}, icon: 
                      Image.asset('assets/google.png', width: 100, height: 60,)),
                    IconButton(onPressed: (){}, icon: 
                      Image.asset('assets/fb.jpeg', width: 100 , height: 100,)),
                    IconButton(onPressed: (){}, icon:Image.asset('assets/x.jpeg', width: 100, height: 100,)),
            
                  ],
                ),
              
                // Container(
                //   width: 350,
                //   height: 64,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(32),
                //     color: Colors.black,
                //   ),
                //   child: TextButton(
                //     onPressed: (){
                //     },
                //     child: Text(
                //       'Create an Account',
                //       style: Font.poppins().copyWith(
                //         fontSize: 20,
                //         color: Colors.white,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 20,),
                // Container(
                //   width: 350,
                //   height: 64,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(32),
                //     color: Colors.white,
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       TextButton(
                //         onPressed: (){
                //         },
                //         child: Row(
                //           children: [
                //             IconButton(onPressed: (){}, icon: 
                //           Image.asset('assets/google.png',)
                //         ,),
                //             Text(
                //               'Sign In with Google',
                //               style: Font.poppins().copyWith(
                //                 fontSize: 20,
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.w900,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
            ],
            ),
          ),
        ),
      ),

    );
  }
}