import 'package:dars_81_home/bloc/admin_bloc/admin_bloc.dart';
import 'package:dars_81_home/bloc/admin_bloc/admin_bloc_event.dart';
import 'package:dars_81_home/bloc/admin_bloc/admin_bloc_state.dart';
import 'package:dars_81_home/ui/widgets/admin_screen/show_group.dart';
import 'package:dars_81_home/ui/widgets/admin_screen/update_group.dart';
import 'package:dars_81_home/ui/widgets/dashboard/custom_drawer.dart';
import 'package:dars_81_home/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AdminBloc>().add(GetAllMyGroupsAdminBlocEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups'),
        centerTitle: true,
        actions: [
          AppUtils.userModel!.roleId == 3 ? InkWell(
            onTap: (){
              showDialog(context: context, builder: (context) => UpdateGroup(isUpdate: false));
            },
            child: const Icon(Icons.add),
          ) : const SizedBox(),
          const SizedBox(width: 10,),
        ],
      ),
      drawer: const CustomDrawer(),
      body: BlocBuilder<AdminBloc, AdminBlocState>(
        builder: (context, state) {
          if (state is LoadingAdminBlocState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }

          if (state is LoadedAllGroups) {
            return ListView.builder(
              itemCount: state.groups.length,
              itemBuilder: (context, index) {
                return ShowGroup(group: state.groups[index],);
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
