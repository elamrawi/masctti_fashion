import 'package:flutter/material.dart';

class OrderElement extends StatelessWidget {
  const OrderElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                "تنورة طويلة",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "120 ريال",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              visualDensity: VisualDensity(vertical: 0),
              dense: true,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/product/order.jpg'),
              ),
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 8,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'الكمية المطلوبة 1',
                  style: TextStyle(
                    color: Color(0xff838894),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 1),
                  height: 70, //67,
                  child: Stack(children: [
                    Positioned(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xffE8E9EA)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(22.84, 22.84)),
                        onPressed: () {},
                        child: const Icon(
                          Icons.add,
                          size: 10,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xffE8E9EA)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  side: const BorderSide(
                                      color: Color(0xffE8E9EA))),
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(22.84, 22.84)),
                          onPressed: () {},
                          child: const Icon(
                            Icons.remove,
                            size: 10,
                          )),
                    ),
                  ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
