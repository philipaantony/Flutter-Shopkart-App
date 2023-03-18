
import 'package:firebase_app/DashBoard/MyFiles.dart';
import 'package:flutter/material.dart';




class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CloudStorageInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(16),
      decoration:const BoxDecoration(
        color:  Color.fromARGB(218, 226, 226, 226),
        borderRadius:  BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(16 * 0.1),
                height: 40,
                width: 40,
                decoration: const BoxDecoration
                (
                  color:Color.fromARGB(226, 255, 254, 254),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child:const Icon(Icons.document_scanner)
              ),
              const Icon(Icons.more_vert, color: Color.fromARGB(255, 0, 0, 0))
            ],
          ),
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ProgressLine(
            color: info.color,
            percentage: info.percentage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${info.numOfFiles} Files",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Color.fromARGB(179, 0, 0, 0)),
              ),
              Text(
                info.totalStorage!,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color ,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
            borderRadius:const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration:const BoxDecoration(
              color: Color.fromARGB(255, 0, 102, 198),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
