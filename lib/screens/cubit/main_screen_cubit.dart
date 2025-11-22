import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInputState(isAgreed: false));

  double? mass;
  double? radius;
  bool isAgreed = false;

  void updateMass(String value) {
    mass = double.tryParse(value);
    emit(MainScreenInputState(mass: mass, radius: radius, isAgreed: isAgreed));
  }

  void updateRadius(String value) {
    radius = double.tryParse(value);
    emit(MainScreenInputState(mass: mass, radius: radius, isAgreed: isAgreed));
  }

  void updateAgreement(bool value) {
    isAgreed = value;
    emit(MainScreenInputState(mass: mass, radius: radius, isAgreed: isAgreed));
  }

  void calculateGravity() {
    if (mass == null || radius == null || !isAgreed) return;

    const G = 6.67430e-11;
    final gravity = G * mass! / (radius! * radius!);
    emit(MainScreenResultState(gravity));
  }

  void returnToInput() {
    emit(MainScreenInputState(mass: mass, radius: radius, isAgreed: isAgreed));
  }
}