// ignore_for_file: constant_identifier_names

import 'package:aberno_test/assets/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paginator extends StatelessWidget {
  final PaginatorStatus paginatorStatus;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final VoidCallback fetchMoreFunction;
  final bool hasMoreToFetch;
  final Widget? errorWidget;
  final EdgeInsets? padding;
  final Widget? emptyWidget;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final Axis scrollDirection;
  final Widget? loadingWidget;
  final ScrollPhysics physics;
  final ScrollController? scrollController;
  final VoidCallback? onRefresh;
  final double? height;

  const Paginator({
    required this.paginatorStatus,
    required this.itemBuilder,
    required this.itemCount,
    required this.fetchMoreFunction,
    required this.hasMoreToFetch,
    this.onRefresh,
    this.errorWidget,
    this.padding = EdgeInsets.zero,
    this.scrollDirection = Axis.vertical,
    this.separatorBuilder,
    this.emptyWidget,
    this.loadingWidget,
    this.scrollController,
    this.physics = const BouncingScrollPhysics(),
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (paginatorStatus == PaginatorStatus.PAGINATOR_LOADING) {
      return loadingWidget ?? const Center(child: CupertinoActivityIndicator());
    } else if (paginatorStatus == PaginatorStatus.PAGINATOR_ERROR) {
      return errorWidget ??
          const Center(
            child: Text('Something went wrong!'),
          );
    } else if (paginatorStatus == PaginatorStatus.PAGINATOR_SUCCESS) {
      return itemCount == 0
          ? emptyWidget ?? const SizedBox()
          : RefreshIndicator(
              onRefresh: () async {
                if (onRefresh != null) {
                  onRefresh!();
                }
                return Future.delayed(const Duration(milliseconds: 500));
              },
              color: mainColor,
              backgroundColor: scaffoldBackground,
              child: SizedBox(
                height: height,
                child: ListView.separated(
                  scrollDirection: scrollDirection,
                  controller: scrollController,
                  physics: physics,
                  padding: padding,
                  itemBuilder: (context, index) {
                    if (index == itemCount) {
                      if (hasMoreToFetch) {
                        fetchMoreFunction();
                        return const Center(child: CupertinoActivityIndicator());
                      } else {
                        return const SizedBox.shrink();
                      }
                    }
                    return itemBuilder(context, index);
                  },
                  separatorBuilder: separatorBuilder ?? (context, index) => const SizedBox.shrink(),
                  itemCount: itemCount + 1,
                  shrinkWrap: true,
                ),
              ),
            );
    } else {
      return const SizedBox();
    }
  }
}

enum PaginatorStatus {
  PAGINATOR_LOADING,
  PAGINATOR_SUCCESS,
  PAGINATOR_ERROR,
  PAGINATOR_INITIAL,
}
