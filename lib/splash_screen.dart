import 'package:ambulance_hebat_app/ambulance_hebat.dart';
import 'package:ambulance_hebat_app/theme/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // final sessionManager = SessionHelper();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
              const AmbulanceHebat()),
              (Route<dynamic> route) => false);
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) =>
      //         const TermConditionPage()),
      //         (Route<dynamic> route) => false);

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('asset/img/ahha_logo.png'),
              const SizedBox(height: 8.0),
            ],
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Text('©Dinas Kesehatan Kota Semarang'),
              ))
        ],
      ),
    );
  }

  // Future<bool> checkAgreementAccept() async {
  //   var checkAccept = await sessionManager.isAccept();
  //   if (checkAccept != null && checkAccept == true) {
  //     if (mounted) {
  //       Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(
  //               builder: (BuildContext context) =>
  //               const TemanBundaApp()),
  //               (Route<dynamic> route) => false);
  //     }
  //     return checkAccept;
  //   }
  //   else {
  //     if (mounted) {
  //       Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(
  //               builder: (BuildContext context) =>
  //               const TermConditionPage()),
  //               (Route<dynamic> route) => false);
  //     }
  //     return false;
  //   }
  // }
}