import 'package:flutter/material.dart';

class BigBottomButton extends StatelessWidget {
  const BigBottomButton({super.key, required this.text, this.func});

  final String text;
  // ignore: prefer_function_declarations_over_variables
  final VoidCallback? func;
  @override
  Widget build(final BuildContext context) => Positioned(
                  bottom: 12,
                  left: 0,
                  right: 0,
                  child: ElevatedButton(
                    onPressed: func,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                  width: 2, color: Colors.lightBlue))),
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 61, 94, 170)),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        text,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
}