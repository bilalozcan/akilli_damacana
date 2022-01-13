import 'package:flutter/material.dart';
import 'package:smart_carboy/core/extensions/context_extension.dart';
import 'custom_text.dart';

class BrandContainer extends StatefulWidget {
  const BrandContainer({Key? key}) : super(key: key);

  @override
  State<BrandContainer> createState() => _BrandContainerState();
}

class _BrandContainerState extends State<BrandContainer> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_count == 0) {
          setState(() {
            _count += 1;
          });
        }
      },
      child: Container(
          decoration: BoxDecoration(
              gradient:
                  RadialGradient(colors: [Colors.white, Color(0xffD6EBF4)]),
              border: Border.all(color: Color(0xff94C11F)),
              borderRadius: BorderRadius.circular(6)),
          child: Stack(children: [
            Center(child: Image.asset('assets/sirma.png')),
            Visibility(
              visible: _count > 0,
              child: Container(
                width: double.infinity,
                color: Color(0xff1D91D2).withOpacity(0.75),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText('+',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 42),
                          CustomText('$_count',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 38),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [button(1), button(0)],
                      )
                    ],
                  ),
                ),
              ),
            )
          ])),
    );
  }

  Widget button(int type) {
    return InkWell(
      onTap: () {
        if (type == 0) {
          setState(() {
            _count += 1;
          });
        } else {
          setState(() {
            _count -= 1;
          });
        }
      },
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Icon(
          type == 0 ? Icons.add : Icons.remove_rounded,
          color: Color(0xff1D91D2),
        ),
      ),
    );
  }
}
