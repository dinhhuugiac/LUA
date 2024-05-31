import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lua_v3/conponents/colors.dart';
import 'package:lua_v3/models/topic_model.dart';
import 'package:lua_v3/screens/acountpages/bloc/account_bloc.dart';
import 'package:lua_v3/screens/acountpages/bloc/account_state.dart';
import 'package:lua_v3/screens/acountpages/account_page.dart';

import 'package:lua_v3/screens/update_topic/bloc/update_topic_bloc.dart';
import 'package:lua_v3/screens/update_topic/bloc/update_topic_event.dart';
import 'package:lua_v3/screens/update_topic/bloc/update_topic_state.dart';

class UpdateTopicPage extends StatefulWidget {
  const UpdateTopicPage({Key? key}) : super(key: key);

  @override
  State<UpdateTopicPage> createState() => _UpdateTopicPageState();
}

class _UpdateTopicPageState extends State<UpdateTopicPage> {
  @override
  void initState() {
    super.initState();
    homeBloc = context.read<AccountBloc>();
    if (homeBloc.state.status == AccountStatus.success) {
      var state = homeBloc.state;
      selectTopic = state.userDetail?.fav_content ?? [];
    }

    context
        .read<UpdateTopicBloc>()
        .add(InitUpdateTopicEvent(selectTopic: selectTopic));
  }

  late AccountBloc homeBloc;
  late List<String> selectTopic = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateTopicBloc, UpdateTopicState>(
      listener: (context, updatestate) {},
      builder: (context, updatestate) {
        return Stack(
          children: [
            Container(
              child: Scaffold(
                body: BlocConsumer<UpdateTopicBloc, UpdateTopicState>(
                  listener: (context, updatestate) async {
                    if (updatestate.status == UpdateTopicStatus.submitSuccess) {
                      await Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => AccountBloc(),
                            child: const AccountPage(),
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(updatestate.message ?? ''),
                      ));
                    }
                  },
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 42,
                          ),
                          const Center(
                            child: Text(
                              'Chọn chủ đề bạn yêu thích',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Expanded(
                            child: (state.status == UpdateTopicStatus.loading)
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : (state.status == UpdateTopicStatus.success)
                                    ? _buildTopicWrap(
                                        state.listData ?? [], state)
                                    : (state.status == UpdateTopicStatus.error)
                                        ? Center(
                                            child:
                                                Text('Error: ${state.message}'))
                                        : const Text('ahihi'),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BlocProvider(
                                          create: (context) => AccountBloc(),
                                          child: const AccountPage(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 52,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorsApp.backGroundColor),
                                      color: const Color(0xFFFFFFFF),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Bỏ qua',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: ColorsApp.backGroundColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    context
                                        .read<UpdateTopicBloc>()
                                        .add(const SubmitUpdateTopicEvent());
                                  },
                                  child: Container(
                                    height: 52,
                                    decoration: const BoxDecoration(
                                      color: ColorsApp.backGroundColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Xác nhận ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            if (updatestate.status == UpdateTopicStatus.submitloading)
              Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: ColorsApp.backGroundColor,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildTopicWrap(List<Topic> data, UpdateTopicState state) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 16,
      runSpacing: 16,
      children: data.asMap().entries.map((entry) {
        final index = entry.key;
        final topic = entry.value;
        return InkWell(
          onTap: () {
            context.read<UpdateTopicBloc>().add(
                ChosseUpdateTopicEvent(selectedData: data[index].title ?? ''));
          },
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: ColorsApp.backGroundColor, width: 1),
              color: state.selectedTitles!.contains(data[index].title)
                  ? ColorsApp.backGroundColor
                  : Colors.white,
            ),
            child: Text(
              topic.title ?? '',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: state.selectedTitles!.contains(data[index].title)
                    ? Colors.white
                    : ColorsApp.backGroundColor,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
