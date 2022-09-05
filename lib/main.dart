import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(1000); //Estado inicial indicado pela aplicação
  void incrementar() => emit(state + 1);
} //Cubit é uma versão mais simplificada do BLoC

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const MyHomePage(title: 'Exemplo de uso de BLoC/CUBIT'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Quantidade de apertos no botão "Incrementar":',
            ),
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CounterCubit>(context)
              .incrementar(); //Chamar a função "incrementar()" dentro da classe "CounterCubit"
          //O trecho acima também poderia ser escrito da seguinte forma: context.read<CounterCubit>().incrementar();
        },
        tooltip: 'Incremento',
        child: const Icon(Icons.add),
      ),
    );
    ;
  }
}
