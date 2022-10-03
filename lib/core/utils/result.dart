import 'package:flutter/material.dart';

class Result<T> {
  late T _value;
  late bool isSuccess;
  late bool isFailure;

  Result._(T value) {
    _value = value;
    isSuccess = value is! Failure;
    isFailure = value is Failure;
  }

  Result.success(T value) : this._(value);

  Result.failure(Exception e) : this._(Failure(e) as T);

  T? getOrNull() {
    if (isFailure) {
      return null;
    }
    return _value;
  }

  Exception? exceptionOrNull() {
    if (isFailure) {
      return (_value as Failure).exception;
    }
    return null;
  }

  @override
  String toString() {
    if (isFailure) {
      return _value.toString();
    }
    return 'Success{$_value}';
  }
}

class Failure {
  final Exception exception;

  Failure(this.exception);

  @override
  String toString() {
    return 'Failure($exception)';
  }
}
