import 'package:flutter/material.dart';
import 'package:flutter_form/ui/models/mahasiswa.dart';
import 'package:flutter_form/ui/shared/gaps.dart';
import 'package:flutter_form/ui/shared/theme.dart';

class MahasiswaCard extends StatelessWidget {
  final String name;
  final String nim;
  final String email;
  final int mahasiswaId;
  final Function() onTap;
  final Function(int) onDelete;

  const MahasiswaCard({
    Key? key,
    required this.name,
    required this.nim,
    required this.email,
    required this.onTap,
    required this.mahasiswaId,
    required this.onDelete,
  }) : super(key: key);

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
                borderRadius: BorderRadius.circular(10),
              ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 35,
                            child: ElevatedButton(
                              onPressed: onTap,
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
                                  fontSize: 14,
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
                            width: MediaQuery.of(context).size.width / 2 - 35,
                            child: ElevatedButton(
                              onPressed: () {
                                // Show confirmation dialog before deleting
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Konfirmasi'),
                                      content: Text(
                                        'Apakah Anda yakin ingin menghapus mahasiswa ini?',
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(
                                                false); // Close the dialog with a value of false (do not delete)
                                          },
                                          child: Text('Tidak'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(
                                                true); // Close the dialog with a value of true (will delete)
                                          },
                                          child: Text('Ya'),
                                        ),
                                      ],
                                    );
                                  },
                                ).then((shouldDelete) {
                                  // If shouldDelete is true, delete the Mahasiswa data
                                  if (shouldDelete ?? false) {
                                    onDelete(mahasiswaId);
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kRedColor,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Delete',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: extraBold,
                                    ),
                                  ),
                                  gapW4,
                                  Icon(
                                    Icons.delete,
                                    color: kWhiteColor,
                                    size: 18,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
