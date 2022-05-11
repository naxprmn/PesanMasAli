import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:overflow/model/model.dart';

class BottomSheetCustom {
  buildBottomBar(BuildContext context, Ruang item) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet<void>(
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        context: context,
        builder: (BuildContext context) {
          // ignore: sized_box_for_whitespace
          return Container(
              height: size.height / 2,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _buildTitle(item, context),
                      _buildAvatar(item),
                      const Divider(),
                      _buildBody(item),
                      _buildFooter()
                    ],
                  ),
                ),
              ));
        });
  }

  Widget _buildTitle(Ruang item, context) {
    return Row(children: [
      Expanded(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            item.location,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      IconButton(
        icon: const Icon(FontAwesomeIcons.xmark),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ]);
  }

  Widget _buildAvatar(Ruang item) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            maxRadius: 50,
            backgroundImage: AssetImage(item.photoPerson),
          ),
          Column(
            children: [
              Text(item.name),
              Text(item.title),
            ],
          ),
        ],
      ),
    ]);
  }

  Widget _buildBody(Ruang item) {
    List<Widget> pelayanan = [];
    for (var list in item.pelayanan) {
      pelayanan.add(Text(list));
    }
    return Expanded(
        child: Center(
      child: Row(children: [
        const Spacer(),
        Image.asset(item.photoLocation),
        const SizedBox(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'JADWAL PELAYANAN : ${item.jadwalPelayanan}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ...pelayanan
          ],
        ),
        const Spacer(),
      ]),
    ));
  }

  Widget _buildFooter() {
    return const Text(
      'Puskesmas Kaliangkrik, Kabupaten Magelang, Jawa Tengah',
      style: TextStyle(fontStyle: FontStyle.italic),
    );
  }
}
