import 'package:flutter/material.dart';

abstract class PostsEvents {}

class GetData extends PostsEvents {
  BuildContext? cntxt;
  GetData(this.cntxt);
}
