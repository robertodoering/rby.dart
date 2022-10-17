import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rby/rby.dart';

import '../setup/setup.dart';

void main() {
  group('$ExpansionCard', () {
    goldenTest(
      'renders correctly',
      fileName: 'expansion_card',
      pumpWidget: pumpWithTheme,
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints.tightFor(width: 465),
        columns: 1,
        children: [
          GoldenTestScenario(
            name: 'expanded',
            child: const ExpansionCard(
              title: Text('title'),
              children: [
                RbyListTile(title: Text('child')),
                RbyListTile(title: Text('child')),
                RbyListTile(title: Text('child')),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'collapsed',
            child: const ExpansionCard(
              title: Text('title'),
              initiallyCollapsed: true,
              children: [
                RbyListTile(title: Text('child')),
                RbyListTile(title: Text('child')),
                RbyListTile(title: Text('child')),
              ],
            ),
          ),
        ],
      ),
    );
  });
}
