import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constraints/app_colors.dart';
import '../constraints/app_constraints.dart';
import '../constraints/app_text_style.dart';
import '../constraints/regex_config.dart';

class AppEditText extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  final RegExp? regex;
  final String title;
  final String? hintText,
      helperText,
      validatorMSG,
      editTextErrorMessage,
      dynamicKeyName,
      passwordForConfirm,
      errorMsg,
      minLengthMsg,
      invalidEmailMsg,
      invalidMobileNumber,
      conformPasswordDoesNotMatchMsg,
      suffixAsset,
      secondaryTitle;
  final bool isEmail,
      isGmail,
      enabled,
      isDense,
      isBangla,
      isReadonly,
      showCursor,
      isRequired,
      isStarNeeded,
      isPassword,
      isEditTextBorderPrimaryColor,
      needCapital,
      isTitleBlack,
      isEditTextBackgroundTransparent,
      needTopSpace,
      isFilePicker,
      needToShowEye,
      doNeedToSaveUsernameOnGoogle,
      isErrorMessageBangla,
      doNeedToSavePasswordOnGoogle,
      capitalLetter,
      isMobileNumber,
      isNumberKeyboard,
      isSignedNumberKeyboard,
      showValidatorMSG,
      isTitlePrimaryColor,
      isBackgroundTransparent,
      isCancelIconRed,
      isNeedSubtitle,
      needMobilePrefix,
      needMobileCountryCode,
      needNamePrefix,
      needEmailPrefix,
      needPasswordPrefix,
      needSuffixWidth;

  final Pattern? regXValue;
  final void Function(String)? onChanged;
  final int maxLine, maxLength, minLine;
  final int? validLength, minLength;

  final double textFieldBorderRadius, topBottomPadding, prefixLeftPadding;
  final double? height,
      topLeftRadius,
      topRightRadius,
      bottomLeftRadius,
      bottomRightRadius;
  final IconData? prefixIcon, suffixIcon;
  final Color? borderColor,
      errorBorderColor,
      enabledBorderColor,
      disabledBorderColor,
      focusedBorderColor,
      editTextBorderColor,
      hoverColor;
  final Widget? prefixWidget;
  final Function()? suffixIconClick;
  final FocusNode? focusNode, nextFocus;
  final TextStyle? titleStyle, subTitleStyle;
  dynamic inputFormatter, clickListener, selectedItem, eyeClick, fieldKey;

  AppEditText({
    super.key,
    required this.title,
    required this.controller,
    this.regex,
    this.fieldKey,
    this.hintText,
    this.eyeClick,
    this.errorMsg,
    this.focusNode,
    this.nextFocus,
    this.minLength,
    this.onChanged,
    this.regXValue,
    this.helperText,
    this.titleStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixAsset,
    this.hoverColor,
    this.validLength,
    this.minLengthMsg,
    this.invalidEmailMsg,
    this.prefixWidget,
    this.invalidMobileNumber,
    this.clickListener,
    this.inputFormatter,
    this.dynamicKeyName,
    this.focusedBorderColor,
    this.passwordForConfirm,
    this.editTextErrorMessage,
    this.conformPasswordDoesNotMatchMsg,
    this.topLeftRadius,
    this.topRightRadius,
    this.editTextBorderColor,
    this.bottomLeftRadius,
    this.bottomRightRadius,
    this.height,
    this.minLine = 1,
    this.maxLine = 1,
    this.maxLength = 250,
    this.validatorMSG = "",
    this.topBottomPadding = 16,
    this.prefixLeftPadding = 16,
    this.enabled = true,
    this.isDense = false,
    this.isEmail = false,
    this.isGmail = false,
    this.isBangla = false,
    this.showCursor = true,
    this.isRequired = true,
    this.isReadonly = false,
    this.isPassword = false,
    this.isStarNeeded = false,
    this.needSuffixWidth = false,
    this.isEditTextBorderPrimaryColor = false,
    this.isErrorMessageBangla = false,
    this.needCapital = false,
    this.isEditTextBackgroundTransparent = false,
    this.needTopSpace = true,
    this.isTitleBlack = true,
    this.isFilePicker = false,
    this.capitalLetter = false,
    this.needToShowEye = false,
    this.isMobileNumber = false,
    this.isNumberKeyboard = false,
    this.isCancelIconRed = false,
    this.doNeedToSaveUsernameOnGoogle = false,
    this.doNeedToSavePasswordOnGoogle = false,
    this.isSignedNumberKeyboard = false,
    this.showValidatorMSG = false,
    this.isTitlePrimaryColor = false,
    this.isBackgroundTransparent = true,
    this.borderColor,
    this.errorBorderColor,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.textInputType,
    this.textFieldBorderRadius = defaultBorderRadius,
    this.suffixIconClick,
    this.secondaryTitle,
    this.subTitleStyle,
    this.isNeedSubtitle = false,
    this.needNamePrefix = false,
    this.needMobilePrefix = false,
    this.needMobileCountryCode = false,
    this.needPasswordPrefix = false,
    this.needEmailPrefix = false,
  });

  bool isVisible = false;

  bool isError = false;

  @override
  Widget build(BuildContext context) {
    if (textInputType == const TextInputType.numberWithOptions(signed: true) ||
        isMobileNumber ||
        isSignedNumberKeyboard) {
      inputFormatter = [
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ];
    }
    RegExp phoneNumberRegex = RegExp(r'^01\d{9}$');
    RegExp banglaRegex = RegExp(r'[ঀ-৿]+');
    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: needTopSpace,
          child: appWidget.gapH(widgetToTitlePadding),
        ),
        Visibility(
          visible: title != "",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                      text: title,
                      style: titleStyle ??
                          text14Style(
                            color: isReadonly
                                ? AppColors.grey
                                : (isTitleBlack
                                    ? AppColors.black
                                    : isTitlePrimaryColor
                                        ? AppColors.primaryColor
                                        : AppColors.white),
                            isWeight400: true,
                          ),
                      children: [
                        TextSpan(
                            text: isRequired && isStarNeeded ? ' *' : "",
                            style: const TextStyle(
                              color: Colors.red,
                            )),
                      ]),
                ),
              ),
              Visibility(
                visible: isNeedSubtitle == true,
                child: gapW30,
              ),
              Visibility(
                visible: isNeedSubtitle == true,
                child: Flexible(
                  child: Text(
                    secondaryTitle ?? "",
                    style: subTitleStyle ?? text16Style(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: title != "",
          child: gapH8,
        ),
        TextFormField(
          key: fieldKey,
          autofillHints: doNeedToSaveUsernameOnGoogle
              ? const [AutofillHints.newUsername]
              : (doNeedToSavePasswordOnGoogle
                  ? const [AutofillHints.password]
                  : null),
          onTap: () {
            clickListener != null
                ? isFilePicker
                    ? clickListener(controller, dynamicKeyName)
                    : clickListener()
                : null;
          },
          textCapitalization: needCapital
              ? TextCapitalization.characters
              : TextCapitalization.none,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          readOnly: isFilePicker || isReadonly,
          showCursor: !isReadonly && !isFilePicker && showCursor,
          obscureText: isPassword ? (isVisible ? false : true) : false,
          maxLines: maxLine,
          minLines: minLine,
          maxLength: isMobileNumber ? 11 : maxLength,
          inputFormatters: inputFormatter,
          scrollPadding: EdgeInsets.zero,
          onChanged: onChanged,
          focusNode: focusNode,
          style: enabled
              ? text14Style(
                  fontSize: 14,
                  isWeight400: true,
                  color: AppColors.black,
                )
              : text14Style(
                  isWeight400: true,
                  color: AppColors.greyMid,
                ),
          onFieldSubmitted: (_) {
            focusNode?.unfocus();
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            }
          },
          keyboardType: textInputType ??
              (isMobileNumber
                  ? TextInputType.phone
                  : isNumberKeyboard || isSignedNumberKeyboard
                      ? TextInputType.number
                      : isEmail
                          ? TextInputType.emailAddress
                          : TextInputType.text),
          validator: (value) {

            if (value == null || value == "") {
              return isFilePicker
                  ? isErrorMessageBangla
                      ? "একটি ছবি বাছাই করুন"
                      : "Pick a valid Image"
                  : errorMsg ??
                      editTextErrorMessage ??
                      (isErrorMessageBangla
                          ? "ঘরটি পূরণ করতে হবে"
                          : "Enter a value");
            }  else if (regex != null) {
              if (!(regex?.hasMatch(value) ?? true)) {
                return isErrorMessageBangla
                    ? "ইনপুটটি সঠিক নয়"
                    : "Input is not valid";
              }
            } else if (isGmail) {
              if (!RegExp(gmailREGX.toString()).hasMatch(value)) {
                return validatorMSG;
              }
            } else if (capitalLetter) {
              if (!RegExp(capitalLetterREGX.toString()).hasMatch(value)) {
                return validatorMSG;
              }
            } else if (isMobileNumber) {
              if (!phoneNumberRegex.hasMatch(value)) {
                return invalidMobileNumber ??
                    (isErrorMessageBangla
                        ? "প্রদত্ত মোবাইল নম্বরটি সঠিক নয়"
                        : "Invalid Mobile Number");
              }
            } else if (validLength != null && validLength != value.length) {
              return validatorMSG;
            } else if (showValidatorMSG) {
              if (validatorMSG != "") {
                return validatorMSG;
              }
            } else if (passwordForConfirm != null) {
              if (passwordForConfirm != value) {
                return conformPasswordDoesNotMatchMsg ??
                    (isErrorMessageBangla
                        ? "পাসওয়ার্ড এবং কনফার্ম পাসওয়ার্ড মিলছে না"
                        : "Password doesn't match");
              }
            } else if (isEmail) {
              if (!emailRegex.hasMatch(value)) {
                return invalidEmailMsg ??
                    (isErrorMessageBangla
                        ? "প্রদত্ত ই-মেইলটি সঠিক নয়"
                        : "Invalid Email Address");
              }
            } else if (isBangla) {
              if (!banglaRegex.hasMatch(value)) {
                return "দয়া করে বাংলায় লিখুন";
              }
            } else if (isPassword && minLength != null) {
              if (value.length < (minLength ?? 999)) {
                return minLengthMsg ??
                    (isErrorMessageBangla
                        ? "পাসওয়ার্ড অবশ্যই $minLength সংখ্যার হতে হবে"
                        : "Password must be $minLength digits");
              }
            } else if (minLength != null) {
              if (value.length < (minLength ?? 999)) {
                return minLengthMsg ??
                    (isErrorMessageBangla
                        ? "ঘরটি কমপক্ষে $minLength ${isMobileNumber || isNumberKeyboard ? 'সংখ্যার' : 'বর্ণের'} হতে হবে"
                        : "Field must be at least $minLength ${isMobileNumber || isNumberKeyboard ? 'Digits' : 'characters'}");
              }
            }

            return null;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 0,
              right: 16.w,
              top: topBottomPadding.h,
              bottom: topBottomPadding.h,
            ),
            counterText: "",
            enabled: enabled,
            hintText: hintText ?? title,
            hintStyle: hintStyle,
            helperText: helperText,
            helperStyle: const TextStyle(
              color: AppColors.red,
            ),
            filled: true,
            isDense: isDense,
            fillColor:
                isEditTextBackgroundTransparent || isBackgroundTransparent
                    ? Colors.transparent
                    : enabled
                        ? AppColors.white
                        : AppColors.disableColor,
            prefix: prefixWidget ??
                (needMobilePrefix ||
                        needPasswordPrefix ||
                        needNamePrefix ||
                        needEmailPrefix ||
                        needMobileCountryCode
                    ? null
                    : Padding(
                        padding: EdgeInsets.only(left: prefixLeftPadding.w))),
            prefixIcon: isFilePicker
                ? chooseFileDesign()
                : (prefixIcon == null
                    ? (needMobilePrefix ||
                            needPasswordPrefix ||
                            needNamePrefix ||
                            needEmailPrefix
                        ? prefixIcons(
                            isName: needNamePrefix,
                            isMobile: needMobilePrefix,
                            isPassword: needPasswordPrefix,
                            isEmail: needEmailPrefix,
                          )
                        : needMobileCountryCode
                            ? mobileCountryCode()
                            : null)
                    : Icon(
                        prefixIcon,
                        color: AppColors.textGreyColor,
                        size: 18.w,
                      )),
            suffixIcon: needToShowEye
                ? InkWell(
                    onTap: () {
                      eyeClick();
                    },
                    child: Icon(
                      isPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.textGreyColor,
                      size: 20.w,
                    ),
                  )
                : (suffixIcon == null
                    ? (suffixAsset == null
                        ? needSuffixWidth
                            ? SizedBox(
                                width: 88.w,
                              )
                            : null
                        : InkWell(
                            onTap: suffixIconClick,
                            child: assetImage(
                              suffixAsset ?? "",
                            ),
                          ))
                    : InkWell(
                        onTap: suffixIconClick,
                        child: Icon(
                          suffixIcon,
                          color: isCancelIconRed
                              ? Colors.redAccent
                              : AppColors.primaryColor,
                        ),
                      )),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: (disabledBorderColor ?? AppColors.grey),
                width: 1.0,
              ),
              borderRadius: borderRadius(),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isReadonly
                    ? AppColors.greyMid
                    : (isEditTextBorderPrimaryColor
                        ? AppColors.primaryColor
                        : (enabledBorderColor ??
                            editTextBorderColor ??
                            AppColors.greyMid)),
                width: 1.0,
              ),
              borderRadius: borderRadius(),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isReadonly
                    ? AppColors.greyMid
                    : (focusedBorderColor ??
                        editTextBorderColor ??
                        AppColors.primaryColor),
                width: 1.0,
              ),
              borderRadius: borderRadius(),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius(),
              borderSide: const BorderSide(width: 1, color: Colors.red),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (errorBorderColor ?? AppColors.red), width: 1.0),
              borderRadius: borderRadius(),
            ),
            hoverColor: hoverColor ?? AppColors.primaryColor,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: isEditTextBorderPrimaryColor
                    ? AppColors.primaryColor
                    : (borderColor ?? AppColors.red),
                width: 1.0,
              ),
              borderRadius: borderRadius(),
            ),
          ),
        ),
      ],
    );
  }

  borderRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeftRadius ?? textFieldBorderRadius),
      topRight: Radius.circular(topRightRadius ?? textFieldBorderRadius),
      bottomLeft: Radius.circular(bottomLeftRadius ?? textFieldBorderRadius),
      bottomRight: Radius.circular(bottomRightRadius ?? textFieldBorderRadius),
    );
  }

  chooseFileDesign() {
    return Container(
      width: 120.w,
      height: 58.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(defaultBorderRadius - 1),
          bottomLeft: Radius.circular(defaultBorderRadius - 1),
        ),
      ),
      child: Center(
          child: Text(
        "Choose File",
        style: text14Style(color: AppColors.white),
      )),
    );
  }

  prefixIcons(
      {bool isMobile = false,
      bool isPassword = false,
      bool isName = false,
      bool isEmail = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/png/${isMobile ? "ic_mobile.png" : isPassword ? "ic_password.png" : isName ? "ic_name.png" : isEmail ? "email_outlined_icon.png" : "ic_mobile.png"}",
          width: 18.w,
          height: 18.w,
        ),
      ],
    );
  }

  assetImage(String assetPath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/png/$assetPath",
          width: 18.w,
          height: 18.w,
        ),
      ],
    );
  }

  mobileCountryCode() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "+88",
          style: text16Style(
            color: Colors.grey.shade700,
            isWeight400: true,
          ),
        ),
      ],
    );
  }
}
