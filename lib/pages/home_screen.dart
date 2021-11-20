import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:payment_app/domain/provider/data_provider.dart';
import 'package:payment_app/domain/provider/loading_enum.dart';
import 'package:payment_app/router/router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataProvider? provider;
@override
void initState(){
  super.initState();
  provider = DataProvider();
}
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: provider,
        builder: (context, snapshot) {
          return Consumer<DataProvider>(builder: (context, provider, _) {
            return Center(
                child: ConditionalSwitch.single(
                    context: context,
                    valueBuilder: (context) => provider.requestEnum,
                    fallbackBuilder: (context) => SizedBox.shrink(),
                    caseBuilders: {
                  RequestEnum.LOADING: (context) => CircularProgressIndicator(
                      strokeWidth: 4,
                      color: Colors.orangeAccent,
                      backgroundColor: Colors.grey[300]),
                  RequestEnum.COMPLETE: (context) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.scale(
                              scale: 0.5,
                              child: Image.asset(
                                'assets/images/logo.png',
                                filterQuality: FilterQuality.high,
                              )),
                          GestureDetector(
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.orangeAccent,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text('Get Pay',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                              onTap: () async {
                                var arguments = provider.cachedData == null
                                    ? await provider.getData()
                                    : provider.cachedData;
                                  provider.setEnum(RequestEnum.SUCCESS);
                                  AppRoutes.navigate(context, '/payment_screen',
                                          args: arguments)
                                      .then((value) {
                                    if (value) {
                                      provider.setEnum(RequestEnum.COMPLETE);
                                    }
                                  });

                              })
                        ],
                      ),
                  RequestEnum.ERROR: (context) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Wait a minute...'),
                              content: Column(
                                children: [
                                  Text('Something went wrong'),
                                  Icon(
                                    Icons.warning_amber_rounded,
                                    color: Colors.red,
                                    size: 20,
                                  )
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () => null,
                                    child: Text('Retry')),
                                TextButton(
                                    onPressed: () => null,
                                    child: Text('Cancel'))
                              ],
                            ));
                    return SizedBox.shrink();
                  }
                }));
          });
        });
  }
}
