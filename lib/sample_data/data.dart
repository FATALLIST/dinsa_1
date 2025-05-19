// lib/sample_data/data.dart

import '../models/user.dart';
import '../models/child.dart';
import '../models/activity.dart';
import '../models/menu.dart';
import '../models/growth.dart';
import '../models/media.dart';

// Sample users
final List<User> users = [
  User(id: 1, name: 'Admin Master', email: 'admin@dinsa.com', provider: null, providerId: null, role: Role.master),
  User(id: 2, name: 'Caregiver A', email: 'caregiver.a@dinsa.com', provider: null, providerId: null, role: Role.caregiver),
  User(id: 3, name: 'Parent X', email: 'parent.x@dinsa.com', provider: null, providerId: null, role: Role.parent),
];

// Sample children
final List<Child> children = [
  Child(id: 1, name: 'Muhammad Haiqal Latief', birthdate: DateTime(2019, 1, 10), ageMonths: 61),
  Child(id: 2, name: 'Aji Cakra Werdana', birthdate: DateTime(2018, 5, 20), ageMonths: 72),
  Child(id: 3, name: 'Herlan Ramadhan', birthdate: DateTime(2019, 10, 5), ageMonths: 67),
];

// Sample activities
final List<Activity> activities = [
  Activity(id: 1, childId: 1, description: 'Kedatangan & Mandi', dateTime: DateTime.now().subtract(Duration(hours: 5))),
  Activity(id: 2, childId: 1, description: 'Sarapan & Main Bebas', dateTime: DateTime.now().subtract(Duration(hours: 4))),
  Activity(id: 3, childId: 2, description: 'Pembelajaran Motorik Halus', dateTime: DateTime.now().subtract(Duration(hours: 3))),
];

// Sample menus
final List<Menu> menus = [
  Menu(id: 1, childId: 1, name: 'Sayur Bayam', date: DateTime.now()),
  Menu(id: 2, childId: 2, name: 'Perkedel', date: DateTime.now()),
  Menu(id: 3, childId: 3, name: 'Pisang', date: DateTime.now()),
];

// Sample growth data
final List<Growth> growthData = [
  Growth(id: 1, childId: 1, weight: 18.5, height: 105.0, headCircumference: 50.0, date: DateTime.now().subtract(Duration(days: 30))),
  Growth(id: 2, childId: 1, weight: 19.0, height: 106.0, headCircumference: 50.5, date: DateTime.now()),
];

// Sample media
final List<Media> media = [
  Media(id: 1, childId: 1, url: 'assets/media/photo1.jpg', type: MediaType.image, createdBy: 2, createdAt: DateTime.now().subtract(Duration(days: 1))),
  Media(id: 2, childId: 1, url: 'assets/media/video1.mp4', type: MediaType.video, createdBy: 2, createdAt: DateTime.now()),
];
