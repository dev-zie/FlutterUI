import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollviewUi extends StatefulWidget {
  const ScrollviewUi({super.key});

  @override
  State<ScrollviewUi> createState() => _ScrollviewUiState();
}

class _ScrollviewUiState extends State<ScrollviewUi> {
  final ScrollController _controller = ScrollController();
  bool _shown = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.atEdge &&
          _controller.position.pixels != 0 &&
          !_shown) {
        _shown = true;
        showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
            content: const Text("You have reached the end of the scroll view."),
          ),
        ).then((value) {
          _shown = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: height * 2,
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(8, (index) {
              return SizedBox(
                height: height * 0.25,
                child: Center(
                  child: Text(
                    "Label ${index + 1}",
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
