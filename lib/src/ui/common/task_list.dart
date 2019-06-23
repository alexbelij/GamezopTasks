import 'package:flutter/material.dart';
import 'package:gamez_taskop/src/bloc/home_screen_bloc.dart';
import 'package:gamez_taskop/src/model/task.dart';

import '../single_task_screen.dart';


class CommonTaskList extends StatefulWidget {

  final List<Task> taskList;
  CommonTaskList({this.taskList}):assert(taskList != null);

  @override
  _CommonTaskListState createState() => _CommonTaskListState();
}

class _CommonTaskListState extends State<CommonTaskList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: widget.taskList.length,
      itemBuilder: (context, i) {
        return ListTile(
          key: Key('${widget.taskList[i].taskId} $i'),
          title: Text('${widget.taskList[i].title}'),
          trailing: Checkbox(
              value: widget.taskList[i].isCompleted,
              onChanged: (value) {
                changeTaskState(widget.taskList[i], value);
              }),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return SingleTaskScreen(task: widget.taskList[i]);
            }));
          },
        );
      },
    );
  }

  void changeTaskState(Task task, bool isCompleted) {
    task.setIsCompleted(isCompleted);
    homeScreenBloc.changeTaskState(task);
  }
}
