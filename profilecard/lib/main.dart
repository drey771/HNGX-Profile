import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const GithubDisplay(),
    );
  }
}

class GithubDisplay extends StatefulWidget {
  const GithubDisplay({Key? key}) : super(key: key);

  @override
  State<GithubDisplay> createState() => _GithubDisplayState();
}

class _GithubDisplayState extends State<GithubDisplay> {
  late final WebViewController controller;

  final _url = "https://github.com/drey771";
  final _key = UniqueKey();
  bool _showGithubView = false;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(_url),
      );
  }

  void loadGithub() {
    setState(() {
      _showGithubView = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.black45,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8.0,
          ),
          if (!_showGithubView) // Conditional rendering
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/slack.jpeg"),
                radius: 45.0,
              ),
            ),
          if (!_showGithubView) // Conditional rendering
            const Divider(
              height: 10.0,
              color: Colors.white,
            ),
          if (!_showGithubView) // Conditional rendering
            const SizedBox(
              height: 5.0,
            ),
          if (!_showGithubView) // Conditional rendering
            const Center(
              child: Text(
                "Babatunde Damilare Daniel",
                style: TextStyle(
                    color: Colors.amber,
                    letterSpacing: 1.2,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          if (!_showGithubView) // Conditional rendering
            const SizedBox(
              height: 5.0,
            ),
          if (!_showGithubView) // Conditional rendering
            const Center(
              child: Text(
                "drey",
                style: TextStyle(
                    color: Colors.amber,
                    letterSpacing: 1.5,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal),
              ),
            ),
          const SizedBox(
            height: 7.0,
          ),
          Center(
            child: ElevatedButton(
              onPressed: loadGithub,
              child: const Text('Open Github'),
            ),
          ),
          if (_showGithubView)
            Expanded(
              child: WebViewWidget(
                key: _key,
                controller: controller,
              ),
            ),
        ],
      ),
    );
  }
}
