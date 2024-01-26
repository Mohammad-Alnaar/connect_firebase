import 'package:connect_firebase/app/core/extensions/buid_context_extension.dart';
import 'package:connect_firebase/app/modules/auth/domain/providers/controller/chat_repo_provider.dart';
import 'package:connect_firebase/app/modules/auth/domain/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatUsers = ref.watch(usersProvider);
    return Scaffold(
      appBar: AppBar(title: Text(context.translate.chats)),
      body: chatUsers.when(data: (List<UserModel> data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final user = data[index];
            return Card(
                child: ListTile(
              title: Text(data[index].username.toString()),
              subtitle: Text(data[index].email.toString()),
            ));
          },
        );
      }, error: (Object error, StackTrace stackTrace) {
        return Center(child: Text(error.toString()));
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
