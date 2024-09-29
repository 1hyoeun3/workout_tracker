import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:workout_tracker/workout.dart';
import 'package:workout_tracker/workout_manager.dart';

class WorkoutGuidePage extends StatefulWidget {
  int workoutsIndex;
  int groupIndex;
  WorkoutGuidePage(
      {super.key, required this.workoutsIndex, required this.groupIndex});

  @override
  State<WorkoutGuidePage> createState() => _WorkoutGuidePageState();
}

class _WorkoutGuidePageState extends State<WorkoutGuidePage> {
  final player = AudioPlayer();
  List<Workout> workouts = WorkoutManager.workouts;

  IconButton getIconButton() {
    if (player.state == PlayerState.playing) {
      return IconButton(
        iconSize: Theme.of(context).textTheme.displayLarge?.fontSize,
        onPressed: () async {
          await player.stop();
          setState(() {});
        },
        icon: Icon(Icons.stop_circle),
      );
    } else {
      return IconButton(
        iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
        onPressed: () async {
          await player.play(
            AssetSource('${currentWorkout.audioName}'),
          );
          setState(() {});
        },
        icon: Icon(Icons.play_circle),
      );
    }
  }

  late Workout currentWorkout;
  int workoutIndex = 0;

  @override
  void initState() {
    super.initState();
    workouts = WorkoutManager.workoutGroups[widget.groupIndex].workouts;
    workoutIndex = widget.workoutsIndex;
    currentWorkout = workouts[workoutIndex];
    player.onPlayerComplete.listen((event) {
      setState(() {});
    });
  }

  void forwardWorkout() {
    if (workoutIndex < workouts.length) {
      workoutIndex++;
    } else {
      workoutIndex = 0;
    }
    currentWorkout = workouts[workoutIndex];
  }

  void backWorkout() {
    if (workoutIndex > 0) {
      workoutIndex--;
    } else {
      workoutIndex = workouts.length - 1;
    }
    currentWorkout = workouts[workoutIndex];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorkoutGuide'),
        centerTitle: true,
        backgroundColor:
            Theme.of(context).colorScheme?.primary.withOpacity(0.4),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${currentWorkout.name}',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Row(
            children: [
              IconButton(
                iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
                onPressed: () async {
                  await player.stop();
                  setState(() {
                    backWorkout();
                  });
                },
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              Expanded(
                child: Image(
                  alignment: Alignment.center,
                  image: AssetImage('assets/image/${currentWorkout.imageName}'),
                ),
              ),
              IconButton(
                iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
                onPressed: () async {
                  await player.stop();
                  setState(() {
                    forwardWorkout();
                  });
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          Text(
            '${currentWorkout.minutes}분',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          getIconButton(),
        ],
      ),
    );
  }

  void dispose() {
    player.dispose();
    super.dispose();
  }
}
