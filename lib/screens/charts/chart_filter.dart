import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kingcoconut/screens/charts/home.dart';
import '../../constants/app_colors.dart';
import '../../models/chart_filter_model.dart';

class ChartFilter extends StatefulWidget {
  const ChartFilter({super.key});

  @override
  State<ChartFilter> createState() => _ChartFilterState();
}

class _ChartFilterState extends State<ChartFilter> {
  List<String> countries = [
    "Iran",
    "Egypt",
    "Saudi Arabia",
    "United Arab Emirates",
    "Kuwait",
    "Qatar",
    "Lebanon",
    "Jordan",
    "Yemen",
    "Oman",
    "Bahrain",
    "Iraq",
    "Syria",
    "Türkiye",
    "Israel",
  ];
  List<String> categories = ["king-coconut process water", "king-coconut"];
  DateTime selectedStartDate =
      DateTime.now().subtract(const Duration(days: 30));
  DateTime selectedEndDate = DateTime.now();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  String selectedCountry = "Iran";
  String selectedCategory = "king-coconut process water";
  Size screenSize = const Size(0, 0);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    startDateController.text = DateFormat.yMMMd().format(selectedStartDate);
    endDateController.text = DateFormat.yMMMd().format(selectedEndDate);
  }

  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          "assets/images/kingcoco.png",
          width: 250,
          height: 85,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.appColorGray,
            size: 50,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              labelHeader("Select start date"),
              _startDatePicker(context),
              const SizedBox(
                height: 20,
              ),
              labelHeader("Select end date"),
              _endDatePicker(context),
              const SizedBox(
                height: 20,
              ),
              labelHeader("Select country"),
              _dropDownField(true),
              const SizedBox(
                height: 20,
              ),
              labelHeader("Category"),
              _dropDownField(false),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size(screenSize.width, screenSize.height * 0.075),
                  ),
                ),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    ChartFilterModel chartFilterModel = ChartFilterModel();
                    chartFilterModel.category = selectedCategory;
                    chartFilterModel.country = selectedCountry;
                    chartFilterModel.startDateTime = selectedStartDate;
                    chartFilterModel.endDateTime = selectedEndDate;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ChartPage(),
                      ),
                    );
                  }
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _startDatePicker(BuildContext context) {
    return TextFormField(
      controller: startDateController,
      onTap: () async {
        await showDatePicker(
          initialDate: selectedStartDate,
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        ).then((value) {
          selectedStartDate =
              value ?? selectedEndDate.subtract(const Duration(days: 30));
          startDateController.text =
              DateFormat.yMMMd().format(selectedStartDate);
          setState(() {});
        });
      },
      readOnly: true,
      autofocus: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), suffixIcon: Icon(Icons.calendar_month)),
    );
  }

  Widget _endDatePicker(BuildContext context) {
    return TextFormField(
      controller: endDateController,
      onTap: () async {
        await showDatePicker(
          initialDate: selectedEndDate,
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        ).then((value) {
          selectedEndDate = value ??
              selectedStartDate.add(
                const Duration(days: 30),
              );
          endDateController.text = DateFormat.yMMMd().format(selectedEndDate);
          setState(() {});
        });
      },
      readOnly: true,
      autofocus: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), suffixIcon: Icon(Icons.calendar_month)),
    );
  }

  Widget _dropDownField(bool isCountry) {
    List<String> dropDownItems = [];
    if (isCountry) {
      dropDownItems = countries;
    } else {
      dropDownItems = categories;
    }
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      value: isCountry ? selectedCountry : selectedCategory,
      items: dropDownItems
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          if (isCountry) {
            selectedCountry = value;
          } else {
            selectedCategory = value;
          }
          setState(() {});
        }
      },
    );
  }

  Widget labelHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
