import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/provider/history_provider.dart';
import 'package:runningapp/provider/profile_provider.dart';
import 'package:runningapp/provider/status_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HistoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => StatusProvider(),
        ),
      ],
      builder: (context, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 35, 44, 54),
          body: Column(
            children: [
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff7B61FF),
                          blurRadius: 5.5,
                          blurStyle: BlurStyle.normal,
                          offset: Offset(3, 10),
                          spreadRadius: 3)
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              )),
                          Builder(
                            builder: (context) {
                              if (context.watch<ProfileProvider>().isLoading) {
                                return const CircleAvatar();
                              } else if (context
                                  .watch<ProfileProvider>()
                                  .error
                                  .isEmpty) {
                                return CircleAvatar(
                                  backgroundImage: NetworkImage(context
                                      .watch<ProfileProvider>()
                                      .data!
                                      .img
                                      .toString()),
                                );
                              } else {
                                return const CircleAvatar();
                              }
                            },
                          ),
                          SizedBox(
                              height: size.height * 0.03,
                              width: size.width * 0.5,
                              child: Builder(
                                builder: (context) {
                                  if (context
                                      .watch<ProfileProvider>()
                                      .isLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return Text(
                                      context
                                          .watch<ProfileProvider>()
                                          .data!
                                          .name
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    );
                                  }
                                },
                              )),
                          SizedBox(
                              child: SvgPicture.asset('assets/direct.svg')),
                          SizedBox(
                            child: SvgPicture.asset('assets/sms.svg'),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "14000/150000 steps",
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 10),
                              LinearPercentIndicator(
                                width: size.width * 0.8,
                                lineHeight: 20.0,
                                animation: true,
                                animationDuration: 2000,
                                percent: 0.9,
                                barRadius: const Radius.circular(30),
                                backgroundColor: Colors.white,
                                progressColor: const Color(0xff55CB74),
                              ),
                            ],
                          ),
                          SizedBox(
                            child: SvgPicture.asset('assets/badge.svg'),
                          )
                        ],
                      ),
                      Container(
                        height: size.height * 0.12,
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.blue[500],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Builder(
                              builder: (context) {
                                if (context.watch<StatusProvider>().isLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (context
                                    .watch<StatusProvider>()
                                    .error
                                    .isNotEmpty) {
                                  return Center(
                                    child: Text(context
                                        .watch<StatusProvider>()
                                        .error
                                        .toString()),
                                  );
                                } else {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset('assets/runner.svg'),
                                      SizedBox(
                                        height: size.height * 0.3,
                                        width: size.width * 0.4,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              context
                                                  .watch<StatusProvider>()
                                                  .data!
                                                  .today!
                                                  .date
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white60),
                                            ),
                                            Text(
                                              context
                                                  .watch<StatusProvider>()
                                                  .data!
                                                  .today!
                                                  .duration
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white60),
                                            )
                                          ],
                                        ),
                                      ),
                                      CircularPercentIndicator(
                                          restartAnimation: true,
                                          animationDuration: 2000,
                                          percent: 0.45,
                                          radius: 35,
                                          animation: true,
                                          center: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                context
                                                    .watch<StatusProvider>()
                                                    .data!
                                                    .today!
                                                    .done
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                context
                                                    .watch<StatusProvider>()
                                                    .data!
                                                    .today!
                                                    .todo
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Color(0xff43C465)),
                                              ),
                                            ],
                                          ))
                                    ],
                                  );
                                }
                              },
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.16,
                        width: double.infinity,
                        child: Builder(
                          builder: (context) {
                            if (context.watch<StatusProvider>().isLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (context
                                .watch<StatusProvider>()
                                .error
                                .isNotEmpty) {
                              return Center(
                                child: Text(context
                                    .watch<StatusProvider>()
                                    .error
                                    .toString()),
                              );
                            } else {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: size.width * 0.43,
                                    height: size.height * 0.15,
                                    decoration: BoxDecoration(
                                        color: Colors.blue[500],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          context
                                              .watch<StatusProvider>()
                                              .data!
                                              .result!
                                              .steps
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "Steps",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.43,
                                    height: size.height * 0.15,
                                    decoration: BoxDecoration(
                                        color: Colors.blue[500],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          context
                                              .watch<StatusProvider>()
                                              .data!
                                              .result!
                                              .coins
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "Steps",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )),
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text(
                          "History",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        trailing: Text(
                          "See all",
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                      Expanded(
                          flex: 9,
                          child: Builder(
                            builder: (context) {
                              if (context.watch<HistoryProvider>().isLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (context
                                  .watch<HistoryProvider>()
                                  .error
                                  .isNotEmpty) {
                                return Center(
                                  child: Text(
                                      context.watch<HistoryProvider>().error),
                                );
                              } else {
                                return SizedBox(
                                  child: ListView.builder(
                                    itemCount: context
                                        .watch<HistoryProvider>()
                                        .data!
                                        .data!
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.teal.shade800,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: ListTile(
                                            title: Text(
                                              context
                                                  .watch<HistoryProvider>()
                                                  .data!
                                                  .data![index]
                                                  .date
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blue.shade500),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Text(
                                                  "${context.watch<HistoryProvider>().data!.data![index].pt.toString()} pt",
                                                  style: const TextStyle(
                                                      color: Colors.red),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  context
                                                      .watch<HistoryProvider>()
                                                      .data!
                                                      .data![index]
                                                      .km
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white54),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "${context.watch<HistoryProvider>().data!.data![index].kcol.toString()} kcal",
                                                  style: const TextStyle(
                                                      color: Colors.white54),
                                                )
                                              ],
                                            ),
                                            trailing: Text(
                                              "${context.watch<HistoryProvider>().data!.data![index].steps.toString()} steps",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ))
                    ],
                  ),
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}
