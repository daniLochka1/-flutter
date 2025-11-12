import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formKey = GlobalKey<FormState>();
  final _massController = TextEditingController();
  final _radiusController = TextEditingController();
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Комогорцев Даниил Александрович'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _massController,
                decoration: InputDecoration(labelText: 'Масса (кг). Для указания степени используйте экспоненциальную запись (например, 5.972e24 означает 5.972 × 10²⁴) '),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Укажите данные';
                  if (double.tryParse(value) == null) return 'Только число';
                  return null;
                },
              ),
              TextFormField(
                controller: _radiusController,
                decoration: InputDecoration(labelText: 'Радиус (м)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Укажите данные';
                  if (double.tryParse(value) == null) return 'Только число';
                  return null;
                },
              ),
              CheckboxListTile(
                title: Text('Согласие на обработку персональных данных'),
                value: _isAgreed,
                onChanged: (value) {
                  setState(() => _isAgreed = value!);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _isAgreed) {
                    final mass = double.parse(_massController.text);
                    final radius = double.parse(_radiusController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(mass: mass, radius: radius),
                      ),
                    );
                  }
                },
                child: Text('Рассчитать'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final double mass;
  final double radius;
  
  const SecondScreen({required this.mass, required this.radius});

  @override
  Widget build(BuildContext context) {
    const G = 6.67430e-11;
    final gravity = G * mass / (radius * radius);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Результат'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ускорение свободного падения:'),
            Text('${gravity.toStringAsFixed(10)} м/с²'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}