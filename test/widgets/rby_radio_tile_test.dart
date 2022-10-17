import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rby/rby.dart';

import '../setup/setup.dart';

void main() {
  group('$RbyRadioTile', () {
    goldenTest(
      'renders correctly',
      fileName: 'rby_radio_tile',
      pumpWidget: pumpWithTheme,
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints.tightFor(width: 465),
        columns: 1,
        children: [
          GoldenTestScenario(
            name: 'unselected',
            child: RbyRadioTile(
              title: const Text('title'),
              subtitle: const Text('subtitle'),
              groupValue: 0,
              value: 1,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'selected',
            child: RbyRadioTile(
              title: const Text('title'),
              subtitle: const Text('subtitle'),
              groupValue: 0,
              value: 0,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'disabled',
            child: const RbyRadioTile(
              title: Text('title'),
              subtitle: Text('subtitle'),
              groupValue: 0,
              value: 1,
              onChanged: null,
            ),
          ),
          GoldenTestScenario(
            name: 'disabled & selected',
            child: const RbyRadioTile(
              title: Text('title'),
              subtitle: Text('subtitle'),
              groupValue: 0,
              value: 0,
              onChanged: null,
            ),
          ),
        ],
      ),
    );
  });
}
