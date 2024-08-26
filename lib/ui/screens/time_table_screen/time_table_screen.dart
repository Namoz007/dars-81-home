import 'package:dars_81_home/bloc/time_table_bloc/time_table_bloc.dart';
import 'package:dars_81_home/bloc/time_table_bloc/time_table_bloc_event.dart';
import 'package:dars_81_home/main.dart';
import 'package:dars_81_home/ui/widgets/dashboard/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({super.key});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {

  @override
  void initState() {
    super.initState();
    context.read<TimeTableBloc>().add(GetAllTimeTableBlocEvent());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Tables"),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
