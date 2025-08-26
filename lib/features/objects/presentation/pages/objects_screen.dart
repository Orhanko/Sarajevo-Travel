import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarajevo_travel/app_bar_icon.dart';
import 'package:sarajevo_travel/features/objects/presentation/bloc/object_list/object_list_bloc.dart';
import 'package:sarajevo_travel/features/objects/presentation/bloc/object_list/object_list_event.dart';
import 'package:sarajevo_travel/features/objects/presentation/bloc/object_list/object_list_state.dart';
import 'package:sarajevo_travel/features/objects/presentation/pages/object_detail_screen.dart';
import 'package:sarajevo_travel/features/objects/presentation/widgets/object_card.dart';

class ObjectsScreen extends StatelessWidget {
  const ObjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ObjectListBloc()..add(ObjectListStarted()),

      child: BlocBuilder<ObjectListBloc, ObjectListState>(
        builder: (context, state) {
          switch (state.status) {
            case ObjectListStatus.loading:
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  centerTitle: true,
                  title: Image.asset('assets/logo/logotip.png', height: 36, fit: BoxFit.contain),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(0.8),
                    child: Container(
                      height: 0.8,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(Theme.of(context).brightness == Brightness.dark ? 80 : 200),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                body: const Center(child: CircularProgressIndicator()),
              );
            case ObjectListStatus.failure:
              return Center(child: Text(state.message ?? "Greska pri učitavanju"));

            case ObjectListStatus.success:
              final items = state.objects;
              if (items.isEmpty) return const Center(child: Text('Nema objekata'));
              return Scaffold(
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 110,
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0.05),
                        child: Container(
                          height: 0.8,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withAlpha(
                                  Theme.of(context).brightness == Brightness.dark ? 80 : 200,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      title: Image.asset('assets/logo/logotip.png', height: 36, fit: BoxFit.contain),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 16, bottom: 12),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 36,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Šta tražite?',
                                        hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                                        suffixIcon: Icon(Icons.search, color: Color(0xffd85151)),
                                        contentPadding: EdgeInsets.only(left: 16),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16),

                                          borderSide: BorderSide(width: 1, color: Color(0xFFE0E5EB)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16),
                                          borderSide: const BorderSide(color: Color(0xFFE0E5EB), width: 1.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16),
                                          borderSide: const BorderSide(color: Color(0xFFE0E5EB), width: 1.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                AppBarIcon(icon: 'assets/custom_icons/align-center.svg'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => ObjectCard(
                          object: items[index],
                          onTap: () {
                            Navigator.of(
                              context,
                            ).push(MaterialPageRoute(builder: (_) => ObjectDetailScreen(object: items[index])));
                          },
                        ),
                        childCount: items.length,
                      ),
                    ),
                  ],
                ),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
