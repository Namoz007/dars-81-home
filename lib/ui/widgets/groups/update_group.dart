import 'package:dars_81_home/bloc/admin_bloc/admin_bloc.dart';
import 'package:dars_81_home/bloc/admin_bloc/admin_bloc_event.dart';
import 'package:dars_81_home/bloc/admin_bloc/admin_bloc_state.dart';
import 'package:dars_81_home/bloc/group_bloc/group_bloc.dart';
import 'package:dars_81_home/bloc/group_bloc/group_bloc_event.dart';
import 'package:dars_81_home/data/model/group.dart';
import 'package:dars_81_home/data/model/teacher.dart';
import 'package:dars_81_home/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateGroup extends StatefulWidget {
  bool isUpdate;
  Group? group;
  UpdateGroup({super.key, required this.isUpdate, this.group});

  @override
  State<UpdateGroup> createState() => _UpdateGroupState();
}

class _UpdateGroupState extends State<UpdateGroup> {
  final _fromKey = GlobalKey<FormState>();
  final _groupNewName = TextEditingController();
  Teacher? _mainTeacher;
  Teacher? _assistantTeacher;
  Student _selectStudent = Student(id: 0, name: "Choose Students");
  List<Student> _students = [];
  List<int> studentsId = [];
  String? error;

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate) {
      _mainTeacher = widget.group!.mainTeacher;
      _assistantTeacher = widget.group!.assistantTeacher;
      _groupNewName.text = widget.group!.name;
      _students = widget.group!.students;
      studentsId.addAll(widget.group!.students.map((_element) => _element.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("${widget.isUpdate ? "Update Group" : "New group"}"),
      content: BlocBuilder<AdminBloc, AdminBlocState>(
        builder: (context, state) {
          if (state is LoadedAllTeachersStudentsAdminBlocState) {
            if (!widget.isUpdate &&
                state.teachers.isNotEmpty &&
                _mainTeacher == null) {
              _mainTeacher = state.teachers.first;
            }

            if (!widget.isUpdate &&
                state.teachers.length > 1 &&
                _assistantTeacher == null) {
              _assistantTeacher = state.teachers
                  .firstWhere((teacher) => teacher.id != _mainTeacher?.id);
            }

            List<Teacher> availableTeachers = state.teachers
                .where((teacher) =>
                    teacher.id != _mainTeacher?.id &&
                    teacher.id != _assistantTeacher?.id)
                .toList();

            return state.teachers.length < 2 || state.students.isEmpty
                ? const Center(
                    widthFactor: 100,
                    child: Text(
                      "You cannot create a group",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  )
                : Form(
                    key: _fromKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please input group name";
                            }
                            return null;
                          },
                          controller: _groupNewName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Group name',
                          ),
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<Teacher>(
                          value: _mainTeacher,
                          decoration: const InputDecoration(
                            labelText: 'Main Teacher',
                          ),
                          items: [
                            DropdownMenuItem(
                              value: _mainTeacher,
                              child: Text(
                                _mainTeacher != null
                                    ? '${_mainTeacher!.name}'
                                    : 'Choose main teacher',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            ...availableTeachers.map(
                              (teacher) => DropdownMenuItem<Teacher>(
                                value: teacher,
                                child: Text(
                                  teacher.name,
                                  style: TextStyle(
                                    color: teacher.id ==
                                            widget.group?.mainTeacher.id
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _mainTeacher = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<Teacher>(
                          value: _assistantTeacher,
                          decoration: const InputDecoration(
                            labelText: 'Assistant Teacher',
                          ),
                          items: [
                            DropdownMenuItem(
                              value: _assistantTeacher,
                              child: Text(
                                _assistantTeacher != null
                                    ? '${_assistantTeacher!.name}'
                                    : 'Choose assistant teacher',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            ...availableTeachers.map(
                              (teacher) => DropdownMenuItem<Teacher>(
                                value: teacher,
                                child: Text(
                                  teacher.name,
                                  style: TextStyle(
                                    color: teacher.id ==
                                            widget.group?.assistantTeacher.id
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _assistantTeacher = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<Student>(
                          value: _selectStudent,
                          decoration: const InputDecoration(
                            labelText: 'Students',
                          ),
                          items: [
                            DropdownMenuItem(
                              value: _selectStudent,
                              child: const Text(
                                'Choose students',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            ...state.students.map(
                              (student) => DropdownMenuItem<Student>(
                                value: student,
                                child: Text(
                                  student.name,
                                  style: TextStyle(
                                    color: studentsId.contains(student.id)
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              if (studentsId.contains(value!.id)) {
                                studentsId.remove(value.id);
                                _students.removeWhere(
                                    (element) => element.id == value.id);
                              } else {
                                studentsId.add(value.id);
                                _students.add(value);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  );
          }
          return const CircularProgressIndicator();
        },
      ),
      actions: [
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        FilledButton(
          onPressed: () {
            if (_fromKey.currentState!.validate()) {
              if (widget.isUpdate) {
                widget.group!.students = _students;
                widget.group!.name = _groupNewName.text;
                widget.group!.assistantTeacher = _assistantTeacher!;
                widget.group!.mainTeacher = _mainTeacher!;
                widget.group!.updatedAt = DateTime.now();
                widget.group!.mainTeacherId = _mainTeacher!.id;
                widget.group!.assistantTeacherId = _assistantTeacher!.id;
                context
                    .read<GroupBloc>()
                    .add(UpdateGroupBlocEvent(widget.group!));
              } else {
                final group = Group(
                  id: 0,
                  name: _groupNewName.text,
                  mainTeacherId: _mainTeacher!.id,
                  assistantTeacherId: _assistantTeacher!.id,
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                  mainTeacher: _mainTeacher!,
                  assistantTeacher: _assistantTeacher!,
                  students: _students,
                );
                context.read<GroupBloc>().add(CreateNewGroupBlocEvent(group));
              }
              Navigator.pop(context);
            }
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
