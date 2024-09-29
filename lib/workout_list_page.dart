import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/landing_page.dart';
import 'package:workout_tracker/workout.dart';
import 'package:workout_tracker/workout_manager.dart';

class WorkoutListPage extends StatelessWidget {
  int groupIndex;

  WorkoutListPage({super.key, required this.groupIndex}) {
    WorkoutManager.currentWorkoutGroupIndex = groupIndex;
  }

  List<String> workoutName = [
    '스쿼트',
    '사이드런지',
    '푸쉬업',
    '마운틴클림버',
    '런지',
    '덤벨컬',
    '덩키킥',
    '친업',
    '벤치프레스',
  ];

  List<String> workoutImage = [
    'squat',
    'side_lunge',
    'pushup',
    'mountain_climber',
    'lunge',
    'dumbell_curl',
    'donkey_kick',
    'chinup',
    'benchpress',
  ];

  List<int> workoutMinutes = [
    30,
    20,
    15,
    15,
    20,
    40,
    30,
    25,
    10,
  ];

  List<Widget> getWorkoutList(BuildContext context) {
    List<Workout> workouts = WorkoutManager.workoutGroups[groupIndex].workouts;
    List<Widget> workoutListView = [];
    for (var elements in workouts) {
      var index = workouts.indexOf(elements);
      workoutListView.add(
        GestureDetector(
          onTap: () {
            context.go(
                '/workout_home/workout_list/$groupIndex/workout_guide/$index');
          },
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:
                        AssetImage('assets/image/${elements.imageName}.jpeg'),
                  ),
                ),
              ),
              Expanded(
                child: Text('${index + 1}. ${elements.name}',
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              Text(
                '${elements.minutes}분',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        ),
      );
    }
    ;
    return workoutListView;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorkOutList'),
        centerTitle: true,
      ),
      body: ListView(
        children: getWorkoutList(context),
      ),
    );
  }
}
