import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explained/future_user.dart';
import 'package:riverpod_explained/future_user_ui.dart';
// import 'package:riverpod_explained/simple_form.dart';
import 'package:riverpod_explained/user.dart';
// import 'package:dio/dio.dart';

//Providers that we have
//1. Provider
//2. StateProvider
//3. StateNotifier and StateNotifierProvider
//4. ChangeNotifier and ChangeNotifierProvider
//5. FutureProvider

// final nameProvider = Provider<String?>((ref) => 'MOHIL BANSAL');
// final nameProvider = StateProvider<String?>((ref) => 'MOHIL BANSAL');
final userProvider = StateNotifierProvider<UserNotifer, User>(
    // (ref) => UserNotifer(User(name: 'MOHIL BANSAL', age: 20)),
    (ref) => UserNotifer());

final futureUserProvider =
    FutureProvider.family.autoDispose((ref, String input) {
  // const String url = "https://jsonplaceholder.typicode.com/users/1";
  // var dio = Dio();
  // return dio.get(url).then((value) {
  //   debugPrint(value.data);
  //   return FutureUser.fromJson(value.data);
  // });

  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(input);
});

//Change Notifier Provider
final userChangeNotifierProvider =
    ChangeNotifierProvider((ref) => UserChangeNotifier());

//Stream Provider
final streamProvider = StreamProvider(
  (ref) async* {
    yield [1, 2, 3, 4, 5, 6, 7, 8, 9];
  },
);

//User Repository Provider using Provider as a dependency injector in the file to use it across the files.

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: SimpleForm(),
      home: FutureUserUI(),
    );
  }
}
