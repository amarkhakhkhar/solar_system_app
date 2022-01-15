import 'package:flutter/material.dart';

class PlanetSelect<S> extends StatelessWidget {
  final S value;
  final S? groupValue;
  final ValueChanged<S?> onChanged;

  const PlanetSelect({ Key? key , required this.value, required this.groupValue, required this.onChanged}) : super(key: key);

  Widget _buildLabel(){
    final isSelected = (value == groupValue);

    return Container(
      child: Icon(
        isSelected  ? Icons.circle_rounded: Icons.circle_outlined,
        size: 10,
        color: Colors.white,
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {onChanged(value);},
        child: _buildLabel(),
      ),
    );
  }
}