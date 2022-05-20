import 'package:flashlight/flash.dart';
import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
     
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Container(
                height: size.height * 0.3,
                width: size.width * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/torch.png'))
                ),
              ),
              InkWell(
                onTap: () {
                  _turnOnFlash(context);
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    height: size.height * 0.1,
                    width: size.width * 0.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.flash_on,
                          color: Colors.green,
                          size: 36,
                        ),
                        Text(
                          "Flashlight Turn ON",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: size.height * 0.05),
              InkWell(
                onTap: () {
                  _turnOffFlash(context);
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    height: size.height * 0.1,
                    width: size.width * 0.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.flash_off,
                          color: Colors.red,
                          size: 36,
                        ),
                        Text(
                          "Flashlight Turn OFF",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: size.height * 0.05),
              InkWell(
                onTap: () {
                  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const FlashLight()),
  );
                  
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    height: size.height * 0.1,
                    width: size.width * 0.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.phone_android_rounded,
                          color: Colors.white,
                          size: 36,
                        ),
                        Text(
                          "Front Flashlight",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _turnOnFlash(BuildContext context) async {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      _showErrorMes('Could not enable Flashlight', context);
    }
  }

  Future<void> _turnOffFlash(BuildContext context) async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      _showErrorMes('Could not enable Flashlight', context);
    }
  }

  void _showErrorMes(String mes, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mes)));
  }
}
