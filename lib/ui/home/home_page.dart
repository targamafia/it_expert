import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "IT Expert",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {},
                child: Image.network(
                  'https://buffer.com/library/content/images/2020/05/Kevan-Lee.png',
                  width: 40,
                  height: 40,
                ),
              ))
        ],
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
      ),
      resizeToAvoidBottomInset: false,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Center(child: Text("HomePage")),
        ),
      ),
    );
  }
}
