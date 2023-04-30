import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:masctti_fashion/controllers/SearchController.dart";

import "../components/LayoutSinglePage.dart";
import "../components/SearchItem.dart";
import "../components/SearchTextField.dart";

class Search extends StatelessWidget {
  Search({super.key});
  final SearchController controller = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return LayoutSinglePage(
      title: "",
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SearchTextField(
            controllerTextField: controller.resultSearch,
            autofocus: true,
            submit: controller.onSearch,
            onChanged: controller.onChangeSearch,
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(right: 16, left: 16, top: 12, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('سجل البحث',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff838894),
                      fontWeight: FontWeight.w500)),
              InkWell(
                onTap: controller.removeSearchHistory,
                child: const Text("حذف السجل",
                    style: TextStyle(
                        color: Color(0xffFF5D39),
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 170,
          child: GetBuilder<SearchController>(builder: (controller) {
            return ListView(
              children: controller.resultsSearch.reversed
                  .map(
                    (recordSearch) => SearchItem(
                      recordSearch,
                      onTap: () => controller.selectSearchItem(recordSearch),
                    ),
                  )
                  .toList(),
            );
          }),
        )
      ],
    );
  }
}
