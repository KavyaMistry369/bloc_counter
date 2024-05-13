import 'package:bloc_counter/bloc/counter_bloc.dart';
import 'package:bloc_counter/events/counter_event.dart';
import 'package:bloc_counter/states/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Bloc"),
      ),
      body: Padding(padding: const EdgeInsets.all(16),child:BlocBuilder<CounterBloc,CounterState>(
        builder: (context, state){
         if(state is InitialState){
           return const Center(
             child: Text("0",style: TextStyle(fontSize: 30),),
           );
         }
         if(state is UpdateState){
           return Center(
             child: Text("${state.counter}",style: const TextStyle(fontSize: 30),),
           );
         }
         return Container();
        }
      ),),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            context.read<CounterBloc>().add(IncrementEvent());
          },child: const Icon(Icons.plus_one_outlined),),
          const SizedBox(width: 10,),
          FloatingActionButton(onPressed: (){
            context.read<CounterBloc>().add(DecrementEvent());
          },child: const Icon(Icons.exposure_minus_1),),
        ],
      ),
    );
  }
}
