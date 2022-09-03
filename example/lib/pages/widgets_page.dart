import 'package:example/storybook.dart';
import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

class WidgetsPage extends StatelessWidget {
  const WidgetsPage();

  @override
  Widget build(BuildContext context) {
    return Storybook(
      title: const Text('widgets'),
      entries: [
        StorybookEntry(
          label: 'RbyListTile',
          builder: (_) => const _RbyListTile(),
        ),
        StorybookEntry(
          label: 'RbyListCard',
          builder: (_) => const _RbyListCard(),
        ),
        StorybookEntry(
          label: 'RbyRadioTile',
          builder: (_) => const _RbyRadioTile(),
        ),
        StorybookEntry(
          label: 'RbySwitchTile',
          builder: (_) => const _RbySwitchTile(),
        ),
        StorybookEntry(
          label: 'RbyButton',
          builder: (_) => const _RbyButton(),
        ),
        StorybookEntry(
          label: 'RbyDialog',
          builder: (_) => const _RbyDialog(),
        ),
        StorybookEntry(
          label: 'ExpansionCard',
          builder: (_) => const _ExpansionCard(),
        ),
      ],
    );
  }
}

class _RbyListTile extends StatelessWidget {
  const _RbyListTile();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RbyListTile(
          leading: const Icon(Icons.square_outlined),
          title: const Text('title'),
          subtitle: const Text('subtitle'),
          onTap: () {},
        ),
        RbyListTile(
          leading: const Icon(Icons.hexagon_outlined),
          title: const Text('disabled'),
          enabled: false,
          onTap: () {},
        ),
        RbyListTile(
          leading: const Icon(Icons.share_outlined),
          title: const Text(
            'multiline title\n'
            'multiline title\n'
            'multiline title',
          ),
          multilineTitle: true,
          onTap: () {},
        ),
        RbyListTile(
          leading: const Icon(Icons.link_outlined),
          title: const Text('title'),
          subtitle: const Text(
            'multiline subtitle\n'
            'multiline subtitle\n'
            'multiline subtitle',
          ),
          onTap: () {},
        ),
      ],
    );
  }
}

class _RbyListCard extends StatelessWidget {
  const _RbyListCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RbyListCard(
          leading: const Icon(Icons.square_outlined),
          title: const Text('title'),
          subtitle: const Text('subtitle'),
          onTap: () {},
        ),
        VerticalSpacer.small,
        RbyListCard(
          leading: const Icon(Icons.hexagon_outlined),
          title: const Text('disabled'),
          enabled: false,
          onTap: () {},
        ),
        VerticalSpacer.small,
        RbyListCard(
          leading: const Icon(Icons.share_outlined),
          title: const Text(
            'multiline title\n'
            'multiline title\n'
            'multiline title',
          ),
          multilineTitle: true,
          onTap: () {},
        ),
        VerticalSpacer.small,
        RbyListCard(
          leading: const Icon(Icons.link_outlined),
          title: const Text('title'),
          subtitle: const Text(
            'multiline subtitle\n'
            'multiline subtitle\n'
            'multiline subtitle',
          ),
          onTap: () {},
        ),
      ],
    );
  }
}

class _RbyRadioTile extends StatefulWidget {
  const _RbyRadioTile();

  @override
  State<_RbyRadioTile> createState() => _RbyRadioTileState();
}

class _RbyRadioTileState extends State<_RbyRadioTile> {
  var _value = 0;

  void _select(int value) {
    setState(() => _value = value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RbyRadioTile(
          groupValue: _value,
          value: 0,
          title: const Text('title'),
          subtitle: const Text('subtitle'),
          onChanged: _select,
        ),
        RbyRadioTile(
          groupValue: _value,
          value: 1,
          title: const Text('disabled'),
          onChanged: null,
        ),
        RbyRadioTile(
          groupValue: _value,
          value: 2,
          title: const Text(
            'multiline title\n'
            'multiline title\n'
            'multiline title',
          ),
          onChanged: _select,
        ),
        RbyRadioTile(
          groupValue: _value,
          value: 3,
          title: const Text('title'),
          subtitle: const Text(
            'multiline subtitle\n'
            'multiline subtitle\n'
            'multiline subtitle',
          ),
          onChanged: _select,
        ),
      ],
    );
  }
}

class _RbySwitchTile extends StatefulWidget {
  const _RbySwitchTile();

  @override
  State<_RbySwitchTile> createState() => _RbySwitchTileState();
}

class _RbySwitchTileState extends State<_RbySwitchTile> {
  final _values = {
    0: false,
    1: false,
    2: false,
  };

  void _select(int index, bool value) {
    setState(() => _values[index] = value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RbySwitchTile(
          value: _values[0]!,
          title: const Text('title'),
          subtitle: const Text('subtitle'),
          onChanged: (value) => _select(0, value),
        ),
        const RbySwitchTile(
          value: false,
          title: Text('disabled'),
          onChanged: null,
        ),
        const RbySwitchTile(
          value: true,
          title: Text('disabled and selected'),
          onChanged: null,
        ),
        RbySwitchTile(
          value: _values[1]!,
          title: const Text(
            'multiline title\n'
            'multiline title\n'
            'multiline title',
          ),
          onChanged: (value) => _select(1, value),
        ),
        RbySwitchTile(
          value: _values[2]!,
          title: const Text('title'),
          subtitle: const Text(
            'multiline subtitle\n'
            'multiline subtitle\n'
            'multiline subtitle',
          ),
          onChanged: (value) => _select(2, value),
        ),
      ],
    );
  }
}

class _RbyButton extends StatelessWidget {
  const _RbyButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RbyButton.text(
          label: const Text('text with label'),
          onTap: () {},
        ),
        VerticalSpacer.small,
        RbyButton.text(
          icon: const Icon(Icons.favorite_outline),
          label: const Text('text with icon and label'),
          onTap: () {},
        ),
        VerticalSpacer.small,
        const RbyButton.text(
          icon: Icon(Icons.favorite_outline),
          label: Text('text disabled'),
          onTap: null,
        ),
        VerticalSpacer.normal,
        RbyButton.elevated(
          label: const Text('elevated with label'),
          onTap: () {},
        ),
        VerticalSpacer.small,
        RbyButton.elevated(
          icon: const Icon(Icons.favorite_outline),
          label: const Text('elevated with icon and label'),
          onTap: () {},
        ),
        VerticalSpacer.small,
        const RbyButton.elevated(
          icon: Icon(Icons.favorite_outline),
          label: Text('elevated disabled'),
          onTap: null,
        ),
        VerticalSpacer.normal,
        RbyButton.transparent(
          label: const Text('transparent with label'),
          onTap: () {},
        ),
        VerticalSpacer.small,
        RbyButton.transparent(
          icon: const Icon(Icons.favorite_outline),
          label: const Text('transparent with icon and label'),
          onTap: () {},
        ),
        VerticalSpacer.small,
        const RbyButton.transparent(
          icon: Icon(Icons.favorite_outline),
          label: Text('transparent disabled'),
          onTap: null,
        ),
        VerticalSpacer.normal,
        RbyButton.card(
          label: const Text('card with label'),
          onTap: () {},
        ),
        VerticalSpacer.small,
        RbyButton.card(
          icon: const Icon(Icons.favorite_outline),
          label: const Text('card with icon and label'),
          onTap: () {},
        ),
        VerticalSpacer.small,
        const RbyButton.card(
          icon: Icon(Icons.favorite_outline),
          label: Text('card disabled'),
          onTap: null,
        ),
      ],
    );
  }
}

class _RbyDialog extends StatelessWidget {
  const _RbyDialog();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RbyButton.text(
          label: const Text('show dialog'),
          onTap: () => showDialog<void>(
            context: context,
            builder: (_) => RbyDialog(
              title: const Text('title'),
              stickyContent: const Center(child: Text('sticky content')),
              content: Column(
                children: [
                  for (var i = 0; i < 50; i++) const Text('content'),
                ],
              ),
              actions: [
                RbyButton.text(
                  label: const Text('action one'),
                  onTap: () {},
                ),
                RbyButton.elevated(
                  label: const Text('action two'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ExpansionCard extends StatelessWidget {
  const _ExpansionCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ExpansionCard(
          title: Text('title'),
          children: [
            RbyListTile(title: Text('child')),
            RbyListTile(title: Text('child')),
            RbyListTile(title: Text('child')),
            RbyListTile(title: Text('child')),
          ],
        ),
        VerticalSpacer.normal,
        ExpansionCard(
          title: Text('initially collapsed'),
          initiallyCollapsed: true,
          children: [
            RbyListTile(title: Text('child')),
            RbyListTile(title: Text('child')),
            RbyListTile(title: Text('child')),
            RbyListTile(title: Text('child')),
          ],
        ),
      ],
    );
  }
}
