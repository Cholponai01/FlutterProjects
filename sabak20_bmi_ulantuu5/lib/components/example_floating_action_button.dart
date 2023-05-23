import 'package:flutter/material.dart';

class ForButton extends StatefulWidget {
  const ForButton({
    super.key,
  });

  @override
  State<ForButton> createState() => _ForButtonState();
}

class _ForButtonState extends State<ForButton> {
  int number = 0;
  void increement() {
    setState(() {
      number++;
    });
  }

  void decreement() {
    setState(() {
      number--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('ForButton')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$number'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Floating(
                  icon: const Icon(Icons.add),
                  function: increement,
                ),
                const SizedBox(
                  width: 20,
                ),
                Floating(
                  icon: const Icon(Icons.remove),
                  function: decreement,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Floating extends StatelessWidget {
  const Floating({super.key, required this.icon, required this.function});
  final Icon icon;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: function,
      child: icon,
    );
  }
}
