import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SlideToPayButton extends StatefulWidget {
  final VoidCallback onSlideComplete;

  const SlideToPayButton({Key? key, required this.onSlideComplete})
    : super(key: key);

  @override
  State<SlideToPayButton> createState() => _SlideToPayButtonState();
}

class _SlideToPayButtonState extends State<SlideToPayButton>
    with SingleTickerProviderStateMixin {
  double _dragPosition = 4;
  bool _completed = false;
  bool _visibility = false;
  late double _maxWidth;
  final double _cartSize = 60;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _maxWidth = constraints.maxWidth;

        return GestureDetector(
          // onHorizontalDragStart: (details) {
          //   if (_dragPosition > 2) {
          //     _visibility = true;
          //   }
          // },
          onHorizontalDragUpdate: (details) {
            if (_completed) return;
            setState(() {
              _dragPosition += details.delta.dx;
              _dragPosition = _dragPosition.clamp(0, _maxWidth - _cartSize);
            });
          },
          onHorizontalDragEnd: (details) {
            if (_dragPosition > _maxWidth - _cartSize - 10) {
              // Successfully slid
              setState(() {
                _completed = true;
                _dragPosition = _maxWidth - _cartSize;
              });
              Future.delayed(
                Duration(milliseconds: 500),
                widget.onSlideComplete,
              );
            } else {
              // Not completed, reset
              setState(() {
                _dragPosition = 4;
              });
            }
          },
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.orange, width: 2),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    _completed ? "Order Placed!" : "Slide to Pay",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: _completed ? Colors.green : Colors.orange,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: _dragPosition,
                child: Container(
                  height: _cartSize,
                  width: _cartSize,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.orange,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.6),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child:
                      _visibility
                          ? SizedBox()
                          : Lottie.asset('assets/cart.json', repeat: true),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
