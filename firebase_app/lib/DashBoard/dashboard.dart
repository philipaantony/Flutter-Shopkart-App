import 'package:data_table_2/data_table_2.dart';
import 'package:firebase_app/DashBoard/MyFiles.dart';
import 'package:firebase_app/DashBoard/file_info_card.dart';
import 'package:firebase_app/Drawer/drawer.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(title: const Text('DashBord')),
      body: SingleChildScrollView( 
        child: SafeArea(
          child: 
          Column(
            children: [
              Padding(padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    color:  Color.fromARGB(255, 255, 255, 255),
                    child: GridView.builder(
                      
                      physics:const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1,
                       ),
                 itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),),
                  ),
      
      
      
      
      
      
        Container(
        padding: const EdgeInsets.all(10),
        decoration:const BoxDecoration(
          color:  Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          padding:const EdgeInsets.all(15),
          decoration:const BoxDecoration(  color:Color.fromARGB(224, 229, 223, 223),
                  borderRadius: BorderRadius.all(Radius.circular(10)),),
          child: Column(  
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recent Files",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(
      
                width: double.infinity,
                child: DataTable2(
                  
                  columnSpacing: 6,
                  minWidth: 600,
                  columns: const[
                    DataColumn(
                      label: Text("File Name"),
                    ),
                    DataColumn(
                      label: Text("Date"),
                    ),
                    DataColumn(
                      label: Text("Size"),
                    ),
                  ],
                  rows: List.generate(
                    demoRecentFiles.length,
                    (index) => recentFileDataRow(demoRecentFiles[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
        
          ),
                ],
              ),
              
              ),
            ],
          )
         
        ),
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Icon(Icons.file_present),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ],
  );
}




class RecentFile {
  final String? icon, title, date, size;

  RecentFile({this.icon, this.title, this.date, this.size});
}
List demoRecentFiles = [
  RecentFile(
    icon: "assets/icons/xd_file.svg",
    title: "XD File",
    date: "01-03-2021",
    size: "3.5mb",
  ),
  RecentFile(
    icon: "assets/icons/Figma_file.svg",
    title: "Figma File",
    date: "27-02-2021",
    size: "19.0mb",
  ),
  RecentFile(
    icon: "assets/icons/doc_file.svg",
    title: "Document",
    date: "23-02-2021",
    size: "32.5mb",
  ),
  RecentFile(
    icon: "assets/icons/sound_file.svg",
    title: "Sound File",
    date: "21-02-2021",
    size: "3.5mb",
  ),
  RecentFile(
    icon: "assets/icons/media_file.svg",
    title: "Media File",
    date: "23-02-2021",
    size: "2.5gb",
  ),
  RecentFile(
    icon: "assets/icons/pdf_file.svg",
    title: "Sales PDF",
    date: "25-02-2021",
    size: "3.5mb",
  ),
  RecentFile(
    icon: "assets/icons/excle_file.svg",
    title: "Excel File",
    date: "25-02-2021",
    size: "34.5mb",
  ),
];