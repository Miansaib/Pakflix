import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled2/Screens/signup_screen1.dart';
import '../Custom Widgets/custom_button.dart';
import '../Custom Widgets/reusable_widget.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({Key? key}) : super(key: key);

  @override
  _LoginWithPhoneState createState() => _LoginWithPhoneState();
}
String PhoneNo='';
class _LoginWithPhoneState extends State<LoginWithPhone> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;

  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100,),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child:
                      Lottie.asset('Assets/Lottie_Files/customer-care.json')),
              const SizedBox(
                height: 50,
              ),
              reusableTextField(
                  'Enter Phone Number', Icons.phone, false, phoneController),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                visible: otpVisibility,
                child: reusableTextField('Verify  OTP', Icons.verified_outlined,
                    false, otpController),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                OnTap: () {
                  PhoneNo=phoneController.text;
                  if (otpVisibility) {
                    verifyOTP();
                  } else {
                    loginWithPhone();
                  }
                },
                buttonColor: Colors.green,
                buttonName: otpVisibility ? "Verify OTP" : "Send OTP",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          if (kDebugMode) {
            print("You are logged in successfully");
          }
        });
      },
      timeout: const Duration(minutes: 2),
      verificationFailed: (FirebaseAuthException e) {
        if (kDebugMode) {
          print(e.message);
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then((value) {
      Fluttertoast.showToast(
          msg: "OTP Verified Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) {
          return  SignUpScreen( PhoneNo:otpController.text,);
        }),
      );
    });
  }
}





