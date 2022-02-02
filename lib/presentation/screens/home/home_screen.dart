import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nasa_apod/data/api/api_repository_imp.dart';

import 'package:nasa_apod/data/dto/apod_dto.dart';
import 'package:nasa_apod/presentation/screens/detail/apod_detail_screen.dart';
import 'package:nasa_apod/presentation/screens/home/widgets/apod_card_widget.dart';

class HomeScreen extends StatefulWidget {
  final List<ApodDto> apods;

  const HomeScreen({
    Key? key,
    required this.apods,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiRepositoryImp apiRepositoryImp = ApiRepositoryImp();
  List<ApodDto> apodList = [];
  List<ApodDto> newApodList = [];
  ApodDto? apodDto;
  String? _date;

  @override
  void initState() {
    apodList.addAll(widget.apods);
    super.initState();
  }

  Future<void> _refresh() async {
    newApodList = await apiRepositoryImp.getApods();
    setState(() {
      apodList = newApodList;
    });
  }

  _selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    ).then((_selectedDate) {
      if (_selectedDate == null) {
        return;
      }
      setState(() {
        _date = DateFormat('yyyy-MM-dd').format(_selectedDate);
      });
      _setSelectedApod();
    });
  }

  _setSelectedApod() async {
    apodDto = await apiRepositoryImp.getApodByDate(_date!);
    setState(() {
      apodList.clear();
      apodList.add(apodDto!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NASA Apod',
        ),
        actions: [
          IconButton(
            onPressed: _selectDate,
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: _listView(),
      ),
    );
  }

  Widget _listView() {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        itemCount: apodList.length,
        itemBuilder: (_, index) => ApodCardWidget(
          navigate: () => _navigateToApodDetailsScreen(index),
          image: apodList[index].url,
          title: apodList[index].title,
          mediaType: apodList[index].mediaType,
          date: apodList[index].date,
        ),
      ),
    );
  }

  _navigateToApodDetailsScreen(int index) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ApodDetailScreen(apod: apodList[index]),
    ));
  }
}
