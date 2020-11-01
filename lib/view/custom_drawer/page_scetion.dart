import 'package:aps_mobile/store/page_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'drawer_constants.dart';
import 'page_tile.dart';

class PageSection extends StatelessWidget {

  final PageStore pageStore = GetIt.I<PageStore>();

  int uiid = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: HOME_LABEL,
          iconData: HOME_ICON,
          onTap: () {
            pageStore.setPage(HOME_PAGE);
          },
          highlighted: pageStore.page == HOME_PAGE,
        ),
        PageTile(
          label: PRODUTOS_LABEL,
          iconData: PRODUTOS_ICON,
          onTap: () {
            pageStore.setPage(PRODUTOS_PAGE);
          },
          highlighted: pageStore.page == PRODUTOS_PAGE,
        ),
        PageTile(
          label: PEDIDOS_LABEL,
          iconData: PEDIDOS_ICON,
          onTap: () {
            //pageStore.setPage(PEDIDOS_PAGE);
          },
          highlighted: pageStore.page == PEDIDOS_PAGE,
        ),
        PageTile(
          label: LOJAS_LABEL,
          iconData: LOJAS_ICON,
          onTap: () {
            //pageStore.setPage(LOJAS_PAGE);
          },
          highlighted: pageStore.page == LOJAS_PAGE,
        ),
        /*PageTile(
          label: MINHA_CONTA_LABEL,
          iconData: MINHA_CONTA_ICON,
          onTap: () {
            //pageStore.setPage(MINHA_CONTA_PAGE);
          },
          highlighted: pageStore.page == MINHA_CONTA_PAGE,
        ),*/
      ],
    );
  }
}
