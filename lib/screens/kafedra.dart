import 'package:flutter/material.dart';

class Kafedra extends StatelessWidget {
  const Kafedra({super.key, required this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Amaly matematika we informatika',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Container(
              width: double.infinity,
              height: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(';kkibg'),
            )
          ],
        ),
      ),
    ));
  }
}
