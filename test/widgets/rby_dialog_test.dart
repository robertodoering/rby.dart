import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rby/rby.dart';

import '../setup/setup.dart';

void main() {
  group('$RbyDialog', () {
    goldenTest(
      'renders correctly',
      fileName: 'rby_dialog',
      pumpWidget: pumpWithTheme,
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints.tightFor(width: 465),
        columns: 1,
        children: [
          GoldenTestScenario(
            name: 'basic',
            child: ColoredBox(
              color: Colors.red.withOpacity(.2),
              child: RbyDialog(
                title: const Text('title'),
                content: Column(
                  children: const [
                    RbyListTile(title: Text('child')),
                    RbyListTile(title: Text('child')),
                    RbyListTile(title: Text('child')),
                  ],
                ),
                actions: [
                  RbyButton.text(
                    label: const Text('action'),
                    onTap: () {},
                  ),
                  RbyButton.elevated(
                    label: const Text('action'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  });
}
