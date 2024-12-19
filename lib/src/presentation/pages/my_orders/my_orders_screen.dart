import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_action.dart';
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_actions.dart';
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_states.dart';
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_view_model.dart';
import 'package:flower_app/src/presentation/pages/my_orders/my_orders_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common.dart';

class MyOrdersScreen extends StatefulWidget {
  MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with TickerProviderStateMixin {
  final viewModel = getIt.get<MyOrdersViewModel>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
     viewModel.doAction(GetUserCartItemsAction());
    _tabController.addListener((){
      if(_tabController.index ==  0){
        viewModel.doAction(GetActiveOrdersAction());
      }else{
        viewModel.doAction(GetCompletedOrderAction());
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
        return viewModel;
      },
      child: BlocBuilder<MyOrdersViewModel, MyOrdersStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('My Orders', style: AppTextStyles.font20WeightMedium),
              bottom: TabBar(
                indicatorWeight: 2,
                labelStyle: AppTextStyles.font16BlackBase400Weight,
                unselectedLabelColor: AppColors.kWhite70,
                labelColor: AppColors.kBaseColor,
                indicatorSize: TabBarIndicatorSize.tab,
                controller: _tabController,
                indicatorColor: AppColors.kBaseColor,
                tabs: const [
                  Tab(text: 'Active'),
                  Tab(text: 'Completed'),
                ],
              ),
            ),
            body: const MyOrdersScreenBody(),
          );
        },
      ),
    );
  }
}
