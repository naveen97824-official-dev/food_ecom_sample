import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:auto_route/auto_route.dart';
import 'package:food_ecom_sample/components/menu_item_card/menu_item_card.dart';
import 'package:food_ecom_sample/image_asset.dart';
import 'package:food_ecom_sample/models/menu/menu.dart';
import 'package:food_ecom_sample/pages/home_page/home_page.dart';
import 'package:food_ecom_sample/pages/home_page/home_page_view_model.dart';
import 'package:food_ecom_sample/router/router.gr.dart';
import 'package:food_ecom_sample/store/state/app_state.dart';
import 'package:food_ecom_sample/store/state/login_state.dart';
import 'package:food_ecom_sample/themes/color_theme.dart';

class HomePageView extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  HomePageViewModel viewModel = HomePageViewModel();

  void initState() {
    super.initState();
    viewModel.menuList = viewModel.menuDetailJson
        .map<Menu>((json) => Menu.fromJson(json))
        .toList();
    print(viewModel.menuList);
    viewModel.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginState>(
      onInit: (store) {
        viewModel.tempStore = store;
      },
      converter: (store) {
        return store.state.loginState!;
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorTheme.colorTheme.whiteColor,
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: ColorTheme.colorTheme.whiteColor,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  context.router.push(CartRoute());
                },
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: [
                      Text(viewModel.tempStore!.state.loginState?.userDetail
                              ?.emailId ??
                          "New user"),
                      Text(viewModel.tempStore!.state.loginState?.userDetail
                              ?.password ??
                          "New user"),
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              topSection(),
              SizedBox(
                height: 14,
              ),
              chipSection(),
              SizedBox(
                height: 14,
              ),
              specialOfferSection(),
              SizedBox(
                height: 14,
              ),
              popularSection(),
            ],
          ),
        );
      },
    );
  }

  Widget specialOfferSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Today's special Offers",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          specialOfferCard(),
        ],
      ),
    );
  }

  Widget popularSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular now",
                style: TextStyle(
                  color: ColorTheme.colorTheme.primaryTextColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "See full menu >",
                style: TextStyle(
                    color: ColorTheme.colorTheme.primaryColor, fontSize: 12),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          // InkWell(
          //   onTap: () {
          //     context.router.push(MenuDetailRoute());
          //   },
          //   child: MenuItemCard(
          //     menu: viewModel.menuList[0],
          //   ),
          // ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: viewModel.productList
                  .map((eachMenu) => InkWell(
                        onTap: () {
                          context.router.push(MenuDetailRoute());
                        },
                        child: SizedBox(
                          width: 120,
                          child: MenuItemCard(
                            menu: eachMenu,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget specialOfferCard() {
    return Container(
      height: 170,
      child: Card(
        elevation: 3,
        color: ColorTheme.colorTheme.whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                child: Image.network(
                  "https://media.istockphoto.com/id/998309062/photo/burger-with-beef-and-cheese.jpg?s=1024x1024&w=is&k=20&c=8dsV5BdPbebUGFkWuFenRKeaOe95BEnlcRkPqEo6PxA=",
                  fit: BoxFit.fill,
                  height: 170,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Yummies special burger",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Now",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "N1,800",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "(18% off)",
                      style: TextStyle(
                          fontSize: 12,
                          color: ColorTheme.colorTheme.dangerColor),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            ColorTheme.colorTheme.whiteColor),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            side: BorderSide(
                                color: ColorTheme.colorTheme.primaryColor),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                            color: ColorTheme.colorTheme.primaryColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chipSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: viewModel.filterChips
            .asMap()
            .map(
              (key, value) => MapEntry(
                key,
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        viewModel.selectedChip = value;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: viewModel.selectedChip == value
                            ? ColorTheme.colorTheme.primaryColor
                            : ColorTheme.colorTheme.whiteColor,
                        border: Border.all(
                            color: viewModel.selectedChip == value
                                ? ColorTheme.colorTheme.primaryColor
                                : ColorTheme.colorTheme.primaryTextColor),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Text(
                        value,
                        style: TextStyle(
                            color: viewModel.selectedChip == value
                                ? ColorTheme.colorTheme.whiteColor
                                : ColorTheme.colorTheme.primaryTextColor),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }

  Widget topSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: ColorTheme.colorTheme.whiteColor,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          introTextSection(),
          SizedBox(
            height: 20,
          ),
          searchAndFilterSection(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget searchAndFilterSection() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 40,
            child: TextField(
              cursorHeight: 40,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic),
                  hintText: "Enter the dish name"),
              controller: viewModel.searchController,
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: ColorTheme.colorTheme.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(8),
          child: SvgPicture.asset(
            ImageAssets.filter,
            height: 24,
            colorFilter: ColorFilter.mode(
                ColorTheme.colorTheme.whiteColor, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }

  Widget introTextSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Hello Chine",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: <Widget>[
            Text(
              "What would like to ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            Text(
              "eat?",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: ColorTheme.colorTheme.primaryColor),
            )
          ],
        )
      ],
    );
  }
}
