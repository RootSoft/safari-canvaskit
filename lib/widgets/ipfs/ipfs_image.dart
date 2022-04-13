import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:safari_canvaskit/widgets/ipfs/ipfs.dart';

class IpfsImage extends StatefulWidget {
  final String cid;
  final IpfsGateway gateway;

  final double blur;
  final Color shadowColor;
  final Offset offset;
  final BoxFit fit;
  final bool rounded;
  final BorderRadiusGeometry? borderRadius;

  const IpfsImage({
    Key? key,
    required this.cid,
    required this.gateway,
    this.blur = 40,
    this.shadowColor = Colors.black,
    this.offset = const Offset(0, 50),
    this.fit = BoxFit.cover,
    this.rounded = true,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<IpfsImage> createState() => _IpfsImageState();
}

class _IpfsImageState extends State<IpfsImage> {
  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: Ipfs.gateway(widget.cid, widget.gateway),
      imageBuilder: (context, imageProvider) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius ??
                    BorderRadius.circular(widget.rounded ? 8.0 : 0.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: widget.fit,
                ),
              ),
            ),
            if (widget.blur > 0) ...[
              Container(
                decoration: BoxDecoration(
                  borderRadius: widget.borderRadius ??
                      BorderRadius.circular(widget.rounded ? 8.0 : 0.0),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.6, 1],
                    colors: [
                      Colors.transparent,
                      widget.shadowColor,
                    ],
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
