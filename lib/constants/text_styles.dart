import 'package:flutter/material.dart';

class KTextStyles {
  static const String fontFamily = "Stack Sans Text";
  static const TextStyle base = TextStyle(fontFamily: fontFamily);

  static final TextStyle regular12 = base.copyWith(fontSize: 12);
  static final TextStyle regular16 = base.copyWith(fontSize: 16);
  static final TextStyle regular22 = base.copyWith(fontSize: 22);
  static final TextStyle regular28 = base.copyWith(fontSize: 28);
  static final TextStyle regular36 = base.copyWith(fontSize: 36);
  static final TextStyle regular40 = base.copyWith(fontSize: 40);

  static final TextStyle light12 = regular12.copyWith(
    fontWeight: FontWeight.w300,
  );
  static final TextStyle light16 = regular16.copyWith(
    fontWeight: FontWeight.w300,
  );
  static final TextStyle light22 = regular22.copyWith(
    fontWeight: FontWeight.w300,
  );
  static final TextStyle light28 = regular28.copyWith(
    fontWeight: FontWeight.w300,
  );
  static final TextStyle light36 = regular36.copyWith(
    fontWeight: FontWeight.w300,
  );
  static final TextStyle light40 = regular40.copyWith(
    fontWeight: FontWeight.w300,
  );

  static final TextStyle medium12 = regular12.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle medium16 = regular16.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle medium22 = regular22.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle medium28 = regular28.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle medium36 = regular36.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle medium40 = regular40.copyWith(
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bold12 = regular12.copyWith(
    fontWeight: FontWeight.w600,
  );
  static final TextStyle bold16 = regular16.copyWith(
    fontWeight: FontWeight.w600,
  );
  static final TextStyle bold22 = regular22.copyWith(
    fontWeight: FontWeight.w600,
  );
  static final TextStyle bold28 = regular28.copyWith(
    fontWeight: FontWeight.w600,
  );
  static final TextStyle bold36 = regular36.copyWith(
    fontWeight: FontWeight.w600,
  );
  static final TextStyle bold40 = regular40.copyWith(
    fontWeight: FontWeight.w600,
  );
}
