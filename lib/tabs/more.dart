import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../components/web_view_container.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  final List<Map<String, String>> _menuItems = [
    {
      'title': 'Impressum',
      'url': 'https://www.fh-joanneum.at/hochschule/organisation/impressum/',
    },
    {
      'title': 'Datenschutzerklärung',
      'url': 'https://www.fh-joanneum.at/hochschule/organisation/datenschutz/',
    },
    // {
    //   'title': 'Über Uns',
    //   'url': 'https://yourwebsite.com/ueber-uns',
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _menuItems.map((item) {
        return ListTile(
          title: Text(item['title']!),
          onTap: () => _openWebView(context, item['title']!, item['url']!),
        );
      }).toList(),
    );
  }

  void _openWebView(BuildContext context, String title, String url) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WebViewContainer(title: title, webViewController: _createWebViewController(url),)));
  }


  // todo: navigating disable ? security thema.
  // todo: fallback ? wenn eine page nicht geladen werden kann.
  // todo: progress indicator, wäre gut.
  // todo: refactoren: controller auslagern?
  // todo: listtile styling, anpassen. beim nächsten sprint sonst. oder wenn design kommt.

  WebViewController _createWebViewController(String url) {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }
}
