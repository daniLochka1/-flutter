abstract class MainScreenState {}

class MainScreenInputState extends MainScreenState {
  final double? mass;
  final double? radius;
  final bool isAgreed;

  MainScreenInputState({this.mass, this.radius, required this.isAgreed});
}

class MainScreenResultState extends MainScreenState {
  final double gravity;

  MainScreenResultState(this.gravity);
}