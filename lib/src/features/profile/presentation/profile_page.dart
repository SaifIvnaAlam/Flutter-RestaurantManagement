import 'package:flutter/material.dart';
import 'components/user_profile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantmanagement/src/features/profile/application/profile_cubit/profile_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getUserInfo();
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.map(
          loading: (v) =>
              const Center(child: CircularProgressIndicator.adaptive()),
          loaded: (data) => Profile(data: data.user),
          error: (e) => const Center(child: Text("Error Loading User Data")),
        );
      },
    );
  }
}
