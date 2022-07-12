import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                openWhatsApp();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.whatsapp,
                    size: 40,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'WhatsApp',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'send a massege to developer on WhatsApp',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                openEmail();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.email_outlined,
                    size: 40,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'send an email to developer',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                openSMS();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.sms_outlined,
                    size: 40,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'SMS',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'send SMS to developer',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                openGitHub();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'GitHub',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'open developer Github profile',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  openWhatsApp() async {
    String whatsApp =
        "whatsapp://send?phone=970567773655&text=${Uri.encodeFull('')}";
    {
      launchUrl(
        Uri.parse(whatsApp),
      );
    }
  }

  openEmail() async {
    String email = "mailto:mumen.3eta@gmail.com?subject=&body=";
    {
      launchUrl(
        Uri.parse(email),
      );
    }
  }

  openSMS() async {
    String sms = "sms:0567773655";
    {
      launchUrl(
        Uri.parse(sms),
      );
    }
  }

  openGitHub() {
    launchUrl(Uri.parse('https://github.com/mumen-3eta?tab=repositories'),
        mode: LaunchMode.externalApplication);
  }
}
