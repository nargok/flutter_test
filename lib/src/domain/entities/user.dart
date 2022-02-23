import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int userId;

  const User({required this.userId});

  @override
  List<Object?> get props => [userId];
}