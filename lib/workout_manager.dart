import 'package:workout_tracker/workout.dart';
import 'package:workout_tracker/workout_group.dart';

class WorkoutManager {
  static int? currentWorkoutGroupIndex;
  static final List<Workout> workouts = [
    Workout(
        name: '스쿼트',
        minutes: 30,
        imageName: 'squat.jpeg',
        audioName: 'squat.mp3',
        kcal: 200),
    Workout(
        name: '사이드런지',
        minutes: 20,
        imageName: 'side_lunge.jpeg',
        audioName: 'side_lunge.mp3',
        kcal: 100),
    Workout(
        name: '푸쉬업',
        minutes: 15,
        imageName: 'pushup.jpeg',
        audioName: 'pushup.mp3',
        kcal: 100),
    Workout(
        name: '마운틴클림버',
        minutes: 15,
        imageName: 'mountain_climber.jpeg',
        audioName: 'mountain_climber.mp3',
        kcal: 50),
    Workout(
        name: '런지',
        minutes: 20,
        imageName: 'lunge.jpeg',
        audioName: 'lunge.mp3',
        kcal: 100),
    Workout(
        name: '덤벨컬',
        minutes: 40,
        imageName: 'dumbell_curl.jpeg',
        audioName: 'dumbell_curl.mp3',
        kcal: 200),
    Workout(
        name: '덩키킥',
        minutes: 30,
        imageName: 'donkey_kick.jpeg',
        audioName: 'donkey_kick.mp3',
        kcal: 50),
    Workout(
        name: '친업',
        minutes: 25,
        imageName: 'chinup.jpeg',
        audioName: 'chinup.mp3',
        kcal: 300),
    Workout(
        name: '벤치프레스',
        minutes: 1,
        imageName: 'benchpress.jpeg',
        audioName: 'benchpress.mp3',
        kcal: 250),
  ];

  static final List<WorkoutGroup> workoutGroups = [
    WorkoutGroup(
      groupDescription: '아침을 여는 5가지 운동 프로그램',
      workouts: List.generate(
        5,
        (index) => WorkoutManager.workouts[index],
      ),
    ),
    WorkoutGroup(
      groupDescription: '근력을 키우는 7가지 운동 프로그램',
      workouts: List.generate(
        7,
        (index) {
          final List<int> indexList = [0, 2, 3, 4, 5, 7, 8];
          return WorkoutManager.workouts[indexList.elementAt(index)];
        },
      ),
    ),
  ];
}
