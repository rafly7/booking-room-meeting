import 'package:booking_room_app/blocs/counter/counter_bloc.dart';
import 'package:booking_room_app/views/booking/widgets/label_header.dart';
import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CapacityHeader extends SliverPersistentHeaderDelegate {
  const CapacityHeader(
      {required this.maxExtentHeight, required this.minExtentHeight});

  final double maxExtentHeight;
  final double minExtentHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // double shrinkPercentage = min(1, shrinkOffset / (maxExtent - minExtent));

    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 0, 0.0, 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelHeader(
            name: 'Capacity',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: BlocProvider<CounterCubit>(
              create: (context) => CounterCubit(),
              child: BlocBuilder<CounterCubit, int>(builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => context.read<CounterCubit>().decrement(),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: state > 0
                                ? const Color(0xFF7f8C8D).withOpacity(0.5)
                                : Colors.transparent,
                            shape: BoxShape.circle,
                            boxShadow: state > 0
                                ? [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      blurRadius: 6,
                                      offset: Offset(4, 4),
                                    ),
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 4,
                                      offset: Offset(-4, -4),
                                    ),
                                  ]
                                : null,
                          ),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: state > 0 ? 1 : 0,
                            child: Container(
                              child: Center(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          margin:
                              const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 5.0,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // color: const Color(0xFFEFEEEE),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white.withOpacity(0.9),
                                      offset: const Offset(6.0, 6.0),
                                      blurRadius: 6.0,
                                      spreadRadius: 8),
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(-6.0, -6.0),
                                      blurRadius: 6.0,
                                      spreadRadius: 8),
                                ],
                              ),
                              margin:
                                  const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                              padding: const EdgeInsets.all(2.0),
                              child: Center(
                                child: Text(
                                  state > 0 ? '$state +' : '$state',
                                  style: primaryTextStyle().copyWith(
                                    fontSize: 24,
                                    color: const Color(0xFF7f8C8D),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        // child: Container(
                        //   child: Center(
                        //     child: Text(
                        //       state > 0 ? '$state +' : '$state',
                        //       style: primaryTextStyle().copyWith(
                        //         fontSize: 24,
                        //         color: const Color(0xFF7f8C8D),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => context.read<CounterCubit>().increment(),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF7f8C8D).withOpacity(0.5),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                blurRadius: 6,
                                // spreadRadius: 2,
                                offset: Offset(4, 4),
                              ),
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 4,
                                // spreadRadius: 4,
                                offset: Offset(-4, -4),
                              ),
                            ],
                          ),
                          child: Container(
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxExtentHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minExtentHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
