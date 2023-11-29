import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_project/bloc/auth_bloc.dart';
import 'package:stack_project/bloc/auth_event.dart';
import 'package:stack_project/bloc/auth_state.dart';
import 'package:stack_project/screens/second_screen.dart';
import 'package:stack_project/theme/app_fonts.dart';

class FirstButtonWidget extends StatelessWidget {
  const FirstButtonWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        BlocProvider.of<AuthBloc>(context).add(
          SendNumberEvent(
            phoneNumber: controller.text,
          ),
        );
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.2),
        fixedSize: const Size(121, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        side: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  state.errorText,
                  style: const TextStyle(
                    fontSize: 33,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            );
          } else if (state is AuthSuccess) {
            if (state.tokenModel.status == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondPage(),
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(
                    state.tokenModel.message ?? '',
                    style: const TextStyle(
                      fontSize: 33,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const CircularProgressIndicator.adaptive();
          }
          return const Text(
            'Sign In',
            style: AppFonts.s15w600,
          );
        },
      ),
    );
  }
}
