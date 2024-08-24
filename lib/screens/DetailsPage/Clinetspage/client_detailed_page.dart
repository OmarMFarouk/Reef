import 'package:cached_network_image/cached_network_image.dart';
import 'package:erp12k/components/Buttons/custom_elevated_button.dart';
import 'package:erp12k/screens/DetailsPage/Clinetspage/Widgets/cdp_elevated_page_view_widget.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_location.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as urLauncher;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ClientDetailedPage extends StatefulWidget {
  const ClientDetailedPage(
      {super.key, required this.id, required this.clientDetailes});
  final String id;
  final clientDetailes;

  @override
  State<ClientDetailedPage> createState() => _ClientDetailedPageState();
}

class _ClientDetailedPageState extends State<ClientDetailedPage> {
  void _launchURL(Uri uri, bool inApp) async {
    try {
      if (await canLaunchUrl(uri)) {
        if (inApp) {
          await launchUrl(uri, mode: LaunchMode.inAppWebView);
        } else {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    LocationService().currentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondry,
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: true,
          title: SizedBox(
              height: 90, child: Image.asset('assets/images/logo.jpg'))),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: widget.clientDetailes['image'].isEmpty
                        ? null
                        : () => previewImage(
                            context: context,
                            path: widget.clientDetailes['image']),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      foregroundImage: widget.clientDetailes['image'].isEmpty
                          ? null
                          : CachedNetworkImageProvider(
                              widget.clientDetailes['image']),
                      radius: 50,
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    widget.clientDetailes['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.clientDetailes['email'],
                    // id,
                    style: const TextStyle(fontSize: 15, color: Colors.black45),
                  ),
                ],
              ),
            ),
            CDPElevatedPageViewWidget(
              clientDetailes: widget.clientDetailes,
              id: widget.id,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.black12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomElevatedButton(
                      color: Colors.orange,
                      icon: const Icon(Icons.email),
                      ontap: () {
                        _launchURL(
                            Uri.parse(
                                'mailto:${widget.clientDetailes['email']}'),
                            false);
                      },
                    ),
                    CustomElevatedButton(
                      color: Colors.green,
                      icon: const Icon(Icons.location_on),
                      ontap: () {
                        urLauncher.launchUrl(Uri.parse(
                            'https://www.google.com/maps/${LocationService.currentPosition!.latitude},${LocationService.currentPosition!.longitude}/place/@${widget.clientDetailes['latitude']},${widget.clientDetailes['longitude']},15z?entry=ttu'));
                      },
                    ),
                    CustomElevatedButton(
                      color: Colors.blue,
                      icon: const Icon(Icons.call),
                      ontap: () {
                        _launchURL(
                            Uri.parse(
                                'tel:+20${widget.clientDetailes['phone1']}'),
                            false);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

previewImage({required String path, required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        height: 450,
        width: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.fill, image: CachedNetworkImageProvider(path))),
      ),
    ),
  );
}
