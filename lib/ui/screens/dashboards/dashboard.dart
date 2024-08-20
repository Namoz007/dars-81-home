import 'package:dars_81_home/bloc/user_bloc/user_bloc.dart';
import 'package:dars_81_home/bloc/user_bloc/user_bloc_event.dart';
import 'package:dars_81_home/bloc/user_bloc/user_bloc_state.dart';
import 'package:dars_81_home/main.dart';
import 'package:dars_81_home/ui/widgets/dashboard/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetMyUserBlocEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         toolbarHeight: 100,
        title: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: const AppbarTitle(),
        ),
      ),
      body: BlocBuilder<UserBloc, UserBlocState>(
        builder: (context, state) {

          if(state is LoadingUserBlocState){
            return const Center(child: CircularProgressIndicator(color: Colors.red,),);
          }

          if(state is LoadedUserBlocState){
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome back, ${state.model.name}!",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Dashboard",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 36,),),
                  ],
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
