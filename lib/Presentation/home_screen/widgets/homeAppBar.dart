import 'package:bookly/Constants/colors.dart';
import 'package:bookly/Constants/paddings.dart';
import 'package:bookly/cubit/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Theme/themes.dart';

// ignore: camel_case_types
class homeAppBar extends StatelessWidget {
  const homeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appbar,
      child: Row(
        children: [
          Text(
            "Bookly",
            style: AppTheme.textTheme.titleMedium!
                .copyWith(color: AppColors.kWhite),
          ),
          const Spacer(),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Switch(
                value: state.isSwitched,
                onChanged: (value) => BlocProvider.of<ThemeCubit>(context)
                    .changeTheme(isSwitched: value),
              );
            },
          )
        ],
      ),
    );
  }
}
