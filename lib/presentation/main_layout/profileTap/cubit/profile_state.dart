part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileErr extends ProfileState {
  final String errMsg;

  ProfileErr({required this.errMsg});
}

final class ProfileGetAddressSuccsesState extends ProfileState {}

final class ProfileAddAddressSuccsesState extends ProfileState {}
