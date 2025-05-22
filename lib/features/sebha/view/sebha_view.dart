import 'package:azkar/core/utils/service_locator.dart';
import 'package:azkar/core/widgets/custom_button_widget.dart';
import 'package:azkar/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/sebha_repo_imp.dart';
import '../model_view/cubit/sebha_cubit.dart';

class SebhaView extends StatelessWidget {
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SebhaCubit(getIt<SebhaRepoImp>())..getCounter(),
      child: BlocBuilder<SebhaCubit, SebhaState>(
        builder: (context, state) {
          var sebhaCubit = SebhaCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                spacing: 20.h,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/moshaf.png"),

                  CustomTextWidget(
                    text: sebhaCubit.counter.toString(),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),

                  CustomButtonWidget(
                    text: "حسبي الله و نعم الوكيل",
                    onPressed: () {
                      sebhaCubit.addCounter(sebhaCubit.counter + 1);
                      sebhaCubit.getCounter();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
