import 'package:dars_81_home/data/model/group.dart';
import 'package:flutter/material.dart';

class UpdateGroup extends StatefulWidget {
  bool isUpdate;
  Group? group;
  UpdateGroup({super.key,required this.isUpdate,this.group});

  @override
  State<UpdateGroup> createState() => _UpdateGroupState();
}

class _UpdateGroupState extends State<UpdateGroup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("${widget.isUpdate ? "Update Group" : "New group"}"),
      content: Column(
        children: [

        ],
      ),
    );
  }
}
