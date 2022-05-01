import 'dart:io';
import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
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
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final temp_img = File(image.path);
      setState(() {
        this.image = temp_img;
      });
    } catch (e) {
      print(e);
    }
  }

  Future selectImageFromcamera(BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
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
                  child: (image != null)
                      ? ClipOval(
                          child: Image.file(
                          image!,
                          width: 110,
                          height: 110,
                          fit: BoxFit.cover,
                        ))
                      : ClipOval(
                          child: Image.asset(
                          'assets/images/profile.png',
                          width: 110,
                          height: 110,
                        )),
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
