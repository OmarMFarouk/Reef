import 'package:erp12k/blocs/auth_bloc/auth_cubit.dart';
import 'package:erp12k/blocs/auth_bloc/auth_states.dart';
import 'package:erp12k/components/Buttons/fatora_button.dart';
import 'package:erp12k/screens/home_page.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:erp12k/src/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
      if (state is AuthSuccess) {
        AppNavigation.pushR(context, const HomePage());
      }
      if (state is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something went wrong.')));
      }
    }, builder: (context, state) {
      var cubit = AuthCubit.get(context);
      return Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    radius: 200,
                    child: Image(
                      image: AssetImage('assets/images/logo.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(26),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              'LOGIN',
                              style: AppFonts.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  labelText: 'البريد الايكتروني',
                                ),
                                controller: cubit.emailCont,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '*Empty';
                                  } else if (!value.contains('@') ||
                                      value.length < 10 ||
                                      !value.contains('.')) {
                                    return '*Invaild Email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  labelText: 'كلمة المرور',
                                ),
                                  obscureText: true,
                                controller: cubit.passwordCont,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '*Empty';
                                  } else if (value.length < 6) {
                                    return '*Invalid Passord';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: state is AuthLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : FatoraButton(
                                      title: 'تسجيل دخول',
                                      color: Colors.black,
                                      ontap: () {
                                        if (key.currentState!.validate()) {
                                          cubit.logIn();
                                        }
                                      },
                                    ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
