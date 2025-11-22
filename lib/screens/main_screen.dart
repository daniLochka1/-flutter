import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/main_screen_cubit.dart';
import 'cubit/main_screen_state.dart';

class MainScreen extends StatelessWidget {
  final _massController = TextEditingController();
  final _radiusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Комогорцев Даниил Александрович'),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
          if (state is MainScreenInputState) {
            return _buildInputForm(context, state);
          } else if (state is MainScreenResultState) {
            return _buildResult(context, state);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildInputForm(BuildContext context, MainScreenInputState state) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            controller: _massController,
            decoration: InputDecoration(
              labelText: 'Масса (кг). Для указания степени используйте экспоненциальную запись',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              context.read<MainScreenCubit>().updateMass(value);
            },
          ),
          TextFormField(
            controller: _radiusController,
            decoration: InputDecoration(labelText: 'Радиус (м)'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              context.read<MainScreenCubit>().updateRadius(value);
            },
          ),
          CheckboxListTile(
            title: Text('Согласие на обработку персональных данных'),
            value: state.isAgreed,
            onChanged: (value) {
              context.read<MainScreenCubit>().updateAgreement(value!);
            },
          ),
          ElevatedButton(
            onPressed: state.mass != null && state.radius != null && state.isAgreed
                ? () {
                    context.read<MainScreenCubit>().calculateGravity();
                  }
                : null,
            child: Text('Рассчитать'),
          ),
        ],
      ),
    );
  }

  Widget _buildResult(BuildContext context, MainScreenResultState state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ускорение свободного падения:'),
          Text('${state.gravity.toStringAsFixed(10)} м/с²'),
          ElevatedButton(
            onPressed: () {
              context.read<MainScreenCubit>().returnToInput();
            },
            child: Text('Назад'),
          ),
        ],
      ),
    );
  }
}