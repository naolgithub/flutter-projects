import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fullstack_instagram_clone/resources/firestore_methods.dart';
import 'package:fullstack_instagram_clone/utils/colors.dart';
import 'package:fullstack_instagram_clone/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
//******** beginning of it*/
  File? _filee;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      _filee = File(pickedFile!.path);
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    setState(() {
      _filee = File(pickedFile!.path);
    });
  }

//********* end of it */

  // Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();
  bool _isLoading = false;
  void postImage(
    String uid,
    String username,
    String profImage,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      // String res = await FirestoreMethods().uploadPost(
      //   _descriptionController.text,
      //   _file!,
      //   uid,
      //   username,
      //   profImage,
      // );

      String res = await FirestoreMethods().uploadPost(
        _descriptionController.text,
        _filee!,
        uid,
        username,
        profImage,
      );
      if (res == 'success') {
        setState(() {
          _isLoading = false;
        });
        showSnackBar('Posted!', context);
      } else {
        setState(() {
          _isLoading = false;
        });
        showSnackBar(res, context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Create a post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  // Uint8List file = await pickImage(ImageSource.camera);
                  // setState(() {
                  //   _file = file;
                  // });

                  final pickedFile = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  setState(() {
                    _filee = File(pickedFile!.path);
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  // Uint8List file = await pickImage(ImageSource.gallery);
                  // setState(() {
                  //   _file = file;
                  // });

                  final pickedFile = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  setState(() {
                    _filee = File(pickedFile!.path);
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return _filee == null
        ? Center(
            child: IconButton(
              onPressed: () => _selectImage(context),
              icon: const Icon(Icons.upload),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              title: const Text('Post to'),
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: () => postImage(
                    userProvider.getUser!.uid,
                    userProvider.getUser!.username,
                    userProvider.getUser!.photoUrl,
                  ),
                  child: const Text(
                    'Post',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                _isLoading ? const LinearProgressIndicator() : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(userProvider.getUser!.photoUrl),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          hintText: 'Write a caption ...',
                          border: InputBorder.none,
                        ),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              // image: MemoryImage(_file!),
                              image: FileImage(_filee!),
                              fit: BoxFit.fill,
                              alignment: FractionalOffset.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ],
            ),
          );
  }
}
