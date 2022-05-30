import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class WikiLink extends StatelessWidget {
  const WikiLink({Key? key, required this.wikiUrl}) : super(key: key);

  final String wikiUrl;

  @override
  Widget build(BuildContext context) {
    return Link(
      target: LinkTarget.defaultTarget,
      uri: Uri.parse(wikiUrl),
      builder: ((context, followLink) => ElevatedButton(
            onPressed: followLink,
            child: const Text(
              'Wiki',
              style: TextStyle(fontSize: 16),
            ),
          )),
    );
  }
}
