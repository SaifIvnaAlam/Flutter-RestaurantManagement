import 'dart:convert';
import 'dart:developer';

import 'package:ansicolor/ansicolor.dart';

class ShowError {
  String title;
  int? statusCode;
  ShowError({
    required this.title,
    this.statusCode,
  });

  ShowError copyWith({
    String? title,
    int? statusCode,
  }) {
    return ShowError(
      title: title ?? this.title,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    if (statusCode != null) {
      result.addAll({'statusCode': statusCode});
    }

    return result;
  }

  factory ShowError.fromMap(Map<String, dynamic> map) {
    return ShowError(
      title: map['title'] ?? '',
      statusCode: map['statusCode']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShowError.fromJson(String source) =>
      ShowError.fromMap(json.decode(source));

  @override
  String toString() => 'ShowError(title: $title, statusCode: $statusCode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShowError &&
        other.title == title &&
        other.statusCode == statusCode;
  }

  @override
  int get hashCode => title.hashCode ^ statusCode.hashCode;
}

class Klog {
  AnsiPen pen = AnsiPen()..red(bold: true);
  String? file = "File name unknown";
  String? functionName = "Funtion Name Unknown";
  String? message = "Something went wrong";
  Klog();

  factory Klog.unknowError() {
    log("_____________________UNKNOWN ERROR_________________________________________");
    log("Error Unknown");
    log("_____________________UNKNOW ERROR_________________________________________");
    return Klog();
  }
  factory Klog.fatalError(
      String filename, String functionName, String message) {
    log("_____________________FATAL ERROR_________________________________________");
    log("File: $filename\nFunction: $functionName\nMessage: $message");
    log("_____________________FATAL ERROR_________________________________________");
    return Klog();
  }

  factory Klog.logMessage(String message) {
    log(message);
    return Klog();
  }
  factory Klog.logMap(Map<String, dynamic> message) {
    log("_____________________LOGGED MAP_________________________________________");
    message.forEach((key, value) {
      log("$key: $value");
    });
    log("_____________________LOGGED MAP_________________________________________");

    return Klog();
  }
}
