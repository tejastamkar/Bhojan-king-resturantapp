import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CampaignCard extends StatelessWidget {
  final String image, name, decs, date;
  final bool created, join;
  const CampaignCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.decs,
      required this.date,
      required this.created,
      required this.join})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                image,
                fit: BoxFit.fill,
                width: 85,
                height: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: width / 2,
                    child: Text(
                      decs,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 0.61)),
                    ),
                  ),
                  Row(
                    children: [
                      created
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 1),
                                  onPrimary: Colors.white,
                                  primary:
                                      const Color.fromRGBO(42, 52, 102, 1)),
                              onPressed: () {},
                              child: const Text(
                                "Delete Now",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w400),
                              ))
                          : join
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 1),
                                      onPrimary: Colors.white,
                                      primary: Theme.of(context).primaryColor),
                                  onPressed: () {},
                                  child: const Text(
                                    "Leave Now",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ))
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 1),
                                      onPrimary: Colors.white,
                                      primary:
                                          const Color.fromRGBO(42, 52, 102, 1)),
                                  onPressed: () {},
                                  child: const Text(
                                    "Join Now",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  )),
                      SizedBox(
                        width: width / 4,
                      ),
                      SvgPicture.asset(
                        "icons/Calendar.svg",
                        width: 12,
                        height: 12,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        date,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 0.61)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
