import 'package:flutter/material.dart';
import 'package:stack_project/theme/app_fonts.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Are you a new user? ',
          style: AppFonts.s15w600,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Sign Up',
            style: AppFonts.s15w600o,
          ),
        ),
      ],
    );
  }
}
