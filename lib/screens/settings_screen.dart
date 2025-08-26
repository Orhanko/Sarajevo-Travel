import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // shadow rješavamo ručno ispod
        centerTitle: true,
        title: Image.asset('assets/logo/logotip.png', height: 36, fit: BoxFit.contain),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.8),
          child: Container(
            height: 0.8,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey.withAlpha(Theme.of(context).brightness == Brightness.dark ? 80 : 200)),
              ],
            ),
          ),
        ),
      ),
      body: Center(child: Text('Screen za postavke')),
    );
  }
}
