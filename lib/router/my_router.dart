import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/frame_page.dart';
import 'package:workout_tracker/landing_page.dart';
import 'package:workout_tracker/login_page.dart';
import 'package:workout_tracker/settings_page.dart';
import 'package:workout_tracker/workout_guide_page.dart';
import 'package:workout_tracker/workout_home_page.dart';
import 'package:workout_tracker/workout_list_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'homeTab');
final GlobalKey<NavigatorState> _settingsTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'settingsTab');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LandingPage(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state, navigationShell) {
        return FramePage(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/workout_home',
              builder: (context, state) => WorkoutHomePage(),
              routes: [
                GoRoute(
                  path: 'workout_list/:group_index',
                  builder: (context, state) {
                    String? groupIndexString =
                        state.pathParameters['group_index'];
                    final groupIndex = int.parse(groupIndexString!);
                    return WorkoutListPage(groupIndex: groupIndex);
                  },
                  routes: [
                    GoRoute(
                      path: 'workout_guide/:workouts_index',
                      builder: (context, state) {
                        String? workoutsIndexString =
                            state.pathParameters['workouts_index'];
                        final workoutsIndex = int.parse(workoutsIndexString!);

                        String? groupIndexString =
                            state.pathParameters['group_index'];
                        final groupIndex = int.parse(groupIndexString!);

                        return WorkoutGuidePage(
                            workoutsIndex: workoutsIndex,
                            groupIndex: groupIndex);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) {
                return SettingsPage();
              },
              routes: [
                GoRoute(
                  path: 'login',
                  builder: (context, state) {
                    return LoginPage();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    // GoRoute(
    //   path: '/workout_home',
    //   builder: (context, state) {
    //     return WorkoutHomePage();
    //   },
    //   routes: [
    //     GoRoute(
    //       path: 'workout_list/:group_index',
    //       builder: (context, state) {
    //         String? groupIndexString = state.pathParameters['group_index'];
    //         int groupIndex = int.parse(groupIndexString!);
    //         return WorkoutListPage(
    //           groupIndex: groupIndex,
    //         );
    //       },
    //       routes: [
    //         GoRoute(
    //           path: 'workout_guide/:workout_index',
    //           builder: (context, state) {
    //             String? workoutsIndexString =
    //                 state.pathParameters['workouts_index'];
    //             final workoutsIndex = int.parse(workoutsIndexString!);
    //             String? groupIndexString = state.pathParameters['group_index'];
    //             int groupIndex = int.parse(groupIndexString!);
    //             return WorkoutGuidePage(
    //               workoutsIndex: workoutsIndex,
    //               groupIndex: groupIndex,
    //             );
    //           },
    //         )
    //       ],
    //     ),
    //   ],
    // ),
  ],
);
