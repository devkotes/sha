import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sha/blocs/user/user_bloc.dart';
import 'package:sha/models/form/form_transfer_model.dart';
import 'package:sha/models/user_model.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/pages/transfer/transfer_amount_page.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_input.dart';
import 'package:sha/ui/widgets/transfer/recent_user_item.dart';
import 'package:sha/ui/widgets/transfer/result_user_item.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final TextEditingController searchController =
      TextEditingController(text: '');

  UserModel? selectedUser;

  late UserBloc userBloc;

  @override
  void initState() {
    userBloc = context.read<UserBloc>()..add(UserGetRecent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: Text(
              'Search',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          ShaInput(
            controller: searchController,
            labelText: 'By Username',
            isShowTitle: false,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                userBloc.add(UserGetByUsername(value));
              } else {
                selectedUser = null;
                userBloc.add(UserGetRecent());
              }
              setState(() {});
            },
          ),
          searchController.text.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 14),
                      child: Text(
                        'Recent Users',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        if (state is UserSuccess) {
                          return Column(
                            children: state.users
                                .map((user) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TransferAmountPage(
                                              data: FormTransferModel(
                                                sendTo: user.username,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: RecentUserItem(
                                        user: user,
                                      ),
                                    ))
                                .toList(),
                          );
                        }

                        return Center(
                          child: CircularProgressIndicator(
                            color: kDarkBackgroundColor,
                          ),
                        );
                      },
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 14),
                      child: Text(
                        'Result Users',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        if (state is UserSuccess) {
                          return Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 17,
                            runSpacing: 17,
                            children: state.users
                                .map((user) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedUser = user;
                                        });
                                      },
                                      child: ResultUserItem(
                                        user: user,
                                        isSelected:
                                            (selectedUser?.id == user.id),
                                      ),
                                    ))
                                .toList(),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            color: kDarkBackgroundColor,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                )
        ],
      ),
      floatingActionButton: (selectedUser != null)
          ? Container(
              margin: const EdgeInsets.all(24),
              child: ShaButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransferAmountPage(
                        data: FormTransferModel(
                          sendTo: selectedUser?.username,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
