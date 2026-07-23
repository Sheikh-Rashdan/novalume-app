import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/icon_styles.dart';
import 'package:novalume_app/constants/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: KColors.blackTextColor,
          displayColor: KColors.blackTextColor,
        ),
      ),
      child: Scaffold(
        backgroundColor: KColors.scaffoldColor,
        body: ShaderMask(
          shaderCallback: (bounds) => RadialGradient(
            colors: [
              Colors.transparent,
              Colors.transparent,
              KColors.primaryColorDark.withAlpha(200),
            ],
            radius: 1.2,
          ).createShader(bounds),
          blendMode: BlendMode.multiply,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/login/doodle_background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 220,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Text('Sign In', style: KTextStyles.bold36),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsetsGeometry.all(20),
                        child: Column(
                          children: [
                            // Form card
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    KColors.secondaryColorLight,
                                    KColors.secondaryColorMedium,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(32.0),
                                border: Border.all(
                                  color: KColors.primaryColorDark2,
                                  width: 1.2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: KColors.defaultShadowColor,
                                    blurRadius: 16.0,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 24.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  LoginTextField(
                                    controller: _emailController,
                                    hintText: 'Enter your Email',
                                    prefixIcon: Icons.mail_rounded,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 16.0),
                                  LoginTextField(
                                    controller: _passwordController,
                                    hintText: 'Enter your Password',
                                    prefixIcon: Icons.lock_rounded,
                                    isPassword: true,
                                  ),
                                  const SizedBox(height: 16.0),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        throw UnimplementedError(
                                          "Forgot Password Page",
                                        );
                                      },
                                      child: Text(
                                        'Forgot Password?',
                                        style: KTextStyles.bold16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Divider(
                                    color: KColors.dividerColor,
                                    thickness: 2.0,
                                    height: 24,
                                  ),
                                  const SizedBox(height: 8.0),
                                  LoginPrimaryButton(
                                    onPressed: () {
                                      throw UnimplementedError(
                                        "Login function",
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 24.0),
                                  VerticalIconLabelButton(
                                    faIcon: FaIcon(
                                      FontAwesomeIcons.google,
                                      size: KIconStyles.default40,
                                    ),
                                    text: Text(
                                      "Google",
                                      style: KTextStyles.bold16,
                                    ),
                                    onTap: () {
                                      throw UnimplementedError(
                                        "Google sign in",
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 16,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: KTextStyles.bold16,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    throw UnimplementedError(
                                      "sign in funciton",
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: KColors.secondaryColorDark,
                                    foregroundColor: KColors.whiteTextColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0,
                                      vertical: 12.0,
                                    ),
                                  ),
                                  child: Text(
                                    'Sign Up',
                                    style: KTextStyles.bold16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPrimaryButton extends StatelessWidget {
  const LoginPrimaryButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: KColors.primaryColorDark,
          foregroundColor: KColors.whiteTextColor,
          shape: StadiumBorder(),
        ),
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(vertical: 10),
          child: Text('LOGIN', style: KTextStyles.bold22),
        ),
      ),
    );
  }
}

class VerticalIconLabelButton extends StatelessWidget {
  const VerticalIconLabelButton({
    super.key,
    this.icon,
    this.faIcon,
    required this.text,
    required this.onTap,
    this.spacing = 8,
  }) : assert(icon != null || faIcon != null);

  final Icon? icon;
  final FaIcon? faIcon;
  final Widget text;
  final VoidCallback onTap;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon == null ? faIcon! : icon!,
            SizedBox(height: spacing),
            text,
          ],
        ),
      ),
    );
  }
}

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.showLabel = false,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool showLabel;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      style: KTextStyles.regular16,
      cursorColor: KColors.blackTextColor,
      decoration: InputDecoration(
        hintText: widget.showLabel ? null : widget.hintText,
        labelText: widget.showLabel ? widget.hintText : null,
        hintStyle: KTextStyles.medium16,
        labelStyle: KTextStyles.medium16,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: KColors.blackTextColor,
          size: KIconStyles.default22,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: KColors.blackTextColor,
                  size: KIconStyles.default22,
                ),
                onPressed: _toggleObscure,
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: KColors.dividerColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: KColors.scaffoldColor,
      ),
    );
  }
}
