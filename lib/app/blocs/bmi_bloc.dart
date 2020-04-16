import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

abstract class BmiBase {
  Stream<Gender> get gender;
  Stream<int> get height;
  Stream<int> get weight;
  Stream<int> get age;
  Stream<double> get bmi;
  set setGender(Gender gender);
  set setHeight(int val);
  set setWeight(int val);
  set setAge(int val);
  void incrementAge();
  void decrementAge();
  void incrementWeight();
  void decrementWeight();
  double calculate();
}

enum Gender {
  male,
  female,
}

class BmiBloc extends ChangeNotifier with BmiValidators implements BmiBase {
  BmiBloc() {
    _init();
  }

  Future<void> _init() async {}

  // ANCHOR All Stream Contoller

  final _gender = BehaviorSubject<Gender>.seeded(Gender.male);
  final _height = BehaviorSubject<int>.seeded(180);
  final _weight = BehaviorSubject<int>.seeded(60);
  final _age = BehaviorSubject<int>.seeded(20);
  final _bmi = BehaviorSubject<double>.seeded(0.0);

  // ANCHOR All getter

  @override
  Stream<int> get age => _age.stream.transform(ageValidator);

  @override
  Stream<Gender> get gender => _gender.stream.transform(genderValidator);

  @override
  Stream<int> get height => _height.stream.transform(heightValidator);

  @override
  Stream<int> get weight => _weight.stream.transform(weightValidator);

  // ANCHOR All setter

  @override
  set setHeight(int val) => _height.add(val);

  @override
  set setGender(Gender gender) => _gender.add(gender);

  @override
  set setAge(int val) => _age.add(val);

  @override
  set setWeight(int val) => _weight.add(val);

  // ANCHOR All methods

  // ANCHOR dispose method

  @override
  void dispose() {
    _weight.close();
    _age.close();
    _gender.close();
    _height.close();
    _bmi.close();
    super.dispose();
  }

  @override
  void incrementAge() => setAge = _age.value + 1;

  @override
  void decrementAge() => setAge = _age.value - 1;

  @override
  void incrementWeight() => setWeight = _weight.value + 1;

  @override
  void decrementWeight() => setWeight = _weight.value - 1;

  @override
  double calculate() {
    double bmi = _weight.value / pow(_height.value / 100, 2);
    _bmi.add(bmi);
    return bmi;
  }

  @override
  Stream<double> get bmi => _bmi.stream;

  //

}

mixin BmiValidators {
  //
  final genderValidator = StreamTransformer<Gender, Gender>.fromHandlers(
    handleData: (gender, sink) {
      sink.add(gender);
    },
  );

  final ageValidator = StreamTransformer<int, int>.fromHandlers(
    handleData: (age, sink) {
      if (age >= 1 && age <= 150) sink.add(age);
    },
  );

  final weightValidator = StreamTransformer<int, int>.fromHandlers(
    handleData: (weight, sink) {
      if (weight >= 1 && weight <= 350) sink.add(weight);
    },
  );

  final heightValidator = StreamTransformer<int, int>.fromHandlers(
    handleData: (height, sink) {
      if (height >= 70 && height <= 270) sink.add(height);
    },
  );
}
