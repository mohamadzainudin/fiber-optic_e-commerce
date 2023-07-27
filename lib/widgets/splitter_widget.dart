import 'package:flutter/material.dart';

class SplitterWidget extends StatelessWidget {
  final String txtname;
  final VoidCallback? onTap;
  final Color? btnColor;
  final Color? txtColor;

  const SplitterWidget({
    Key? key,
    required this.txtname,
    this.onTap,
    this.btnColor,
    this.txtColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: const EdgeInsets.only(right: 5),
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              backgroundColor: MaterialStatePropertyAll<Color?>(btnColor),
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 169, 169, 169))))),
          onPressed: onTap,
          child: Text(
            txtname,
            style: TextStyle(color: txtColor),
          )),
    );
  }
}
