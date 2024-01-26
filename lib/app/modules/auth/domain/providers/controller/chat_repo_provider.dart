import 'package:connect_firebase/app/modules/auth/domain/repo/chats_repo.dart';
import 'package:connect_firebase/app/modules/auth/domain/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatsRepositoryProvider = Provider((ref) => ChatsRepository());

final usersProvider = FutureProvider.autoDispose<List<UserModel>>((ref) async {
  final chatsRepo = ref.watch(chatsRepositoryProvider);
  debugPrint("*******");
  try {
    final userList = await chatsRepo.fetchRegisteredUsers();
    return userList;
  } catch (e) {
    debugPrint('Error fetching users: $e');
    return [];
  }
});
