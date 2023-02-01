import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_form_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';

enum TapHandler { emailButton, appleButton, emailLoginButton }

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final TapHandler tapHandler;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.tapHandler,
  });

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: ((context) => const UsernameScreen()),
    ));
  }

  void _onAppleTap(BuildContext context) {}

  void _onEmailLoginTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: ((context) => const LoginFormScreen()),
    ));
  }

  void _onAuthButtonTap(BuildContext context) {
    switch (tapHandler) {
      case TapHandler.emailButton:
        {
          _onEmailTap(context);
        }
        break;
      case TapHandler.appleButton:
        {
          _onAppleTap(context);
        }
        break;
      case TapHandler.emailLoginButton:
        {
          _onEmailLoginTap(context);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onAuthButtonTap(context),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size14,
            horizontal: Sizes.size16,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: Sizes.size1,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: icon,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
