import 'dart:io';
import 'dart:typed_data';
import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
import 'package:doctracker/logic/cubit/image_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  File? image;
  final ImagePicker _picker = ImagePicker();
  final GFBottomSheetController _bottom_sheet_controller =
      GFBottomSheetController();
  Future selectImageFromGallery(BuildContext context) async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final File temp_img = File(image.path);
      setState(() {
        this.image = temp_img;
      });
      print(this.image.toString().split('/').last.split('.').last);
      final fileType =
          '.' + this.image.toString().split('/').last.split('.').last;
      await context
          .read<ImageCubit>()
          .getURLs(fileType.substring(0, fileType.length - 1));
      //Uint8List byte = await this.image!.readAsBytesSync();
      await context
          .read<ImageCubit>()
          .uploadImage(image, fileType.substring(1, fileType.length - 1));
      final image_state = context.read<ImageCubit>().state;
      await context.read<UserCubit>().updateProfilePic(
          (image_state is ImageUploaded) ? image_state.download_url : "");
    } catch (e) {
      print(e);
    }
  }

  Future selectImageFromcamera(BuildContext context) async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final temp_img = File(image.path);
      setState(() {
        this.image = temp_img;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user_state = context.read<UserCubit>().state;
    context.read<BotnavbarCubit>().onSelect(4);
    final bottom_sheet = GFBottomSheet(
        controller: _bottom_sheet_controller,
        animationDuration: 250,
        maxContentHeight: 160,
        stickyHeaderHeight: 5,
        elevation: 1,
        stickyHeader: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 150, 129, 236),
              boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 0)]),
          child: const GFListTile(),
        ),
        contentBody: Container(
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              GFButton(
                onPressed: () {
                  selectImageFromGallery(context);
                },
                text: "From Gallery",
              ),
              GFButton(
                onPressed: () {
                  selectImageFromcamera(context);
                },
                text: "From camera",
              ),
              GFButton(
                onPressed: () {},
                text: "View Image",
              ),
            ],
          ),
        ));

    void onTapAvatar() {
      (_bottom_sheet_controller.isBottomSheetOpened)
          ? _bottom_sheet_controller.hideBottomSheet()
          : _bottom_sheet_controller.showBottomSheet();
    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: MyBottomNavBar(),
        bottomSheet: bottom_sheet,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Stack(children: [
                InkWell(
                  onTap: () {
                    onTapAvatar();
                  },
                  child: BlocBuilder<ImageCubit, ImageState>(
                      builder: (context, state) {
                    if ((state is ImageLoading) || (state is ImageError)) {
                      return CircularProgressIndicator.adaptive();
                    } else if (state is ImageUploaded) {
                      return ClipOval(
                        child: Image.network(
                          (state.download_url),
                          width: 110,
                          height: 110,
                        ),
                      );
                    }
                    final image = (user_state is UserLogedin)
                        ? Image.network(
                            user_state.user.image_url,
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            ('assets/images/profile.png'),
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                          );
                    return ClipOval(child: image);
                  }),
                  // child: (image != null)
                  //     ? ClipOval(
                  //         child: Image.network(
                  //         this.image!,
                  //         width: 110,
                  //         height: 110,
                  //         fit: BoxFit.cover,
                  //       ))
                  //     : ClipOval(
                  //         child: Image.asset(
                  //         'assets/images/profile.png',
                  //         width: 110,
                  //         height: 110,
                  //       )),
                ),
                Positioned(
                    bottom: 10,
                    right: 5,
                    child: const Icon(
                      Icons.camera_alt_sharp,
                      color: Color.fromARGB(255, 174, 171, 171),
                      size: 30,
                    ))
              ]),
            ),
            const Divider(
              thickness: 2,
            )
          ],
        ),
      ),
    );
  }
}
