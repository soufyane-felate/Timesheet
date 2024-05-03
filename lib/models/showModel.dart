import 'dart:convert';

class ShowModel {
  final int id; // Add id field here
  final String selectedProject;
  final String client;
  final String timeIn;
  final String timeOut;
  final int timebreak;
  final int workingHours;
  final double hourlyRate;
  final String description;
  final String notes;
  final String status;
  final List<String> tags;
  final bool billable;

  ShowModel({
    required this.id,
    required this.selectedProject,
    required this.client,
    required this.timeIn,
    required this.timeOut,
    required this.timebreak,
    required this.workingHours,
    required this.hourlyRate,
    required this.description,
    required this.notes,
    required this.status,
    required this.tags,
    required this.billable,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) {
    return ShowModel(
      id: json['id'], 

      selectedProject: json['selectedProject'],

      client: json['client'],

      timeIn: json['timeIn'],

      timeOut: json['timeOut'],
      
      timebreak: json['timebreak'],




      
      workingHours: json['workingHours'] != null
          ? int.tryParse(json['workingHours'].toString()) ?? 0
          : 0,
      hourlyRate: json['hourlyRate'] != null
          ? double.tryParse(json['hourlyRate'].toString()) ?? 0.0
          : 0.0,
          

      description: json['description'] ?? "",



      notes: json['notes'],
      tags: json['tags'] is List? List<String>.from(json['tags']): [json['tags'].toString()],
      
      status: json['status'],

      billable:json['billable'] is bool ? json['billable'] : json['billable'] == 1,
    );
  }
}
