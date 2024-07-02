import 'package:flutter/material.dart';

import '../../../../core/sources/apis/data_state.dart';
import '../../../../core/sources/local/auth/local_auth.dart';
import '../../../../core/sources/local/local_user.dart';
import '../../../../core/widgets/loader.dart';
import '../../data/sources/user_api.dart';
import '../../domain/entities/user_entity.dart';
import '../widgets/button/profile_supporter_stats_section.dart';
import '../widgets/header/profile_header_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String uid = LocalAuth.uid ?? '';
    return Scaffold(
      body: FutureBuilder<DataState<UserEntity?>>(
        future: GetUserAPI().user(uid),
        initialData: LocalUser().userState(uid),
        builder: (
          BuildContext context,
          AsyncSnapshot<DataState<UserEntity?>> snapshot,
        ) {
          final UserEntity? user = snapshot.data?.entity;
          if (user == null &&
              snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          if (snapshot.data is DataFailer<UserEntity?>) {
            return const Center(child: Text('Error loading user data'));
          }
          if (user == null) {
            return const Center(child: Text('User not found'));
          }
          return Column(
            children: <Widget>[
              ProfileHeaderSection(user: user),
              ProfileSupporterStatsSection(user: user),
            ],
          );
        },
      ),
    );
  }
}
