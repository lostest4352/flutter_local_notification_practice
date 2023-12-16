import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notification_app/services/notification_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textEditingController = TextEditingController();

  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    notificationService.initialNotification();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification App"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: TextField(
                onTapOutside: (_) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: 'Enter the text',
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: CupertinoButton(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                color: Colors.blue,
                onPressed: () {
                  debugPrint("Button Pressed");
                  notificationService.sendNotification(
                    "Title",
                    () {
                      if (textEditingController.text.trim() == "") {
                        return "No text written";
                      } else {
                        return textEditingController.text.trim();
                      }
                    }(),
                  );
                },
                child: const Text(
                  "Send",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
