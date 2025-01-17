import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, this.argument, this.device, this.id, this.name});
  final String? argument, device, id, name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SeCond'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(argument ?? ''),
            Text('Device: $device'),
            Text('id: $id'),
            Text('name: $name')
          ],
        ),
      ),
    );
  }
}
