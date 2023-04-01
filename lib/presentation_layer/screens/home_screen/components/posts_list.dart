// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msincl/blocs/posts_bloc/post_bloc.dart';
import 'package:msincl/blocs/posts_bloc/post_event.dart';
import 'package:msincl/blocs/posts_bloc/posts_states.dart';
import 'package:msincl/helper/constants/color_helper.dart';
import 'package:msincl/helper/constants/const.dart';
import 'package:msincl/helper/constants/dimension.dart';
import 'package:msincl/helper/utils/styles.dart';
import 'package:msincl/models/post_model_class.dart';
import 'package:msincl/presentation_layer/widgets/circle_progress.dart';
import 'package:msincl/presentation_layer/widgets/text_widget.dart';

class PostsList extends StatefulWidget {
  PostsList({
    super.key,
  });

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostsBloc>(context).add(GetData(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostStates>(
      builder: (context, state) {
        return state.data.isEmpty
            ? CircleProgressBar(
                colors: HexColor(SECONDARY_COLOR),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  PostModelClass posts = state.data[index];
                  return Card(
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        child: TextsWidgets(
                            data: posts.title!,
                            styles: posts.userId.toString() == USERD_ID
                                ? CustomTextStyle.userPostTextStyle
                                : CustomTextStyle.postsTextStyle),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        child: TextsWidgets(
                          data: posts.body!,
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
