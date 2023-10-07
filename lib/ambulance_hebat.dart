import 'package:ambulance_hebat_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AmbulanceHebat extends StatefulWidget {
  const AmbulanceHebat({super.key});

  @override
  State<AmbulanceHebat> createState() => _AmbulanceHebatState();
}

class _AmbulanceHebatState extends State<AmbulanceHebat> {
  late final WebViewController controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          onNavigationRequest: (NavigationRequest request){
            if(request.url.startsWith("tel")){
              launchUrl(Uri.parse(request.url));
              return NavigationDecision.prevent;
            }
            if(request.url.startsWith("whatsapp:")){
              launchUrl(Uri.parse(request.url));
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          }
      ))
      ..getScrollPosition()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(true)
      ..loadRequest(
          Uri.parse('https://ambulance-hebat.dinkes.semarangkota.go.id/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(
                controller: controller),
            if (loadingPercentage < 100)
              LinearProgressIndicator(color: redBold, value: loadingPercentage / 100.0)
          ],
        ),
      ),
    );
  }
}
