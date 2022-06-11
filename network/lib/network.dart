library network;

export 'network/api_helper.dart';
export 'network/failure.dart';
export 'package:dio/dio.dart';
export 'network/urls.dart';
export 'package:json_annotation/json_annotation.dart';
export 'package:dartz/dartz.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
