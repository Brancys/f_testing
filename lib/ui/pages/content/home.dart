import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../authentication/login.dart';
import 'detail.dart';

class HomePage extends StatelessWidget {
  const HomePage(
      {Key? key, required this.loggedEmail, required this.loggedPassword})
      : super(key: key);
  final String loggedEmail;
  final String loggedPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home"),
        actions: [
          IconButton(
              key: const Key('ButtonHomeLogOff'),
              onPressed: () {
                Get.off(() => LoginScreen(
                      key: const Key('LoginScreen'),
                      email: loggedEmail,
                      password: loggedPassword,
                    ));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(key: const Key('TextHomeHello'), "Hello $loggedEmail"),
            ElevatedButton(
                key: const Key('ButtonHomeDetail'),
                onPressed: () {
                  Get.to(() => const DetailPage(
                        key: Key('DetailPage'),
                      ));
                },
                child: const Text("Details")),
          ],
        ),
      ),
    );
  }
}
