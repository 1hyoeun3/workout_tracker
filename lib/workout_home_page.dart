import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/dashboard_card.dart';
import 'package:workout_tracker/landing_page.dart';
import 'package:workout_tracker/workout_manager.dart';

class WorkoutHomePage extends StatefulWidget {
  const WorkoutHomePage({super.key});

  @override
  State<WorkoutHomePage> createState() => _WorkoutHomePageState();
}

class _WorkoutHomePageState extends State<WorkoutHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Just Do It',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          '간단하다. 흔들리면 그것은 지방이다.',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.orange,
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/image/me.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 6,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: DashboardCard(
                        icon: Icon(
                          Icons.fitness_center,
                          size: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.fontSize,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(
                          'Monthly',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        info: Text(
                          '12회',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            child: DashboardCard(
                              icon: Icon(
                                Icons.update,
                                size: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.fontSize,
                                color: Colors.orange,
                              ),
                              title: Text(
                                '오늘운동시간',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              info: Text(
                                '10분',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: DashboardCard(
                              icon: Icon(
                                Icons.fitness_center,
                                size: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.fontSize,
                                color: Colors.orange,
                              ),
                              title: Text(
                                '소모칼로리',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              info: Text(
                                '100Kcal',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                            child: DashboardCard(
                              onTapCallback: () {
                                context.go('/workout_home/workout_list/0');
                              },
                              icon: Icon(
                                Icons.run_circle_outlined,
                                size: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.fontSize,
                                color: Colors.white,
                              ),
                              title: Text(
                                '그룹 1',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                              info: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      WorkoutManager
                                          .workoutGroups[0].groupDescription,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child:
                                        Image.asset('assets/image/sample1.png'),
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.orange,
                            ),
                            width: 250),
                        SizedBox(
                            child: DashboardCard(
                              onTapCallback: () {
                                context.go('/workout_home/workout_list/1');
                              },
                              icon: Icon(
                                Icons.rowing_outlined,
                                size: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.fontSize,
                                color: Colors.white,
                              ),
                              title: Text(
                                '그룹 2',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                              info: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      WorkoutManager
                                          .workoutGroups[1].groupDescription,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                  Image.asset('assets/image/sample2.png'),
                                ],
                              ),
                              backgroundColor: Colors.teal,
                            ),
                            width: 250),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: DashboardCard(
                  onTapCallback: () {
                    if (WorkoutManager.currentWorkoutGroupIndex == null) return;
                    context.go(
                        '/workout_home/workout_list/${WorkoutManager.currentWorkoutGroupIndex}');
                  },
                  icon: Icon(
                    Icons.fitness_center,
                    size: Theme.of(context).textTheme.headlineLarge?.fontSize,
                    color: Colors.orange,
                  ),
                  title: Text(
                    '운동 이어서 하기',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.orange),
                  ),
                  info: Text(
                    '당신의 몸은 해 낼 수 있다. 당신의 마음만 설득하면 된다.',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  backgroundColor: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
