import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:safari_canvaskit/widgets/ipfs/ipfs.dart';
import 'package:safari_canvaskit/widgets/ipfs/ipfs_image.dart';
import 'package:safari_canvaskit/widgets/landing_image.dart';
import 'package:safari_canvaskit/widgets/slivers/sliver_with_app_bar.dart';

class HomePage extends StatelessWidget {
  final cid = 'bafkreifia5zftyrmj4xwvd2y5pap3ccmlrybhjjar5g2q5jhrxkjvulc54';
  static const routeName = '/home';

  final _scrollController = ScrollController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverWithAppBar(
          appBar: SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            floating: true,
            actions: [
              IconButton(
                icon: const HeroIcon(
                  HeroIcons.bell,
                  solid: true,
                  size: 24,
                ),
                onPressed: () async {},
              )
            ],
          ),
          children: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Builder(
                    builder: (context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LandingImage(
                            label: 'test',
                            ratio: 0.75,
                            image: IpfsImage(
                              cid: cid,
                              gateway: IpfsGateway.infura,
                              rounded: false,
                              fit: BoxFit.cover,
                            ),
                            scrollController: _scrollController,
                            onMintTap: () async {},
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 2,
                            child: Container(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
