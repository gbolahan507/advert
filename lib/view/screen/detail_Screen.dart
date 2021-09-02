import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jiji_clone/core/model/service_model.dart';
import 'package:jiji_clone/view/widgets/export.dart';

class DetailScreen extends StatelessWidget {
  final Datum serviceModel;
  final doublbBounce = SpinKitDoubleBounce(
    color: Styles.appBackground,
    size: 30.0,
  );

  DetailScreen({this.serviceModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenAwareSize(20, context)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            _productImage(context),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.white),
                  child: _productDescription(context)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productImage(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              width: 300,
              decoration: new BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.elliptical(300, 50)),
              ),
            ),
          ),
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: serviceModel?.images[0] ?? '',
              height: screenAwareSize(200, context),
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: (context, url) => doublbBounce,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ],
    );
  }

  Widget _productDescription(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 48,
              child: Divider(
                thickness: 5,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Best choice',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText('${serviceModel.title.toUpperCase()}',
                fontWeight: FontWeight.bold, fontSize: 20),
            Row(
              children: [
                CustomText('Rating', fontWeight: FontWeight.bold, fontSize: 13),
                horizontalSpaceSmall,
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                      color: Colors.green),
                  child: CustomText(serviceModel.rating.toString(),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
        CustomText(
          'About',
          fontWeight: FontWeight.bold,
          fontSize: 14,
          textAlign: TextAlign.start,
          color: Styles.colorDeepPink,
        ),
        CustomText(
          serviceModel.description,
          maxLines: 10,
          fontSize: 14,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w600,
        ),
        verticalSpaceMedium,
        detailsItem(
            context, Icons.location_city, 'Location', serviceModel.address),
        verticalSpaceMedium,
        Row(
          children: [
            Expanded(
              child: detailsItem(
                  context, Icons.phone, 'Contact', serviceModel.phone),
            ),
            Expanded(
              child: detailsItem(
                  context, Icons.email, 'Email', serviceModel.email),
            )
          ],
        ),
        CustomText(
          'Related Images',
          fontWeight: FontWeight.bold,
          fontSize: 14,
          textAlign: TextAlign.start,
          color: Styles.colorDeepPink,
          bottomMargin: 5,
        ),
        Container(
          height: 120,
          width: 200,
          child: ListView.separated(
              itemCount: serviceModel.images?.length ?? 0,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => Divider(
                    color: Styles.colorLightBlue,
                    thickness: 2,
                  ),
              itemBuilder: (context, index) {
                print(serviceModel.images?.length ?? 0);
                return Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 100,
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 25,
                                  width: 100,
                                  decoration: new BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(100, 25)),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: serviceModel?.images[index] ?? '',
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  placeholder: (context, url) => doublbBounce,
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
              }),
        )
      ],
    );
  }

  Widget detailsItem(
      BuildContext context, IconData icon, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          color: Styles.colorPurpleLight,
        ),
        horizontalSpaceSmall,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(
                title,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Styles.colorDeepPink,
              ),
              CustomText(
                subtitle,
                fontSize: 13,
                maxLines: 5,
                textAlign: TextAlign.start,
                color: Styles.colorBlack,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        )
      ],
    );
  }
}
