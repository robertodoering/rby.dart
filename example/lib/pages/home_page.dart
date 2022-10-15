import 'package:example/pages/animations_page.dart';
import 'package:example/pages/material_widgets_page.dart';
import 'package:example/pages/typography_page.dart';
import 'package:example/pages/widgets_page.dart';
import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const RbySliverAppBar(title: Text('rby_widgets')),
          SliverList(
            delegate: SliverChildListDelegate([
              RbyListTile(
                title: const Text('typography'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const TypographyPage(),
                  ),
                ),
              ),
              RbyListTile(
                title: const Text('widgets'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const WidgetsPage(),
                  ),
                ),
              ),
              RbyListTile(
                title: const Text('animations'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const AnimationsPage(),
                  ),
                ),
              ),
              RbyListTile(
                title: const Text('material'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const MaterialWidgetsPage(),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
