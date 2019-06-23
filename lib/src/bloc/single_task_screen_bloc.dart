import 'package:gamez_taskop/src/model/task.dart';
import 'package:gamez_taskop/src/resources/task_api_provider.dart';

import 'home_screen_bloc.dart';

class SingleTaskScreenBloc {


  Future<int> updateTask(Task task) async {
    int updatedRowCount = await taskApiProvider.updateTask(task);
    homeScreenBloc.getAllTasks(task.isCompleted? 1: 0);
    return updatedRowCount;
  }

  Future<int> deleteTask(Task task) async {
    int deletedRowCount =  await taskApiProvider.deleteTask(task);
    print('${task.isCompleted}');
    homeScreenBloc.getAllTasks(task.isCompleted? 1: 0);
    return deletedRowCount;
  }

  void dispose() {

  }
}

var singleTaskBloc = SingleTaskScreenBloc();