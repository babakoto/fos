import 'package:example/core/dependancies.dart';
import 'package:example/layers/application/blocs/users/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(getIt(), getIt())
              ..add(
                OnFindUsersEvent(),
              ),
          )
        ],
        child: MaterialApp(
          routes: {
            '/user': (context) => const UserProfile(),
          },
          title: 'Flutter Demo',
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              final user = state.users[index];
              return ListTile(
                onTap: () {
                  context.read<UserBloc>().add(OnFindOneUserEvent(user.id));
                  Navigator.pushNamed(context, '/user');
                },
                title: Text(
                  'User ${user.name}',
                  style: TextStyle(color: Colors.black87),
                ),
              );
            });
      }),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        return Text("${state.user?.name}");
      }),
    );
  }
}
