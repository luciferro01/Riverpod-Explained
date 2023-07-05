import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explained/main.dart';

class FutureUserUI extends ConsumerStatefulWidget {
  const FutureUserUI({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FutureUserUIState();
}

class _FutureUserUIState extends ConsumerState<FutureUserUI> {
  String dataValue = '1';

  @override
  Widget build(BuildContext context) {
    return ref.watch(futureUserProvider(dataValue)).when(data: (value) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value.name),
              const SizedBox(
                height: 40,
              ),
              Text(value.email),
            ],
          ),
        ),
      );
    }, error: (err, stackTrace) {
      return Scaffold(
        body: Center(child: Text(err.toString())),
      );
    }, loading: () {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    });

    // Stream Provider
    // return ref.watch(streamProvider).when(data: (value) {
    //   return Scaffold(
    //     body: Column(
    //       children: [
    //         Center(child: Text(value.toString())),
    //         const SizedBox(
    //           height: 40,
    //         ),
    //         // Text(value.email),
    //       ],
    //     ),
    //   );
    // }, error: (err, stackTrace) {
    //   return Scaffold(
    //     body: Text(err.toString()),
    //   );
    // }, loading: () {
    //   return const Scaffold(
    //     body: Center(child: CircularProgressIndicator()),
    //   );
    // });
  }
}
