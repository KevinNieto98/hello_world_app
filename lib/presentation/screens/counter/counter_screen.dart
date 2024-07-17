import 'package:flutter/material.dart';

class CounnterScreen extends StatefulWidget {
  const CounnterScreen({super.key});

  @override
  //Invocacion de otra clase que es la creacion del widget que teniamos al momento
  State<CounnterScreen> createState() => _CounnterScreenState();
}

class _CounnterScreenState extends State<CounnterScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Counter Screen'),
          Text(
            '$clickCounter',
            style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
          ),
           Text(
            //(clickCounter>1 )?'Clicks':'Click' ,  //*La forma en que lo hice
            'Click${ clickCounter == 1 ? '': 's'}', //* La forma correcta 
            style:  const TextStyle(fontSize: 25)
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clickCounter = clickCounter + 1; //*Forma larga
            //clickCounter +=  1; Forma corta
            //clickCounter ++; Forma corta
          });
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
