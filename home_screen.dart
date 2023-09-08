import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Application> _apps = [];

  @override
  void initState() {
    super.initState();
    _getApps();
  }

  Future<void> _getApps() async {
    List<Application> apps =
    await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    );
    List<ApplicationWithIconAndSize> appsWithSize = [];

    for (var i = 0; i < apps.length; i++) {
      final app = apps[i];
      final appDir = await getApplicationDocumentsDirectory();
      final appSize = await _getAppSize(appDir.path + '/' + app.packageName);

      appsWithSize.add(ApplicationWithIconAndSize(
        app,
        app.icon,
        appSize,
      ));
    }

    appsWithSize.sort((a, b) => b.appSize.compareTo(a.appSize));

    setState(() {
      _apps = appsWithSize.map((e) => e.application).take(5).toList();
    });
  }

  Future<int> _getAppSize(String appDirPath) async {
    final appDir = Directory(appDirPath);
    if (await appDir.exists()) {
      int size = 0;
      await for (final FileSystemEntity entity in appDir.list(recursive: true, followLinks: false)) {
        if (entity is File) {
          size += await entity.length();
        }
      }
      return size;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage Usage'),
      ),
      body: ListView.builder(
        itemCount: _apps.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.memory(
              _apps[index].icon,
              width: 20,
              height: 20,
            ),
            title: Text(_apps[index].appName),
            subtitle: Text('${_apps[index].extraData['appSize'] ~/ 1000000} MB'),
          );
        },
      ),
    );
  }
}

class ApplicationWithIconAndSize {
  final Application application;
  final List<int> icon;
  final int appSize;

  ApplicationWithIconAndSize(this.application, this.icon, this.appSize);
}
class BrinjalAnimation extends StatefulWidget {
  @override
  _BrinjalAnimationState createState() => _BrinjalAnimationState();
}

class _BrinjalAnimationState extends State<BrinjalAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // declare as late
  late Animation<double> _animation; // declare as late

  _BrinjalAnimationState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 0.0, end: 300.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: _animation.value,
          width: _animation.value,
          child: Image.asset('images/brinjal.png'),
        ),
      ),
    );
  }
}
