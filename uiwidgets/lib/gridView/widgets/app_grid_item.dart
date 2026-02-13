import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uiwidgets/gridView/models/app_model.dart';
import 'package:uiwidgets/gridView/pages/detail_page.dart';

class AppGridItem extends StatefulWidget {
  const AppGridItem({super.key, required this.app});
  final AppModel app;

  @override
  State<AppGridItem> createState() => _AppGridItemState();
}

class _AppGridItemState extends State<AppGridItem> {
  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      actions: <Widget>[
        CupertinoContextMenuAction(
          onPressed: () {
            Navigator.pop(context);
            Share.share('sa', subject: 'Sa');
          },
          isDefaultAction: true,
          trailingIcon: CupertinoIcons.share,
          child: const Text('Share'),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (_) => DetailPage(app: widget.app)),
          );
        },
        child: SizedBox(
          height: 200,
          width: 200,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: Image.network(widget.app.appIcon, fit: BoxFit.contain),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.app.appName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
