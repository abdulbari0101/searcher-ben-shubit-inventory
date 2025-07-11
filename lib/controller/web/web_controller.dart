import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageController extends GetxController {
  late final WebViewController webViewController;
  String? url;

  @override
  void onInit() {
    super.onInit();
    url = Get.arguments as String?;
    url ??= 'https://smallpdf.com/pdf-to-excel#r=convert-to-excel';

    webViewController =WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(url!)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url!));
  }
}