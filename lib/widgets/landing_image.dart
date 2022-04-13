import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:safari_canvaskit/widgets/ipfs/ipfs_image.dart';
import 'package:safari_canvaskit/widgets/pulse_icon.dart';

class LandingImage extends StatelessWidget {
  final IpfsImage image;
  final ScrollController scrollController;
  final String label;
  final double ratio;
  final double shadowBlur;
  final VoidCallback onMintTap;

  const LandingImage({
    Key? key,
    required this.image,
    required this.scrollController,
    required this.onMintTap,
    this.label = '',
    this.ratio = 0.7,
    this.shadowBlur = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * ratio;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: double.maxFinite,
          height: height,
          child: image,
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onMintTap,
            child: const PulseIcon(
              glowColor: Color.fromARGB(142, 24, 24, 24),
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(142, 24, 24, 24),
                child: HeroIcon(
                  HeroIcons.viewGridAdd,
                  color: Colors.white,
                  size: 50,
                  solid: false,
                ),
                radius: 90,
              ),
              startRadius: 180,
              endRadius: 105,
            ),
          ),
        ),
        //MintButton(),
      ],
    );
  }
}
