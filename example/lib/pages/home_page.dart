import 'package:example/pages/animations_page.dart';
import 'package:example/pages/material_widgets_page.dart';
import 'package:example/pages/typography_page.dart';
import 'package:example/pages/widgets_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('rby_widgets')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('typography'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const TypographyPage(),
              ),
            ),
          ),
          ListTile(
            title: const Text('widgets'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const WidgetsPage(),
              ),
            ),
          ),
          ListTile(
            title: const Text('animations'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const AnimationsPage(),
              ),
            ),
          ),
          ListTile(
            title: const Text('material'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const MaterialWidgetsPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
