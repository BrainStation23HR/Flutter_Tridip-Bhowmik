import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/drop_down_model.dart';
import '../constraints/app_colors.dart';
import '../constraints/app_constraints.dart';
import '../constraints/app_text_style.dart';

class MyDropDown extends StatelessWidget {
  final dynamic dropDownItems, selectedItem, fieldKey;
  final Function handleClick;

  final String title, isPrefixIconText;
  final String? prefixIconPath, hint, dynamicFormFieldKey, anyExtraData;
  final TextStyle? style, titleTextStyle;

  final double radius, topBottomPadding;
  final FocusNode? focusNode;
  final bool isName,
      enabled,
      isIgnoring,
      needSearch,
      isRequired,
      isTextBlack,
      needTopSpace,
      isTitleBlack,
      isHintColorBlack,
      isPrefixIconNeeded,
      isPrefixTextNeeded,
      isUnderLineRequired,
      isTitlePrimaryColor,
      isEditTextBorderPrimaryColor,
      isNeedDivider,
      isErrorMessageBangla,
      isNeedExtraHeight,
      isBackgroundTransparent;
  final double height, dropdownFieldBorderRadius;
  final Color? hoverColor,
      borderColor,
      errorBorderColor,
      focusedBorderColor,
      enabledBorderColor,
      dividerColor,
      disabledBorderColor;
  final String? Function(Object?)? validator;
  final String? errorMessage;
  final TextEditingController searchController = TextEditingController();

  MyDropDown({
    super.key,
    required this.dropDownItems,
    required this.selectedItem,
    required this.handleClick,
    this.hint,
    this.style,
    this.fieldKey,
    this.validator,
    this.focusNode,
    this.title = "",
    this.hoverColor,
    this.borderColor,
    this.anyExtraData,
    this.radius = 8.0,
    this.errorMessage,
    this.height = 50.0,
    this.titleTextStyle,
    this.isName = false,
    this.prefixIconPath,
    this.enabled = true,
    this.errorBorderColor,
    this.isRequired = true,
    this.needSearch = false,
    this.isErrorMessageBangla = false,
    this.isEditTextBorderPrimaryColor = false,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.isTextBlack = true,
    this.isIgnoring = false,
    this.dynamicFormFieldKey,
    this.isTitleBlack = true,
    this.needTopSpace = true,
    this.disabledBorderColor,
    this.topBottomPadding = 16,
    this.isPrefixIconText = "",
    this.isHintColorBlack = false,
    this.isPrefixTextNeeded = false,
    this.isPrefixIconNeeded = false,
    this.isUnderLineRequired = true,
    this.isTitlePrimaryColor = false,
    this.isBackgroundTransparent = true,
    this.dropdownFieldBorderRadius = 8.0,
    this.isNeedDivider = false,
    this.isNeedExtraHeight = true,
    this.dividerColor,
  });

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<DropDownModel>> dropdownMenuItems =
        buildDropDownMenuItems(dropDownItems);

    List<double> customHeight = getCustomItemsHeights(dropdownMenuItems);
    logger.i(dropdownMenuItems.length);
    logger.i(customHeight.length);
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
          child: RichText(
            text: TextSpan(
              text: title,
              style: titleTextStyle ??
                  text14Style(
                    color: isTitleBlack
                        ? AppColors.black
                        : isTitlePrimaryColor
                            ? AppColors.primaryColor
                            : AppColors.white,
                    isWeight400: true,
                  ),
              // children: [
              //   TextSpan(
              //     text: isRequired ? " * " : "",
              //     style: const TextStyle(
              //       color: Colors.red,
              //     ),
              //   )
              // ],
            ),
          ),
        ),
        if (title != "") gapH8,
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField2<DropDownModel>(
            dropdownSearchData: needSearch
                ? DropdownSearchData(
                    searchController: searchController,
                    searchInnerWidgetHeight: sizerH(50),
                    searchInnerWidget: Padding(
                      padding: EdgeInsets.only(
                        top: sizerH(16),
                        right: sizerW(16),
                        left: sizerW(16),
                      ),
                      child: TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: sizerW(12),
                            vertical: sizerH(16),
                          ),
                          hintText: isErrorMessageBangla
                              ? "এখানে অনুসন্ধান করুন ..."
                              : "Search here ...",
                          hintStyle: TextStyle(fontSize: 15.sp),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                dropdownFieldBorderRadius),
                          ),
                        ),
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      return ((item.value?.title ?? "")
                          .toString()
                          .toLowerCase()
                          .contains(
                            searchValue.toLowerCase(),
                          ));
                    },
                  )
                : null,
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                searchController.clear();
              }
            },
            isExpanded: true,
            key: fieldKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            hint: Text(
              hint ??
                  (isErrorMessageBangla
                      ? "$title নির্বাচন করুন"
                      : "Select $title"),
              style: text14Style(
                isWeight400: true,
                fontSize: 13,
                color: isHintColorBlack
                    ? AppColors.black
                    : AppColors.textGreyColor,
              ),
              maxLines: 1,
            ),
            items: dropdownMenuItems,
            selectedItemBuilder: (BuildContext context) {
              List<Widget> tempWidget = [];
              for (var i = 0; i < dropdownMenuItems.length; i++) {
                if (isNeedDivider) {
                  if (i.isEven) {
                    tempWidget.add(
                      Text(
                        dropdownMenuItems[i].value?.title ?? "",
                        maxLines: 1,
                        style: text14Style(
                          isWeight400: true,
                          color: enabled ? AppColors.black : AppColors.greyMid,
                        ),
                      ),
                    );
                  } else if (i.isOdd) {
                    tempWidget.add(
                      const Text(""),
                    );
                  }
                } else {
                  tempWidget.add(
                    Text(
                      dropdownMenuItems[i].value?.title ?? "",
                      maxLines: 1,
                      style: text14Style(
                        isWeight400: true,
                        color: enabled ? AppColors.black : AppColors.greyMid,
                      ),
                    ),
                  );
                }
              }
              return tempWidget;
            },
            validator: (value) {
              if (!isRequired) {
                return null;
              }
              if (value == null) {
                return errorMessage ??
                    (isErrorMessageBangla
                        ? "অনুগ্রহ করে একটি অপশন নির্বাচন করুন"
                        : "Please select an option");
              }
              return null;
            },
            onChanged: !enabled
                ? null
                : dropDownItems.isEmpty
                    ? null
                    : (value) {
                        if (value != selectedItem) {
                          if (dynamicFormFieldKey != null) {
                            handleClick(dynamicFormFieldKey, value);
                          } else {
                            handleClick(value);
                          }
                        }
                      },
            value: selectedItem == null
                ? null
                : (selectedItem.title == null ? null : selectedItem),
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: dropDownItems.isEmpty
                    ? AppColors.greyMid
                    : enabled
                        ? Colors.black54
                        : Colors.black26,
              ),
              iconSize: 24.w,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(dropdownFieldBorderRadius),
                  color: AppColors.white),
            ),
            menuItemStyleData: MenuItemStyleData(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              customHeights: isNeedExtraHeight ? customHeight : [],
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 0,
                right: 12.w,
                top: topBottomPadding.h,
                bottom: topBottomPadding.h,
              ),
              // contentPadding: EdgeInsets.zero,
              fillColor: isBackgroundTransparent
                  ? Colors.transparent
                  : enabled
                      ? AppColors.white
                      : AppColors.disableColor,
              isDense: true,
              filled: true,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: (disabledBorderColor ?? AppColors.greyMid),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(dropdownFieldBorderRadius),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isEditTextBorderPrimaryColor
                      ? AppColors.primaryColor
                      : (enabledBorderColor ?? AppColors.greyMid),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(dropdownFieldBorderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: (focusedBorderColor ??
                      AppColors.greyMid ??
                      AppColors.primaryColor),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(dropdownFieldBorderRadius),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(dropdownFieldBorderRadius),
                borderSide: const BorderSide(width: 1, color: Colors.red),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: (errorBorderColor ?? AppColors.red), width: 1.0),
                borderRadius: BorderRadius.circular(dropdownFieldBorderRadius),
              ),
              hoverColor: hoverColor ?? AppColors.primaryColor,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: (borderColor ?? AppColors.textGreyColor),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(dropdownFieldBorderRadius),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<DropDownModel>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<DropDownModel>> items = [];
    for (DropDownModel listItem in listItems) {
      items.addAll([
        DropdownMenuItem(
          value: listItem,
          child: Text(
            listItem.title ?? "",
            style: text14Style(isWeight400: true),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (isNeedDivider)
          if (listItem != listItems.last)
            DropdownMenuItem<DropDownModel>(
              enabled: false,
              child: appWidget.divider(
                  height: 0, color: dividerColor ?? AppColors.dividerColor),
            ),
      ]);
    }
    return items;
  }

  List<double> getCustomItemsHeights(List items) {
    final List<double> itemsHeights = [];
    for (int i = 0; i < items.length /*(items.length * 2) - 1*/; i++) {
      if (i.isEven) {
        itemsHeights.add(50.h);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(isNeedDivider ? 16 : 50);
      }
    }
    return itemsHeights;
  }

  sizerH(double size) {
    return size.h;
  }

  sizerW(double size) {
    return size.w;
  }
}
