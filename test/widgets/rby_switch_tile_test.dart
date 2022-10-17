import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rby/rby.dart';

import '../setup/setup.dart';

void main() {
  group('$RbySwitchTile', () {
    goldenTest(
      'renders correctly',
      fileName: 'rby_switch_tile',
      pumpWidget: pumpWithTheme,
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints.tightFor(width: 465),
        columns: 1,
        children: [
          GoldenTestScenario(
            name: 'unselected',
            child: RbySwitchTile(
              title: const Text('title'),
              subtitle: const Text('subtitle'),
              value: false,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'selected',
            child: RbySwitchTile(
              title: const Text('title'),
              subtitle: const Text('subtitle'),
              value: true,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'disabled',
            child: const RbySwitchTile(
              title: Text('title'),
              subtitle: Text('subtitle'),
              value: false,
              onChanged: null,
            ),
          ),
          GoldenTestScenario(
            name: 'disabled & selected',
            child: const RbySwitchTile(
              title: Text('title'),
              subtitle: Text('subtitle'),
              value: true,
              onChanged: null,
            ),
          ),
        ],
      ),
    );
  });
}
