import 'package:flower_app/common/common.dart';

class OccasionScreen extends StatelessWidget {
  const OccasionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(AppLocalizations.of(context)!.occasions),
        ),
      ),
    );
  }
}
