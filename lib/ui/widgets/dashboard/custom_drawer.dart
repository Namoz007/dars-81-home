import 'package:dars_81_home/bloc/authentication/authentIcation_event.dart';
import 'package:dars_81_home/bloc/authentication/authentication_bloc.dart';
import 'package:dars_81_home/bloc/user_bloc/user_bloc.dart';
import 'package:dars_81_home/bloc/user_bloc/user_bloc_event.dart';
import 'package:dars_81_home/main.dart';
import 'package:dars_81_home/ui/screens/admin_screen/admin_screen.dart';
import 'package:dars_81_home/ui/screens/authentication/sign_in_screen.dart';
import 'package:dars_81_home/ui/screens/dashboards/dashboard.dart';
import 'package:dars_81_home/ui/screens/groups_screen/groups_screen.dart';
import 'package:dars_81_home/ui/screens/rooms/rooms_screen.dart';
import 'package:dars_81_home/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 50,),
          InkWell(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
            },
            child: const ListTile(
              title: Text("Dashboar"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          AppUtils.userModel!.roleId == 3 ? InkWell(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminScreen()));
            },
            child: const ListTile(
              title: Text("Admin Panel"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ) : const SizedBox(),

          InkWell(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GroupsScreen()));
            },
            child: const ListTile(
              title: Text("Groups"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RoomsScreen()));
            },
            child: ListTile(
              title: const Text("Rooms"),
              trailing:const  Icon(Icons.arrow_forward_ios),
            ),
          ),

          InkWell(
            onTap: (){
              context.read<AuthenticationBloc>().add(LogOutAuthenticationEvent());
              context.read<UserBloc>().add(LogOutUserBlocEvent());
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            child: const ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.logout),
            ),
          ),

        ],
      ),
    );
  }
}
