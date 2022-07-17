import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:currencyconverterapp/core/components/text_style_comp.dart';
import 'package:currencyconverterapp/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  final T? viewModal;
  final Widget Function(BuildContext context, T value)? onPageBuilder;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;
  const BaseView({
    Key? key,
    required this.viewModal,
    required this.onPageBuilder,
    this.onModelReady,
    this.onDispose,
  }) : super(key: key);
  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> with WidgetsBindingObserver {
  StreamSubscription? subscription;
  dynamic internetStatus;

  @override
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        internetStatus = result;
      });
    });

    if (widget.onModelReady != null) widget.onModelReady!(widget.viewModal);
  }

  @override
  Widget build(BuildContext context) {
    return internetStatus == ConnectivityResult.none
        ? Scaffold(
            backgroundColor: ColorConst.kPrimaryWhite,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(),
                    Image.asset(
                      "assets/images/noInternet.gif",
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        Text(
                          "Oops, No Internet Connection",
                          style: TextStyleComp.noConnection,
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            "Make sure wifi or cellular data is turned on",
                            style: TextStyleComp.noConnectionMakeSure,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(),
                    const SizedBox(),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
          )
        : widget.onPageBuilder!(context, widget.viewModal);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }
}
