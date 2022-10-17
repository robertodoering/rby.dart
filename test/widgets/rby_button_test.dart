import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rby/rby.dart';

import '../setup/setup.dart';

void main() {
  group('$RbyButton', () {
    goldenTest(
      'text button renders correctly',
      fileName: 'rby_button.text',
      pumpWidget: pumpWithTheme,
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints.tightFor(width: 465),
        columns: 1,
        children: [
          GoldenTestScenario(
            name: 'with label',
            child: RbyButton.text(
              label: const Text('label'),
              onTap: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'with icon',
            child: RbyButton.text(
              icon: const Icon(Icons.favorite_outline_rounded),
              onTap: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'with label & icon',
            child: RbyButton.text(
              label: const Text('label'),
              icon: const Icon(Icons.favorite_outline_rounded),
              onTap: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'disabled',
            child: const RbyButton.text(
              label: Text('label'),
              icon: Icon(Icons.favorite_outline_rounded),
              onTap: null,
            ),
          ),
        ],
      ),
    );

    goldenTest(
      'elevated button renders correctly',
      fileName: 'rby_button.elevated',
      pumpWidget: pumpWithTheme,
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints.tightFor(width: 465),
        columns: 1,
        children: [
          GoldenTestScenario(
            name: 'with label',
            child: RbyButton.elevated(
              label: const Text('label'),
              onTap: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'with icon',
            child: RbyButton.elevated(
              icon: const Icon(Icons.favorite_outline_rounded),
              onTap: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'with label & icon',
            child: RbyButton.elevated(
              label: const Text('label'),
              icon: const Icon(Icons.favorite_outline_rounded),
              onTap: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'disabled',
            child: const RbyButton.elevated(
              label: Text('label'),
              icon: Icon(Icons.favorite_outline_rounded),
              onTap: null,
            ),
          ),
        ],
      ),
    );

    goldenTest(
      'transparent button renders correctly',
      fileName: 'rby_button.transparent',
      pumpWidget: pumpWithTheme,
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints.tightFor(width: 465),
        columns: 1,
        children: [
          GoldenTestScenario(
            name: 'with label',
            child: RbyButton.transparent(
              label: const Text('label'),
              onTap: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'with icon',
            child: RbyButton.transparent(
              icon: const Icon(Icons.favorite_outline_rounded),
              onTap: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'with label & icon',
            child: RbyButton.transparent(
              label: const Text('label'),
              icon: const Icon(Icons.favorite_outline_rounded),
              onTap: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'disabled',
            child: const RbyButton.transparent(
              label: Text('label'),
              icon: Icon(Icons.favorite_outline_rounded),
              onTap: null,
            ),
          ),
        ],
      ),
    );

    goldenTest(
      'card button renders correctly',
      fileName: 'rby_button.card',
      pumpWidget: pumpWithTheme,
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints.tightFor(width: 465),
        columns: 1,
        children: [
          GoldenTestScenario(
            name: 'with label',
            child: RbyButton.card(
              label: const Text('label'),
              onTap: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'with icon',
            child: RbyButton.card(
              icon: const Icon(Icons.favorite_outline_rounded),
              onTap: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'with label & icon',
            child: RbyButton.card(
              label: const Text('label'),
              icon: const Icon(Icons.favorite_outline_rounded),
              onTap: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'disabled',
            child: const RbyButton.card(
              label: Text('label'),
              icon: Icon(Icons.favorite_outline_rounded),
              onTap: null,
            ),
          ),
        ],
      ),
    );
  });
}
