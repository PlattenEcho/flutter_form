import 'package:flutter/material.dart';
import 'package:flutter_form/ui/shared/gaps.dart';
import 'package:flutter_form/ui/shared/theme.dart';

class MahasiswaCard extends StatelessWidget {
  final String name;
  final String nim;
  final String email;
  final String price;
  final String workPeriod;
  final String rating;
  final Function() onTap;

  const MahasiswaCard({
    super.key,
    required this.name,
    required this.nim,
    required this.email,
    required this.price,
    required this.workPeriod,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          gapW12,
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: extraBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  nim,
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: extraBold,
                  ),
                ),
                Text(
                  email,
                  style: blackTextStyle.copyWith(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                gapH24,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: ElevatedButton(
                            onPressed: () {
                              onTap();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kGreenColor,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: Text(
                              'Edit',
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: extraBold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    gapW8,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 35,
                          decoration: BoxDecoration(
                            color: kRedColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  size: 15,
                                  color: kWhiteColor,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
