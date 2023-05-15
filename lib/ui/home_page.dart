import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:to_do_flutter_app/cons/colors.dart';
import 'package:to_do_flutter_app/cons/dimens.dart';
import 'package:to_do_flutter_app/data/dao/database/database_service.dart';
import 'package:to_do_flutter_app/data/models/todo_model.dart';
import 'package:to_do_flutter_app/data/repository/local/todo_local_source.dart';
import 'package:to_do_flutter_app/data/repository/todo_repository.dart';
import 'package:to_do_flutter_app/route/routes.dart';
import 'package:to_do_flutter_app/ui/controller/home_page_controller.dart';
import 'package:to_do_flutter_app/ui/home_page_widget/add_button_widget.dart';
import 'package:to_do_flutter_app/ui/home_page_widget/todo_item_widget.dart';
import 'package:to_do_flutter_app/ui/home_page_widget/top_tab_view_wiget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  late HomePageController homePageController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    homePageController = HomePageController(
      getTodosUseCase: context.read(),
      getTodosDoneUseCase: context.read(),
      checkTodoUseCase: context.read(),
    );
    homePageController.fetchTodo();
    homePageController.fetchTodoDone();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.tabViewColor,
        shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Dimens.size30),
            bottomRight: Radius.circular(Dimens.size30),
          ),
        ),
        bottom: _buildTabBar(),
      ),
      body: BlocProvider.value(
        value: homePageController,
        child: Stack(
          children: [
            Positioned.fill(child: _buildTodoBody()),
            Positioned(
              bottom: Dimens.size8,
              right: Dimens.size8,
              child: AddButtonWidget(
                onPressed: _onPressedAddBtn,
              ),
            )
          ],
        ),
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      controller: tabController,
      padding: const EdgeInsets.only(bottom: Dimens.size20),
      indicatorWeight: 1,
      indicatorColor: AppColors.subTextTodoColor,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: const TextStyle(
        fontSize: Dimens.size30,
      ),
      dividerColor: AppColors.textTodoColor,
      tabs: const [
        Tab(
          text: "TODO",
        ),
        Tab(
          text: "DONE",
        ),
      ],
    );
  }

  Widget _buildTodoBody() {
    return TabBarView(
      controller: tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildTodosListView(),
        _buildDoneListView(),
      ],
    );
  }

  Widget _buildTodosListView() {
    /* if(listTodo.isEmpty){
      return Container();
    }*/
    return BlocConsumer<HomePageController, HomePageState>(
      listener: (context,homeState)=> homeState.listTodo,
      builder: (BuildContext context, homeState) {
        return ListView.builder(
          itemCount: homeState.listTodo.length,
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.size19,
            horizontal: Dimens.size8,
          ),
          itemBuilder: (context, index) {
            final data = homeState.listTodo[index];
            return TodoItemWidget(
              key: ValueKey(data.id),
              todo: data,
              onPressed: (value) => _onPressedCheck(data.id, value),
            );
          },
        );
      },
    );
  }

  Widget _buildDoneListView() {
    /*if(listDone?.isEmpty){
     return Container();
    }*/
    return BlocConsumer<HomePageController, HomePageState>(
      listener: (context, homeState) => homeState.listTodoDone,
      builder: (context, homeState) {
        return ListView.builder(
          itemCount: homeState.listTodoDone.length,
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.size19,
            horizontal: Dimens.size8,
          ),
          itemBuilder: (context, index) {
            final data = homeState.listTodoDone[index];
            return TodoItemWidget(
              key: ValueKey(data.id),
              todo: data,
              onPressed: (value) => _onPressedCheck(data.id, value),
            );
          },
        );
      },
    );
  }

  void _onPressedAddBtn() {
    final path = "${GoRouter.of(context).location}/${RoutePath.addPath}";
    return context.go(path);
  }

  void _onPressedCheck(int id, bool isCheck) {
    homePageController.checkTodo(id);
  }
}
