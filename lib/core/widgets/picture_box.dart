import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signin_app/core/utils/helper.dart';
import 'package:signin_app/cunits/user%20cubit/user_cubit.dart';
import 'package:signin_app/cunits/user%20cubit/user_state.dart';


class PictureBox extends StatefulWidget {
  const PictureBox({super.key});

  @override
  State<PictureBox> createState() => _PictureBoxState();
}

class _PictureBoxState extends State<PictureBox> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return InkWell(
          onTap:
              () => ImagePicker()
                  .pickImage(source: ImageSource.gallery)
                  .then(
                    (value) {
                      context.read<UserCubit>().UploadProfilePic(value!);
                    }
                        
                  ),
          child: context.read<UserCubit>().profilepic == null? CircleAvatar(
            backgroundImage: AssetImage(AssetsData.AvatarImage),
            radius: 50,
          ) : CircleAvatar(
            backgroundImage: FileImage(File(context.read<UserCubit>().profilepic!.path)),
            radius: 50,
          ),
        );
      },
    );
  }
}
