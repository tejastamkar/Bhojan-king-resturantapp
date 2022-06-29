import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int orderNo, item;
  final String date, time, type, msg;
  final bool showtype, confimed;
  final List food;

  const OrderDetailsScreen(
      {Key? key,
      required this.orderNo,
      required this.item,
      required this.date,
      required this.time,
      required this.type,
      required this.showtype,
      required this.food,
      required this.msg,
      required this.confimed})
      : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  num price = 0, addon = 00, discount = 00, tax = 20, df = 30;
  String name = "Ashek Elahe",
      image =
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
      address = "670 rood, bldg-2,room-14, thane , Mumbai";
  double translateX = 0.0;
  double translateY = 0.0;
  double myWidth = 0;
  @override
  void initState() {
    for (int i = 0; i < widget.food.length; i++) {
      widget.food[i]["quantity"] != 0
          ? price += widget.food[i]["price"] * widget.food[i]["quantity"]
          : price += widget.food[i]["price"];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    Widget menuList({required int index}) => Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  widget.food[index]["image"],
                  width: 80,
                  height: 60,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.food[index]["name"],
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${widget.food[index]["price"]}.00",
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Text(
                      "Ouantity: ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "${widget.food[index]["quantity"]}",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
                Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      widget.food[index]["V/N"] ? "Veg" : "Non-Veg",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            )
          ],
        );
    Widget comfirmedSuccessful() => Transform.translate(
          offset: Offset(translateX, translateY),
          child: myWidth > 100.0
              ? AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                  width: 50 + myWidth,
                  height: 50,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(9.00),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 30,
                      ),
                      Flexible(
                        child: Text(
                          " Successful ",
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.00),
                        ),
                      ),
                    ],
                  ),
                )
              : AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                  width: 40 + myWidth,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.00),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.double_arrow_rounded,
                        color: Colors.white,
                        size: 40.00,
                      ),
                    ],
                  ),
                ),
        );

    _incTansXVal() async {
      int canLoop = -1;
      for (var i = 0; canLoop == -1; i++) {
        await Future.delayed(const Duration(milliseconds: 3), () {
          setState(() {
            if (translateX + 1 <
                MediaQuery.of(context).size.width - (90 + myWidth)) {
              translateX += 1;
              myWidth = MediaQuery.of(context).size.width - (90 + myWidth);
            } else {
              canLoop = 1;
            }
          });
        });
      }
    }

    Widget menuSlider() => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(230, 230, 233, 1)),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: GestureDetector(
              onHorizontalDragUpdate: (event) async {
                if (event.primaryDelta! > 10) {
                  await _incTansXVal();
                }
              },
              onHorizontalDragEnd: (event) {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  comfirmedSuccessful(),
                  myWidth == 0.0
                      ? Expanded(
                          child: Center(
                            child: Text(
                              "Swipe to ${widget.msg}",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20.00),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        );

    Widget bottomButtons() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  onPrimary: Colors.black,
                  primary: Colors.white,
                  side: const BorderSide(color: Colors.black)),
              onPressed: (() => Navigator.pop(context)),
              child: const Text(
                "Cancel",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                onPrimary: Colors.white,
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: (() => Navigator.pop(context)),
              child: const Text(
                "Confirm",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );

    Widget orderBill() => Column(
          children: [
            Row(
              children: [
                const Text("Item Price",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                const Spacer(),
                Text(
                  "₹$price",
                ),
              ],
            ),
            Row(
              children: [
                const Text("Addons",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                const Spacer(),
                Text("₹$addon",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
            Container(
              width: width,
              height: 2,
              color: Colors.black38,
            ),
            Row(
              children: [
                const Text("Subtotal",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                const Spacer(),
                Text("₹${price + addon}",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
            Row(
              children: [
                const Text("Discount",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                const Spacer(),
                Text("₹$discount",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
            Row(
              children: [
                const Text("Tax",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                const Spacer(),
                Text("₹$tax",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
            Row(
              children: [
                const Text("Delivery Fee",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                const Spacer(),
                Text("₹$df",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
            Container(
              width: width,
              height: 2,
              color: Colors.black38,
            ),
            Row(
              children: [
                Text("Total Amount",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor)),
                const Spacer(),
                Text("₹${price + addon + df + tax + discount}",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor)),
              ],
            ),
          ],
        );

    return Scaffold(
      bottomNavigationBar: widget.confimed ? menuSlider() : bottomButtons(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Order Details",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Order ID: #${widget.orderNo}",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      "${widget.date} , ${widget.time}",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              widget.showtype
                  ? Row(
                      children: [
                        const Text(
                          "Order Status",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Card(
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              widget.type,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    )
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: width,
                  height: 2,
                  color: Colors.black38,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "Item: ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "${widget.item}",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor),
                  ),
                  const Spacer(),
                  widget.showtype
                      ? Text(
                          "Delivred at ${widget.date} , ${widget.time}",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: width,
                  height: 2,
                  color: Colors.black38,
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.food.length,
                  itemBuilder: (context, index) => menuList(index: index)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: width,
                  height: 2,
                  color: Colors.black38,
                ),
              ),
              const Text(
                "Customer Details",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        address,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black38),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              orderBill()
            ],
          ),
        ),
      ),
    );
  }
}
