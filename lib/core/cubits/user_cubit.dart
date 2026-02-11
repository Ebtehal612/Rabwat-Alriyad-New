
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabwat_alriyad_new/data/auth/models/user_model.dart';
import 'package:rabwat_alriyad_new/domain/auth/entities/user.dart';
import '../shared_preferences/prefs_keys.dart';
import '../shared_preferences/shared_prefs.dart';

class UserCubit extends Cubit<User?> {
  UserCubit(this._shared) : super(null) {
    _init();
  }
  
  Future<void> _init() async {
    if (kDebugMode) {
      print('🔍 UserCubit: Initializing...');
    }
    final userJson = await _shared.getSecuredValue(key: PrefsKeys.userDetails);
    if (kDebugMode) {
      print('🔍 UserCubit: Retrieved user JSON: $userJson');
    }
    if (userJson != null) {
      try {
        final user = UserModel.fromJson(userJson).toEntity();
        if (kDebugMode) {
          print('🔍 UserCubit: Parsed user: $user');
          print('🔍 UserCubit: User name: ${user.name}');
        }
        emit(user);
      } catch (e) {
        if (kDebugMode) {
          print('❌ UserCubit: Error parsing user JSON: $e');
        }
      }
    } else {
      if (kDebugMode) {
        print('🔍 UserCubit: No user data found in storage');
      }
    }
  }

  final SharedPrefs _shared;

  void setUser(User? user) {
    if (kDebugMode) {
      print('🔍 UserCubit: Setting user: $user');
    }
    emit(user);
  }
  
  void deleteUser() {
    if (kDebugMode) {
      print('🔍 UserCubit: Deleting user');
    }
    emit(null);
  }
}
