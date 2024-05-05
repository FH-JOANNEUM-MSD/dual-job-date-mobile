import 'package:dual_job_date_mobile/screens/login/authentication_bloc.dart';
import 'package:dual_job_date_mobile/screens/login/authentication_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/web_view_container.dart';
import '../../screens/login/login.dart';
import '../../widgets/custom_elevated_button.dart';

class More extends StatefulWidget {
  const More({Key? key});

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
  ];
  TextEditingController _controller = TextEditingController();
  bool _isEditing = false;

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
    if (_isEditing) {
      FocusScope.of(context).requestFocus(new FocusNode());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 60,
            child: ListTile(
              title: _isEditing?
              TextField(autofocus: true,
                  controller: _controller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.done),
                      onPressed: () => _toggleEditing(),
                    ),
                  )
              ) :Text(_controller.text.isEmpty ? 'Tap the edit icon to start typing' : _controller.text),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => _toggleEditing(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Email'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _menuItems.length,
              itemBuilder: (context, index) {
                final item = _menuItems[index];
                return Column(
                  children: [
                    const Divider(),
                    ListTile(
                      title: Text(item['title']!),
                      onTap: () {
                        _openWebView(context, item['title']!, item['url']!);
                      },
                    ),
                    // SOLUTION IF WE WANT TO HAVE ONLY A DIVIDER BETWEEN LIST ITEMS
                    //if (index < _menuItems.length - 1) Divider(), // Add a divider except for the last item
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomElevatedButton(
              text: 'Log out',
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(LogoutEvent());
                navigateToLogin(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void navigateToLogin(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const Login()));
  }

  void _openWebView(BuildContext context, String title, String url) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WebViewContainer(
              title: title,
              webViewController: _createWebViewController(url),
            )));
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
            if (request.url.startsWith('https://www.youtube.com/')) {}
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }
}