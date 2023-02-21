import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/common/app_text_styles.dart';
import 'package:mwardi/app/common/components/default_btn.dart';
import 'package:mwardi/app/common/extensions.dart';

import '../../controllers/settings_controller.dart';

class LocaleDialog extends StatelessWidget {
  const LocaleDialog({super.key});
  static final SettingsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)), //this right here

      child: Container(
        width: w * 0.8,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Language",
                  style: AppTextStyles.blackTextStyle
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 16.0),
                ),
                IconButton(
                    onPressed: () => Get.back(), icon: const Icon(Icons.close))
              ],
            ),
            20.0.vSpace(),
            Obx(() => Column(mainAxisSize: MainAxisSize.min, children: [
                  ListTile(
                    onTap: () => _controller.locale.value = 'en',
                    title: const Text("English"),
                    trailing: Radio(
                        value: 'en',
                        groupValue: _controller.locale.value,
                        onChanged: (val) => _controller.locale.value = val!),
                  ),
                  ListTile(
                    onTap: () => _controller.locale.value = 'ar',
                    title: const Text("Arabic"),
                    trailing: Radio(
                        value: 'ar',
                        groupValue: _controller.locale.value,
                        onChanged: (val) => _controller.locale.value = val!),
                  ),
                ])),
            20.0.vSpace(),
            DefaultBtn(
              title: "Save",
              loading: false,
              onTap: _controller.changeNotificationSettings,
            )
          ],
        ),
      ),
    );
  }
}
