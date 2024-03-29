

import 'dart:async';
import 'package:bodoo_flutter/Paymob_integ/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

import 'constant.dart';





class MobileWalletWebview extends StatefulWidget {

  MobileWalletWebview({Key? key, }) : super(key: key);



  @override
  State<MobileWalletWebview> createState() => _MobileWalletWebviewState();
}

class _MobileWalletWebviewState extends State<MobileWalletWebview> {

  final Completer<WebViewController> _controllerCompleter =
  Completer<WebViewController>();


  late final WebViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');

            if(url.contains('formResponse')){
              // debugPrint('Page finished navigator');
              // Navigator.of(context).pop();
              //Provider.of<SurveyProvider>(context,listen: false).postSurvey(widget.reviewModel.id,context);
            }
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
    //https://accept.paymob.com/api/acceptance/iframes/699618?payment_token={${Provider.of<PaymentProvider>(context,listen: false).finalPayToken}}
    //https://accept.paymobsolutions.com/api/acceptance/iframes/{{699618}}?payment_token={{${Provider.of<PaymentProvider>(context,listen: false).finalPayToken}}}
      ..loadRequest(Uri.parse('${Provider.of<PaymentProvider>(context,listen: false).redirectionUrl}'));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: WebViewWidget(
          controller: _controller),
    );
  }

}
