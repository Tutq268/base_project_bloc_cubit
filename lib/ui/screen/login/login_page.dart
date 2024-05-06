import 'package:auto_route/auto_route.dart';
import 'package:data_on/resource/generated/assets.gen.dart';
import 'package:data_on/ui/config/key.dart';
import 'package:data_on/ui/di/di.dart';
import 'package:data_on/ui/navigation/app_route_info.dart';
import 'package:data_on/ui/resource/dimens/dimens.dart';
import 'package:data_on/ui/resource/styles/app_colors.dart';
import 'package:data_on/ui/resource/styles/app_text_styles.dart';
import 'package:data_on/ui/screen/login/cubit/login_cubit.dart';
import 'package:data_on/ui/screen/my_package/cubit/my_package_cubit.dart';
import 'package:data_on/ui/share/button/base_button.dart';
import 'package:data_on/ui/share/scaffold/base_page_state.dart';
import 'package:data_on/ui/share/scaffold/base_screen.dart';
import 'package:data_on/ui/share/textfield/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage, LoginCubit> {
  String messageError = "";
  bool isEnabbleButton = false;
  String phoneNumber = "";
  final listVtPhoneNumber = [
    "086",
    "096",
    "097",
    "098",
    "032",
    "033",
    "034",
    "035",
    "036",
    "037",
    "038",
    "039"
  ];
  @override
  Widget buildPage(BuildContext context) {
    return BaseScreen(
      title: "Đăng nhập",
      leading: InkWell(
          onTap: () {
            navigator.replace(const AppRouteInfo.main());
          },
          child: Icon(
            Ionicons.chevron_back_outline,
            size: 26.sp,
            color: AppColors.current.primaryTextColor,
          )),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimens.d12.w),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: Dimens.d32.h),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: Dimens.d16.h),
                        child: Text("Số điện thoại",
                            style: AppTextStyles.sectionTitle()
                                .copyWith(fontWeight: FontWeight.w500))),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: Dimens.d12.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 32.w,
                                height: 24.h,
                                child: Assets.images.auth.vnFlag.image(),
                              ),
                              SizedBox(
                                width: Dimens.d6.w,
                              ),
                              Text(
                                "+84",
                                style: AppTextStyles.sectionTitle().copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Ionicons.chevron_down_outline,
                                size: 24.sp,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            width: double.infinity,
                            child: AppTextField(
                              hintText: "0988123456",
                              hintTextSize: 22.sp,
                              autoFocus: true,
                              maxLines: 1,
                              keyboardType: TextInputType.phone,
                              borderRadius: 10.r,
                              isHideBorder: true,
                              textFiledStyle: AppTextStyles.sectionTitle()
                                  .copyWith(
                                      color: AppColors.current.primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22.sp),
                              fillColor: AppColors.defaultBackGroundColor,
                              contentPaddingVertical: 0.h,
                              onChanged: (text) {
                                if (text.length > 10) {
                                  setState(() {
                                    messageError = "Số điện thoại không đúng";
                                    isEnabbleButton = false;
                                    phoneNumber = text;
                                  });
                                } else if (text.length == 10) {
                                  if (listVtPhoneNumber
                                      .contains(text.substring(0, 3))) {
                                    setState(() {
                                      isEnabbleButton = true;
                                      phoneNumber = text;
                                    });
                                  } else {
                                    setState(() {
                                      messageError =
                                          "Vui lòng nhập đúng số điện thoại Viettel";
                                      isEnabbleButton = false;
                                      phoneNumber = text;
                                    });
                                  }
                                } else {
                                  setState(() {
                                    isEnabbleButton = false;
                                    messageError = "";
                                    phoneNumber = text;
                                  });
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    Visibility(
                      visible: messageError != "",
                      child: Container(
                        margin: EdgeInsets.only(left: 0.w),
                        child: Text(messageError,
                            style: AppTextStyles.s12w400PrimaryColor()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: Dimens.d16.h),
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                'Bằng việc đăng ký và đăng nhập vào DataOn, bạn đồng ý với ',
                            style: AppTextStyles.s12w400PrimaryColor()
                                .copyWith(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Điều khoản dịch vụ",
                                  style: AppTextStyles.s12w400PrimaryColor()
                                      .copyWith(
                                          color: AppColors.current.primaryColor,
                                          decoration:
                                              TextDecoration.underline)),
                              TextSpan(
                                  text: " và ",
                                  style: AppTextStyles.s12w400PrimaryColor()
                                      .copyWith(color: Colors.black)),
                              TextSpan(
                                  text: "Chính sách riêng tư",
                                  style: AppTextStyles.s12w400PrimaryColor()
                                      .copyWith(
                                          color: AppColors.current.primaryColor,
                                          decoration:
                                              TextDecoration.underline)),
                              TextSpan(
                                  text: " của chúng tôi.",
                                  style: AppTextStyles.s12w400PrimaryColor()
                                      .copyWith(color: Colors.black)),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimens.d10.h),
                          child: BaseButton(
                            label: "Xác nhận",
                            textColor: Colors.white,
                            backgroundColor: isEnabbleButton == false
                                ? const Color(0xffFDB3B5)
                                : AppColors.current.primaryColor,
                            onPress: () async {
                              if (isEnabbleButton == false) {
                                return;
                              } else {
                                navigator.replace(const AppRouteInfo.main());
                              }
                            },
                          ),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
