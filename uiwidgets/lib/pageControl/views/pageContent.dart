import 'package:flutter/material.dart';
import 'package:uiwidgets/pageControl/data/entity/pageItem.dart';

class PageContent extends StatelessWidget {
  final PageItem item;

  const PageContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(item.image, height: 250),
        const SizedBox(height: 24),
        Text(
          item.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          item.subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
