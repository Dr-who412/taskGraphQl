import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:live_audio_room/util/const/fonts.dart';

class CutemTextFaild extends StatelessWidget {
  TextEditingController controler;
  TextStyle? inputStyle;
  TextStyle? hintStyle;
  TextStyle? lableStyle;

  String? hint;
  InputBorder? border;
  bool? isPassword;
  bool? enbleBorder;
  double? raduis=0;
  Widget? lable;
  Color? fillColor;
  bool? useFillColor;
  Widget? prfxIcon;
  Widget? sufxIcon;
  TextInputType? keyboard;
int? maxline=1;
  String? Function(String?)? validator;
bool? enable=true;
  CutemTextFaild(
      {Key? key,
      required this.controler,
      this.border,
      this.inputStyle,
      this.hintStyle,
      this.lableStyle,
      this.hint,
      this.lable,
      this.fillColor,
      this.enbleBorder,
      this.useFillColor,
      this.isPassword,
        this.raduis,
        this.maxline=1,
      this.sufxIcon,
        this.keyboard,
        this.validator,
        this.enable,
      this.prfxIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis??0.0)
      ),
      clipBehavior: Clip.hardEdge,
      child: TextFormField(
validator: validator,
        enabled: enable,
        controller: controler,
        obscureText: isPassword ?? false,
        keyboardType: keyboard??TextInputType.text,
        style: inputStyle ??null,
        minLines: 1,
        maxLines: maxline,
        decoration: InputDecoration(

          fillColor: fillColor ?? null,
          filled: useFillColor ?? false,
          label: lable ?? null,
          hintText: hint,
          border: enbleBorder == false
              ? null
              : border ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: BorderSide(color: Colors.black54, width: 1)),
          hintStyle: hintStyle==null? null:hintStyle,
          prefixIcon: prfxIcon ?? null,
          suffixIcon: sufxIcon ?? null,
          labelStyle: lableStyle ?? null,
        ),
      ),
    );
  }
}
