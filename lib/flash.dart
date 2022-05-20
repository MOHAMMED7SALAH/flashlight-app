import 'package:flutter/material.dart';

class FlashLight extends StatelessWidget{
  const FlashLight({Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text("Front Flash Light")),
      body: Container( 
          width:double.infinity,
          height:MediaQuery.of(context).size.height,
          color: Colors.white,
      )
    );
  }

  

}