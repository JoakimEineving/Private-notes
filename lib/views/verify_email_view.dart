import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.email,
                  color: Colors.grey,
                  size: 200,
                ),
                Text(
                  "Check your email",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                      "If you haven't recieved a verification email yet, press the button below",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                        fixedSize: const Size(400, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () async {
                      await AuthService.firebase().sendEmailVerification();
                    },
                    child: const Text(
                      'Resend email verification',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await AuthService.firebase().logOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'Go back',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
