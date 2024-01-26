import 'package:kiwkiw_seller/const/const.dart';
import 'package:kiwkiw_seller/widgets/appbar_widget.dart';
import 'package:kiwkiw_seller/widgets/dashboard_button.dart';
import 'package:kiwkiw_seller/widgets/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(dashboard),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context,
                    title: products, count: '75', icon: icProducts),
                dashboardButton(context,
                    title: orders, count: '5', icon: icOrders),
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context,
                    title: rating, count: '75', icon: icStar),
                dashboardButton(context,
                    title: totalSales, count: '5', icon: icOrders),
              ],
            ),
            10.heightBox,
            const Divider(),
            10.heightBox,
            boldText(text: popular, color: fontGrey, size: 16.0),
            20.heightBox,
            ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                3,
                (index) => ListTile(
                  onTap: () {},
                  leading: Image.asset(
                    imgProduct,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  title: boldText(
                    text: 'Products title',
                    color: fontGrey,
                  ),
                  subtitle: normalText(text: 'Rp. 500.000', color: darkGrey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
