import 'package:HoFiMeFu/main/main_screen_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:HoFiMeFu/account/login/login_repository.dart';
import 'package:HoFiMeFu/generated/l10n.dart';
import 'package:HoFiMeFu/keys.dart';
import 'package:HoFiMeFu/main/bloc/main_bloc.dart';
import 'package:HoFiMeFu/shared/widgets/drawer/bloc/drawer_bloc.dart';
import 'package:HoFiMeFu/shared/widgets/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: HoFiMeFuKeys.mainScreen);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) => previous.currentUser != current.currentUser,
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(S.of(context).pageMainTitle),
            ),
            body: MainPageView(),
            drawer: BlocProvider<DrawerBloc>(
                create: (context) => DrawerBloc(loginRepository: LoginRepository()),
                child: HoFiMeFuDrawer())
        );
      },
    );
  }

}
