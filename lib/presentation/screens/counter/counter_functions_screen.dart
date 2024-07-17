import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  //Invocacion de otra clase que es la creacion del widget que teniamos al momento
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Functions Screen'),
          /* //? Leading: al lado izquierdo solo permite un widget
         leading: IconButton(
             onPressed: () {  }, 
             icon: const Icon(Icons.refresh_rounded),
          ),
        */
          //? Actions: Permite varios widgets
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
              icon: const Icon(Icons.refresh_rounded),
            )
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter Screen'),
            Text(
              '$clickCounter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
                //(clickCounter>1 )?'Clicks':'Click' ,  //*La forma en que lo hice
                'Click${clickCounter == 1 ? '' : 's'}', //* La forma correcta
                style: const TextStyle(fontSize: 25)),
          ],
        )),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_outlined,
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),

            const SizedBox(height: 10), //* Espacio

             CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPressed: () {
                setState(() {
                  if (clickCounter > 0) {
                    clickCounter--;
                  }
                });
              },
            ),
            const SizedBox(height: 10), //* Espacio

            CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  clickCounter++;
                 
                });
              },
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  /*  final: para decirle que no cambia
      IconData es el tipo de data 
      icon: Nombre de la variable 
  */
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(), //*Para redondear
      enableFeedback: true, //Para agregar vibracion al boton
      elevation: 5,//sombra
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}