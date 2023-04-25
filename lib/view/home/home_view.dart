import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/routes/app_exports.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_model/controller/home/home_view_model.dart';
import 'package:getx_mvvm/view_model/controller/user_preference/user_preference_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  UserPreferences userPreferences = UserPreferences();

  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {
          userPreferences.removeUser().then((value) {
            Get.toNamed(RouteName.loginView);
          });
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING: 
            return Center(child: CircularProgressIndicator(),);
          case Status.ERROR: 
          if(homeController.error.value == 'No internet: ') {
            return InternetExceptionWidget(onPress: () {
              homeController.userListApi();
            },);
          } else {
            return Center(child: Text(homeController.error.value),);
          }
            
          case Status.COMPLETED: 
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
              itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString()),
                  ),
                  title: Text(homeController.userList.value.data![index].firstName.toString()),
                  subtitle: Text(homeController.userList.value.data![index].email.toString()),
                ),
              );
            },);
            
          default: return Container();
        }
      },)
      );
  }
}