import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/fonts/app_fonts.dart';


class CheckOutButtonWidget extends StatelessWidget {
  const CheckOutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD21E6A)),
          onPressed: () {},
          child: Text("Checkout", style: AppFonts.font18Wight500Weight)),
    );
  }
}
