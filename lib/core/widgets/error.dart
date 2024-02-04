import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomErrorWidget extends StatelessWidget {
  final DioException? exception;
  final String? message;
  final Function? retry;

  const CustomErrorWidget(
      {super.key, this.exception, this.message, this.retry});

  @override
  Widget build(BuildContext context) {
    Widget? finalWidget;
    if (exception != null) {
      if (exception!.type == DioExceptionType.connectionError) {
        finalWidget = _connectionException();
      } else if (exception!.type == DioExceptionType.connectionTimeout ||
          exception!.type == DioExceptionType.receiveTimeout ||
          exception!.type == DioExceptionType.sendTimeout) {
        finalWidget = _timeOutException();
      }
    } else if ((message ?? '').isNotEmpty) {
      finalWidget = _errorMessageException(message!);
    }

    finalWidget ??= _defaultException();

    finalWidget =
        Padding(padding: const EdgeInsets.all(25), child: finalWidget);

    return finalWidget;
  }

  Widget _connectionException() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/no_connection.svg',
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 15),
          const Text(
            // 'خطا در برقراری ارتباط',
            'Connection failed',
            style: TextStyle(fontFamily: 'Muli'),
          ),
          _retryButton(),
        ],
      ),
    );
  }

  Widget _timeOutException() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/timeout.svg',
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 15),
          const Text(
            // 'زمان انتظار به پایان رسید',
            'Request timeout',
            style: TextStyle(fontFamily: 'Muli'),
          ),
          _retryButton(),
        ],
      ),
    );
  }

  Widget _errorMessageException(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/error.svg',
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 15),
          Text(
            message,
            style: const TextStyle(fontFamily: 'Muli'),
          ),
          _retryButton(),
        ],
      ),
    );
  }

  Widget _defaultException() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/error.svg',
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 15),
          const Text(
            // 'خطا در انجام عملیات',
            'Operation failed',
            style: TextStyle(fontFamily: 'Muli'),
          ),
          _retryButton(),
        ],
      ),
    );
  }

  Widget _retryButton() {
    if (retry != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                retry!();
              },
              child: Row(
                children: const [
                  Icon(Icons.refresh_rounded),
                  SizedBox(width: 5,),
                  Text(
                    // 'تلاش مجدد',
                    'Retry',
                    style: TextStyle(fontFamily: 'Muli'),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
