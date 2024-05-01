import 'dart:convert';

class ShowModel {
  final String selectedProject;
  final String client;
  final List<String> tags;
  final String timeOut;
  final String timeIn;
  final String status;
  final String notes;
  final String description;
  final double hourlyRate;
  final int workingHours;
  final int timebreak;
  final bool billable;

  ShowModel({
    required this.selectedProject,
    required this.client,
    required this.tags,
    required this.timeOut,
    required this.timeIn,
    required this.status,
    required this.notes,
    required this.description,
    required this.hourlyRate,
    required this.workingHours,
    required this.timebreak,
    required this.billable,
  });
  factory ShowModel.fromJson(Map<String, dynamic> json) {
    return ShowModel(
      selectedProject: json['selectedProject'],
      client: json['client'],
      tags: json['tags'] is List
          ? List<String>.from(json['tags'])
          : [json['tags'].toString()],
      timeOut: json['timeOut'],
      timeIn: json['timeIn'],
      status: json['status'],
      notes: json['notes'],
      description: json['description'] ?? "",
      hourlyRate: json['hourlyRate'] != null
          ? double.tryParse(json['hourlyRate'].toString()) ?? 0.0
          : 0.0,
      workingHours: json['workingHours'] != null
          ? int.tryParse(json['workingHours'].toString()) ?? 0
          : 0,
      timebreak: json['timebreak'],
      billable:
          json['billable'] is bool ? json['billable'] : json['billable'] == 1,
    );
  }
}
