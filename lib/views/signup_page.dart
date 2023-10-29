//flutter
import 'package:flutter/material.dart';
//packasges
import 'package:flutter_riverpod/flutter_riverpod.dart';
// models
import 'package:test0805/models/signup_model.dart';
//components
import 'package:test0805/details/rounded_text_field.dart';
import 'package:test0805/details/rounded_password_field.dart';
import 'package:test0805/details/rounded_button.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final SignupModel signupModel = ref.watch(signupProvider);
    final TextEditingController emailEditingController = TextEditingController(text: signupModel.email);
    final TextEditingController passwordEditingController = TextEditingController(text: signupModel.password);
    return Scaffold(
      appBar: AppBar(
        title: const Text("サインアップ"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedTextField(
            controller: emailEditingController,
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => signupModel.email = text,
            borderColor: Colors.black,
            shadowColor: const Color(0xFF77BFA3).withOpacity(0.3),
            hintText: "メールアドレス"
          ),
          RoundedPasswordField(
            onChanged: (text) => signupModel.password = text,
            passwordEditingController: passwordEditingController, 
            obscureText: signupModel.isObscure, 
            toggleObscureText: () => signupModel.toggleIsObscure(), 
            borderColor: Colors.black, 
            shadowColor: const Color(0xFFEDEEC9)
          ),
          RoundedButton(
            onPressed: () async => await signupModel.createUser(context: context),
            widthRate: 0.85,
            color: Colors.red.withOpacity(0.5),
            text: "新規登録"
          ),
        ],
      ),
    );
  }
}
