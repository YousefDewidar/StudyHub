import 'package:computers/features/home/ui/widgets/general%20ser/general_ser_card.dart';
import 'package:flutter/material.dart';

class GeneralSerListView extends StatelessWidget {
  const GeneralSerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .24,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          GeneralSerCard(),
          GeneralSerCard(),
          GeneralSerCard(),
        ],
      ),
    );
  }
}

