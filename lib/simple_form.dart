import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explained/main.dart';

class SimpleForm extends ConsumerWidget {
  const SimpleForm({super.key});

  void onNameSubmitted(String value, WidgetRef ref) {
    //State Provider
    // ref.read(nameProvider.notifier).update((state) => value);

    //State Notifier Provider
    ref.read(userProvider.notifier).updateName(value);
  }

  onAgeSubmitted(String age, WidgetRef ref) {
    //State Notifier Provider
    ref.read(userProvider.notifier).updateAge(age);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('Entire Widget Tree Built');

    //State Provider
    // String appBarTitle = ref.watch(nameProvider);
    final user = ref.watch(userProvider);
    // final selectedWatch = ref.watch(userProvider.select((value) => value.name));
    return Scaffold(
      appBar: AppBar(
        // title: Text(appBarTitle),
        title: Text(
          user.name,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => onNameSubmitted(value, ref),
              onSubmitted: (value) {
                onNameSubmitted(value, ref);
              },
            ),
            TextField(
              onSubmitted: (value) => onAgeSubmitted(value, ref),
            ),
            Text(
              user.age.toString(),
            )
          ],
        ),
      ),
    );
  }
}
