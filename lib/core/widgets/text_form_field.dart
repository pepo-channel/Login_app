import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signin_app/core/utils/helper.dart';

class GlobalTextFormField extends StatefulWidget {
  const GlobalTextFormField({super.key, /*required this.textEditingController,*/ required this.preffixicon, this.suffixicon, required this.hinttext, required this.label, required this.textInputType});

  final String label;
  // final TextEditingController textEditingController;
  final String preffixicon;
  final Widget? suffixicon;
  final String hinttext;
  final TextInputType textInputType;

  @override
  State<GlobalTextFormField> createState() => _GlobalTextFormFieldState();
}

class _GlobalTextFormFieldState extends State<GlobalTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label, style: TextStyleData.Medium,),
          SizedBox(height: 10,),
          TextFormField(
            // controller: widget.textEditingController,
            validator: (value) => value!.isEmpty? 'Required Flied' : null,
            keyboardType: widget.textInputType,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black12,
              prefix: SvgPicture.asset(widget.preffixicon, width: 20, height: 20,),
              suffix: widget.suffixicon,
              hintText: widget.hinttext,
              hintStyle: TextStyleData.Medium,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorsData.Greycolor),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorsData.Greycolor),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}