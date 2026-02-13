import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/app_model.dart';

class DetailPage extends StatelessWidget {
  final AppModel app;

  const DetailPage({super.key, required this.app});

  Future<void> _launchStore() async {
    final Uri url = Uri.parse(app.storeURL);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(app.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              app.appIcon,
              height: 120,
            ),
            const SizedBox(height: 16),
            Text(
              app.appName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              app.appCategory,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text('Release Date: ${app.releaseDate}'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _launchStore,
                child: const Text('Open in App Store'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
