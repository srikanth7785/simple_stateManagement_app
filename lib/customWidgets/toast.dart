import 'package:flutter/material.dart';

toast({required BuildContext context, required String text}) => SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.amber,
        onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
      ),
    );
