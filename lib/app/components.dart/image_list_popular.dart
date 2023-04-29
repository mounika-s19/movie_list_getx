import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_sample/app/modules/home/controller/popular_controller.dart';

import '../constants/app_url.dart';

class ImageListPopular extends StatefulWidget {
  const ImageListPopular({Key? key, this.startFrom = 0, this.duration = 30}) : super(key: key);
  final int startFrom;
  final int duration;
  @override
  State<ImageListPopular> createState() => _ImageListPopularState();
}

class _ImageListPopularState extends State<ImageListPopular> {
  final ScrollController _scrollController = ScrollController();
  final PopularController _popularController = Get.put(PopularController());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _scrollController.addListener(() {
        if (_scrollController.hasClients) {
          autoScrollImage();
        }
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        autoScrollImage();
      });
    });
  }

  void autoScrollImage() {
    final currentScrollPosition = _scrollController.offset;
    final endScrollPosition = _scrollController.position.maxScrollExtent;
    final beginScrollPosition = _scrollController.position.minScrollExtent;
    scheduleMicrotask(() {
      if (currentScrollPosition == endScrollPosition) {
        _scrollController.animateTo(
          beginScrollPosition,
          duration: Duration(seconds: widget.duration),
          curve: Curves.linear,
        );
      }
      if (currentScrollPosition == beginScrollPosition) {
        _scrollController.animateTo(
          endScrollPosition,
          duration: Duration(seconds: widget.duration),
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(() {
      autoScrollImage();
    });
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi * 1.95,
      child: SizedBox(
          height: 130,
          child: _popularController.obx(
            (state) => ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CachedNetworkImage(
                        imageUrl: AppUrl.imgUrl + state[index].backdropPath,
                        imageBuilder: (context, imageProvider) => Image(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                        placeholder: (context, url) => const SizedBox(
                          height: 20,
                          width: 20,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        height: 180,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
