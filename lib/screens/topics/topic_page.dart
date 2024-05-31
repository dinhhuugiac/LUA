import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lua_v3/conponents/colors.dart';
import 'package:lua_v3/models/topic_model.dart';
import 'package:lua_v3/screens/acountpages/account_page.dart';
import 'package:lua_v3/screens/topics/bloc/topic_bloc.dart';
import 'package:lua_v3/screens/topics/bloc/topic_event.dart';
import 'package:lua_v3/screens/topics/bloc/topic_state.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({Key? key}) : super(key: key);

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {

  @override
  void initState() {
    super.initState();
    context.read<TopicBloc>().add(const InitTopicEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<TopicBloc, TopicState>(
          listener: (context, state) async {
            if (state.status == TopicStatus.submitSuccess) {
              await Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountPage(),
                ),
              );
            } else if (state.status == TopicStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message ?? ''),
              ));
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    child: (state.status == TopicStatus.loading)
                        ? const Center(child: CircularProgressIndicator())
                        : (state.status == TopicStatus.success)
                            ? _buildTopicWrap(state.listData ?? [], state)
                            : (state.status == TopicStatus.error)
                                ? Center(child: Text('Error: ${state.message}'))
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
                                builder: (context) => const AccountPage(),
                              ),
                            );
                          },
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorsApp.backGroundColor),
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
                                .read<TopicBloc>()
                                .add(const SubmitTopicEvent());
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
    );
  }

  Widget _buildTopicWrap(List<Topic> data, TopicState state) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 16,
      runSpacing: 16,
      children: data.asMap().entries.map((entry) {
        final index = entry.key;
        final topic = entry.value;
        return InkWell(
          onTap: () {
            context
                .read<TopicBloc>()
                .add(ChosseTopicEvent(selectedData: data[index]));
          },
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: ColorsApp.backGroundColor, width: 1),
              color: state.selectedTitles!.contains(data[index])
                  ? ColorsApp.backGroundColor
                  : Colors.white,
            ),
            child: Text(
              topic.title ?? '',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: state.selectedTitles!.contains(data[index])
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
