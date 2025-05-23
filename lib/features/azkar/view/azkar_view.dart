import 'package:azkar/core/utils/service_locator.dart';
import 'package:azkar/core/widgets/custom_text_widget.dart';
import 'package:azkar/features/azkar/model/azkar_repo_imp.dart';
import 'package:azkar/features/azkar/model_view/cubit/azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarView extends StatelessWidget {
  final bool isMorning;
  const AzkarView({super.key, required this.isMorning});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              AzkarCubit(getIt<AzkarRepoImp>())
                ..getAzkarElsabah(isMorning: isMorning),
      child: BlocBuilder<AzkarCubit, AzkarState>(
        builder: (context, state) {
          var azkarCubit = AzkarCubit.get(context);

          return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  "assets/background.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                state is! LoadingGetAzkar
                    ? ListView.separated(
                      itemCount: azkarCubit.azkar["content"].length,
                      separatorBuilder:
                          (context, index) => const Divider(
                            thickness: 1,
                            color: Color.fromARGB(255, 253, 206, 170),
                          ),
                      itemBuilder:
                          (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                children: [
                                  CustomTextWidget(
                                    text:
                                        azkarCubit
                                            .azkar["content"][index]["zekr"],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomTextWidget(
                                    textAlign: TextAlign.left,
                                    text:
                                        "(${azkarCubit.azkar["content"][index]["repeat"]} مره)",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CustomTextWidget(
                                    text:
                                        azkarCubit
                                            .azkar["content"][index]['bless'],
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                    )
                    : const Center(child: CircularProgressIndicator()),
              ],
            ),
          );
        },
      ),
    );
  }
}
