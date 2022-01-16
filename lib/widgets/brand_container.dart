import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/extensions/context_extension.dart';
import '../core/init/theme/light/color_scheme_light.dart';
import '../model/product.dart';
import '../view/basket/basket_view_model.dart';
import 'custom_text.dart';

class BrandContainer extends StatefulWidget {
  final Product? product;
  final bool isHomeView;

  const BrandContainer(this.product, this.isHomeView, {Key? key}) : super(key: key);

  @override
  State<BrandContainer> createState() => _BrandContainerState();
}

class _BrandContainerState extends State<BrandContainer> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.product!.count;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isHomeView ? () {
        if (_count == 0) {
          setState(() {
            _count += 1;
            context.read<BasketViewModel>().basketUpdate(widget.product!, true);
          });
        }
      } : null,
      child: Container(
          decoration: BoxDecoration(
              gradient:
                  RadialGradient(colors: [context.themeData.colorScheme.primaryVariant, ColorSchemeLight.instance!.lightGrayishBlue2]),
              border: Border.all(color: ColorSchemeLight.instance!.strongGreen),
              borderRadius: BorderRadius.circular(6)),
          child: Stack(children: [
            Center(
              child: Image.network(
                widget.product!.photoUrl!,
                errorBuilder: (context, object, stackTree) =>
                    Image.asset('assets/sirma.png'),
              ),
            ),
            Visibility(
              visible: widget.isHomeView && _count > 0,
              child: Container(
                width: double.infinity,
                color: context.themeData.primaryColor.withOpacity(0.75),
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
                              color: context.themeData.colorScheme.primaryVariant,
                              fontWeight: FontWeight.bold,
                              fontSize: 42),
                          CustomText('$_count',
                              color: context.themeData.colorScheme.primaryVariant,
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
            context.read<BasketViewModel>().basketUpdate(widget.product!, true);

          });
        } else {
          setState(() {
            _count -= 1;
            context.read<BasketViewModel>().basketUpdate(widget.product!, false);
          });
        }
      },
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
            color: context.themeData.colorScheme.primaryVariant, borderRadius: BorderRadius.circular(6)),
        child: Icon(
          type == 0 ? Icons.add : Icons.remove_rounded,
          color: context.themeData.primaryColor,
        ),
      ),
    );
  }
}
