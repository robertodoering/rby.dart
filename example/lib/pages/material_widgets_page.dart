import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

class MaterialWidgetsPage extends StatelessWidget {
  const MaterialWidgetsPage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('material')),
      body: ListView(
        children: [
          const _RadioListTiles(),
          VerticalSpacer.normal,
          const _SwitchListTiles(),
          VerticalSpacer.normal,
          const _Slider(),
          VerticalSpacer.normal,
          Center(
            child: Tooltip(
              message: 'tooltip',
              child: Card(
                child: Padding(
                  padding: theme.spacing.edgeInsets,
                  child: const Text('card with tooltip'),
                ),
              ),
            ),
          ),
          VerticalSpacer.normal,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _showSnackbar(context),
                child: const Text('elevated button'),
              ),
              HorizontalSpacer.normal,
              const ElevatedButton(
                onPressed: null,
                child: Text('elevated button'),
              ),
            ],
          ),
          VerticalSpacer.normal,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => _showSnackbar(context),
                child: const Text('text button'),
              ),
              HorizontalSpacer.normal,
              const TextButton(
                onPressed: null,
                child: Text('text button'),
              ),
            ],
          ),
          VerticalSpacer.normal,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () => _showSnackbar(context),
                child: const Text('outlined button'),
              ),
              HorizontalSpacer.normal,
              const OutlinedButton(
                onPressed: null,
                child: Text('outlined button'),
              ),
            ],
          ),
          VerticalSpacer.normal,
        ],
      ),
    );
  }
}

class _RadioListTiles extends StatefulWidget {
  const _RadioListTiles();

  @override
  State<_RadioListTiles> createState() => _RadioListTilesState();
}

class _RadioListTilesState extends State<_RadioListTiles> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<int>(
          value: 0,
          groupValue: _value,
          title: const Text('RadioListTile'),
          onChanged: (value) => setState(() => _value = value ?? 0),
        ),
        RadioListTile<int>(
          value: 1,
          groupValue: _value,
          title: const Text('RadioListTile'),
          onChanged: (value) => setState(() => _value = value ?? 1),
        ),
        const RadioListTile(
          value: 0,
          groupValue: 1,
          title: Text('RadioListTile'),
          onChanged: null,
        ),
        const RadioListTile(
          value: 0,
          groupValue: 0,
          title: Text('RadioListTile'),
          onChanged: null,
        ),
      ],
    );
  }
}

class _SwitchListTiles extends StatefulWidget {
  const _SwitchListTiles();

  @override
  State<_SwitchListTiles> createState() => _SwitchListTilesState();
}

class _SwitchListTilesState extends State<_SwitchListTiles> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          value: _value,
          title: const Text('SwitchListTile'),
          onChanged: (value) => setState(() => _value = value),
        ),
        const SwitchListTile(
          value: false,
          title: Text('SwitchListTile'),
          onChanged: null,
        ),
        const SwitchListTile(
          value: true,
          title: Text('SwitchListTile'),
          onChanged: null,
        ),
      ],
    );
  }
}

class _Slider extends StatefulWidget {
  const _Slider();

  @override
  State<_Slider> createState() => _SliderState();
}

class _SliderState extends State<_Slider> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _value,
      divisions: 10,
      label: '$_value',
      onChanged: (value) => setState(() => _value = value),
    );
  }
}

void _showSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text('snackbar'),
      action: SnackBarAction(
        label: 'action',
        onPressed: () {},
      ),
    ),
  );
}
