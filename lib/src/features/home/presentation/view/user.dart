import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/presentation/cubit/user_cubit.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserCubit>(context).getUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text("User list"),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserError) {
            return Center(child: Text(state.errorMsg));
          }
          if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.userModel.length,
              itemBuilder: (context, index) {
                var user = state.userModel[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(user.avatar!),
                  ),
                  title:
                      Text("${user.firstName ?? " "}  ${user.lastName ?? ""}"),
                  subtitle: Text(user.email ?? ""),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
