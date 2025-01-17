import 'package:admin_ecommerce_app/app/router/app_routers.dart';
import 'package:admin_ecommerce_app/app/router/routers_name.dart';
import 'package:admin_ecommerce_app/pages/second_page/second_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
                'Simple Navigation: Default Flutter Navigator vs GoRouter'),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondPage()));
                  },
                  child: const Text('Default Navigator')),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    context.go(RouterName.secondPage);
                  },
                  child: const Text('Default Navigator')),
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(),
            const Text('Named Navigation: GoRouter Named Navigator'),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed(RouterName.secondPage);
                  },
                  child: const Text('GoRouter Named Navigation')),
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(),
            const Text('Page Data between screen - goRouter'),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed(RouterName.secondPage,
                        extra: 'GoRouter is fun with MarshalDev');
                  },
                  child: const Text('GoRouter Pass Data')),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    context.go(
                        '${RouterName.secondPage}?device=Mobile&id=2001&name=Marshal');
                  },
                  child: const Text('GoRouter Pass Data in URL')),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                  onPressed: () {
                    context.go(
                        '${RouterName.secondPage}?device=Mobile&id=2001&name=Marshal',
                        extra: 'MarshalDev');
                  },
                  child: const Text('GoRouter Pass Data URL with argument')),
            ),
          ],
        ),
      ),
    );
  }
}
