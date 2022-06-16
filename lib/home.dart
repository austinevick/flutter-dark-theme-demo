import 'package:flutter/material.dart';

import 'app_notifier.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getDarkTheme();
    super.initState();
  }

  Future<void> getDarkTheme() async {
    int? p = await AppNotifier.getDarkTheme1();
    print(p);
    setState(() => AppNotifier.themeNotifier1.value = p!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          ValueListenableBuilder<bool>(
              valueListenable: AppNotifier.themeNotifier,
              builder: (ctx, mode, _) => Switch(
                  value: mode,
                  activeColor: Colors.white,
                  onChanged: (val) async {
                    AppNotifier.themeNotifier.value =
                        mode == false ? true : false;
                    print(val);
                    AppNotifier.saveDarkTheme(val);
                  })),
          ValueListenableBuilder<bool>(
              valueListenable: AppNotifier.themeNotifier,
              builder: (ctx, mode, _) => IconButton(
                  onPressed: () async {
                    final value = AppNotifier.themeNotifier.value =
                        mode == false ? true : false;
                    print(value);
                    AppNotifier.saveDarkTheme(value);
                  },
                  icon: Icon(
                      !mode ? Icons.brightness_low : Icons.brightness_high))),
          ValueListenableBuilder<int>(
              valueListenable: AppNotifier.themeNotifier1,
              builder: (ctx, mode, _) => IconButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (ctx) => Dialog(
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none),
                            child: SizedBox(
                              height: 250,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  const SizedBox(height: 10),
                                  const Text('Select theme',
                                      style: TextStyle(fontSize: 22)),
                                  const Divider(thickness: 1.8),
                                  const SizedBox(height: 20),
                                  MaterialButton(
                                    onPressed: () {
                                      var p = AppNotifier.themeNotifier1.value =
                                          mode;
                                      print(p);

                                      AppNotifier.saveDarkTheme1(0);
                                    },
                                    child: const Text('Set light theme'),
                                    height: 60,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    minWidth: double.infinity,
                                  ),
                                  const SizedBox(height: 10),
                                  MaterialButton(
                                    onPressed: () {
                                      var p = AppNotifier.themeNotifier1.value =
                                          mode;
                                      print(p);
                                      AppNotifier.saveDarkTheme1(1);
                                    },
                                    child: const Text('Set dark theme'),
                                    height: 60,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    minWidth: double.infinity,
                                  )
                                ]),
                              ),
                            ),
                          )),
                  icon: const Icon(Icons.more_vert)))
        ]),
        body: ListView.separated(
            itemBuilder: (ctx, i) => ListTile(title: Text('Item $i')),
            separatorBuilder: (ctx, i) => const Divider(),
            itemCount: 30));
  }
}
