import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //creating an E2E chat system
    return Container(
      child: Center(child: Text('chat')),
    );
  }
}
