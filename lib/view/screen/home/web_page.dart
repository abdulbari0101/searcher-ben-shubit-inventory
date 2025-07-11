import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
import '../../../controller/web/web_controller.dart';

class WebPage extends StatelessWidget {
  const WebPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WebPageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Convert PDF to Excel File'),
      ),
      body: WebViewWidget(controller: controller.webViewController),
    );
  }
}