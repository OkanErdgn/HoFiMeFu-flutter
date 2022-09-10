import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:HoFiMeFu/generated/l10n.dart';
import 'package:HoFiMeFu/routes.dart';
import 'package:HoFiMeFu/shared/widgets/drawer/bloc/drawer_bloc.dart';
import 'package:flutter/material.dart';

// jhipster-merlin-needle-menu-import-entry-add

class HoFiMeFuDrawer extends StatelessWidget {
   HoFiMeFuDrawer({Key? key}) : super(key: key);

   static final double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DrawerBloc, DrawerState>(
      listener: (context, state) {
        if(state.isLogout) {
          Navigator.popUntil(context, ModalRoute.withName(HoFiMeFuRoutes.login));
          Navigator.pushNamed(context, HoFiMeFuRoutes.login);
        }
      },
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            header(context),
            ListTile(
              leading: Icon(Icons.home, size: iconSize,),
              title: Text(S.of(context).drawerMenuMain),
              onTap: () => Navigator.pushNamed(context, HoFiMeFuRoutes.main),
            ),
            ListTile(
              leading: Icon(Icons.settings, size: iconSize,),
              title: Text(S.of(context).drawerSettingsTitle),
              onTap: () => Navigator.pushNamed(context, HoFiMeFuRoutes.settings),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, size: iconSize,),
          title: Text(S.of(context).drawerLogoutTitle),
              onTap: () => context.read<DrawerBloc>().add(Logout())
            ),
            Divider(thickness: 2),
            // jhipster-merlin-needle-menu-entry-add
          ],
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Text(S.of(context).drawerMenuTitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
