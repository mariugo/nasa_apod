import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/data/api/api_repository_imp.dart';
import '/data/dto/apod_dto.dart';
import '/presentation/screens/detail/apod_detail_screen.dart';
import '/presentation/screens/home/widgets/apod_card_widget.dart';

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
  bool _isConnected = true;

  @override
  void initState() {
    apodList.addAll(widget.apods);
    _checkInternetAndDisableSearch();
    super.initState();
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
            onPressed: _isConnected == true ? _selectDate : () {},
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
      onRefresh: _refreshApodList,
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

  Future<void> _refreshApodList() async {
    newApodList = await apiRepositoryImp.getApods();
    setState(() {
      apodList = newApodList;
    });
  }

  _checkInternetAndDisableSearch() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _isConnected = false;
      });
    }
    return _isConnected;
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

  _navigateToApodDetailsScreen(int index) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ApodDetailScreen(apod: apodList[index]),
    ));
  }
}
