import 'package:flutter/material.dart';
import 'package:stack_project/theme/app_fonts.dart';
import 'package:stack_project/widgets/button.dart';
import 'package:stack_project/widgets/regist_widget.dart';
import 'package:stack_project/widgets/textField.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 0, 245, 1),
              Color.fromRGBO(0, 255, 255, 1),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Transform(
                transform: Matrix4.identity()..translate(1.5, 100.0),
                child: Container(
                  width: 202,
                  height: 202,
                  decoration: const ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF09F6FF),
                        Color(0xFFFF00F4),
                      ],
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Transform(
                transform: Matrix4.identity()..translate(142.0, 551.0),
                child: Container(
                  width: 270,
                  height: 270,
                  decoration: const ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF09F6FF),
                        Color(0xFFFF00F4),
                      ],
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Transform(
                transform: Matrix4.identity()..translate(0.0, 200.0),
                child: Container(
                    width: 428,
                    height: 510,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.17),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 23),
                        const Text(
                          'Welcome',
                          style: AppFonts.s25w600,
                        ),
                        const SizedBox(height: 120),
                        TextFieldWidget(
                          controller: controller,
                          hintText: 'Phone',
                        ),
                        const SizedBox(height: 95),
                        FirstButtonWidget(controller: controller),
                        const SizedBox(height: 80),
                        const RegistrationWidget(),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
