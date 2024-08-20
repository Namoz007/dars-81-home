import 'package:dars_81_home/bloc/authentication/authentIcation_event.dart';
import 'package:dars_81_home/bloc/authentication/authentication_bloc.dart';
import 'package:dars_81_home/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppbarTitle extends StatefulWidget {
  const AppbarTitle({super.key});

  @override
  State<AppbarTitle> createState() => _AppbarTitleState();
}

class _AppbarTitleState extends State<AppbarTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("assets/svgs/logo.svg"),
        Row(
          children: [
            InkWell(
              onTap: (){
                context.read<AuthenticationBloc>().add(LogOutAuthenticationEvent());
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp(userIsFind: false)));
              },
              child: const Icon(Icons.logout),
            ),
            const Icon(Icons.search),
            const SizedBox(width: 25,),
            const Icon(Icons.notifications),
            const SizedBox(width: 25,),
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage("https://klike.net/uploads/posts/2023-01/1674365337_3-31.jpg"),),
              ),
            )
          ],
        )
      ],
    );
  }
}
