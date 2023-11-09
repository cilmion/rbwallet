import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jazzicon/jazzicon.dart';

import '../../../core/bloc/wallet-bloc/cubit/wallet_cubit.dart';

class AvatarWidget extends StatelessWidget {
  final double radius;
  final String address;
  final String? iconType;
  final String? imageUrl;
  final Color? borderColor;
  final Color backgroundColor;
  const AvatarWidget(
      {Key? key,
      required this.radius,
      required this.address,
      this.borderColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.iconType,
      this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletCubit, WalletState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(
                  color: imageUrl == null
                      ? borderColor!
                      : imageUrl!.contains("http")
                          ? borderColor!
                          : Colors.transparent,
                  width: 2),
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: imageUrl != null
                ? imageUrl!.contains("http")
                    ? CachedNetworkImage(
                        imageUrl: imageUrl ?? "",
                        height: radius,
                        width: radius,
                        errorWidget: (context, ob, st) =>
                            const Icon(Icons.token),
                      )
                    : Image.asset(
                        imageUrl.toString(),
                        fit: BoxFit.contain,
                        height: radius + 6,
                        width: radius + 6,
                        errorBuilder: (context, ob, st) =>
                            const Icon(Icons.token),
                      )
                : Jazzicon.getIconWidget(
                    Jazzicon.getJazziconData(160, address: address),
                    size: radius / 1.3));
      },
    );
  }
}
