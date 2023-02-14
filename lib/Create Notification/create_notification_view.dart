import 'package:flutter/material.dart';

import 'package:ooad_vubaochau/Create%20Notification/abstract_create_noti_view.dart';
import 'package:ooad_vubaochau/Create%20Notification/create_notification_presenter.dart';

class CreateNotificationScreen extends StatefulWidget {
  const CreateNotificationScreen({super.key});

  @override
  State<CreateNotificationScreen> createState() =>
      _CreateNotificationScreenState();
}

class _CreateNotificationScreenState extends State<CreateNotificationScreen>
    with CreateNotiView {
  late TextEditingController titleControl;
  late TextEditingController descControl;

  late CreateNotiPresenter presenter;

  bool isCreating = false;

  @override
  void initState() {
    titleControl = TextEditingController();
    descControl = TextEditingController();
    super.initState();
    presenter = CreateNotiPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeColor,
          image: const DecorationImage(
            image: AssetImage('images/position_right.png'),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: IconButton(
                onPressed: () {
                  if (isCreating == false) {
                    Navigator.of(context).pop();
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.notifications,
                    color: Colors.black54,
                    size: 32,
                  ),
                  Text(
                    'Create Notification',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 68, left: 20, right: 20, bottom: 30),
                child: Column(
                  children: [
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: titleControl,
                      cursorColor: Colors.black,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "Notification's title",
                        filled: true,
                        fillColor: Colors.white38,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.black54,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 18,
                      controller: descControl,
                      enableInteractiveSelection: true,
                      cursorColor: Colors.black,
                      style: const TextStyle(fontSize: 16),
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "Add a more detailed description...",
                        filled: true,
                        fillColor: Colors.white38,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.black54,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff833ab4),
                                Color(0xfffd1d1d),
                                Color(0xfffcb045),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              btnClearClick();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: const EdgeInsets.all(14),
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff00d2ff),
                                  Color(0xff3a7bd5),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                btnCreateClick();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: isCreating
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 3,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          'CREATING...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    )
                                  : const Text(
                                      'CREATE',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void btnCreateClick() {
    if (titleControl.text.isNotEmpty && descControl.text.isNotEmpty) {
      if (isCreating == false) {
        setState(() {
          isCreating = true;
        });
        presenter
            .createNotification(
                titleControl.text.trim(), descControl.text.trim())
            .whenComplete(() {
          titleControl.clear();
          descControl.clear();
          setState(() {
            isCreating = false;
          });
        });
      }
    }
  }

  void btnClearClick() {
    if (isCreating == false) {
      titleControl.clear();
      descControl.clear();
    }
  }
}
