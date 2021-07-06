import 'package:flutt_firebase/models/users.dart';
import 'package:flutt_firebase/models/widgets.dart';
import 'package:flutt_firebase/screens/home/addwidget.dart';
import 'package:flutt_firebase/screens/home/widgetList.dart';
import 'package:flutt_firebase/screens/services/database.dart';
import 'package:flutt_firebase/screens/services/widgets/widgetscontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
   var _selectedIndex = 0;
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final user = context.watch<TheUser>();
    return Scaffold(
            backgroundColor: Color.fromRGBO(43, 54, 72, 1),
            appBar: AppBar(title: Text('Widgets List',style: TextStyle(color: Color.fromRGBO(175, 189, 209, 1)),),backgroundColor: Color.fromRGBO(33, 41, 54, 1),
          actions: [
            IconButton(
              icon: Icon(Icons.logout,color: Color.fromRGBO(175, 189, 209, 1),),
            onPressed: ()async{
              context.read<AuthService>().signOut();
              },
            ),]
            ),
            body: StackWidgets(selectedindex: _selectedIndex,),

            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.widgets),
                  label: 'Widgets',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Add',
                ),                
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color.fromRGBO(33, 41, 54, 1),
              selectedFontSize: 15,
              selectedIconTheme: IconThemeData(color: Color.fromRGBO(175, 189, 209, 1), size: 40),
              selectedItemColor: Color.fromRGBO(175, 189, 209, 1),

            ),
      
      );
  }
}

class StackWidgets extends StatelessWidget {
  final int selectedindex;
  const StackWidgets({
    Key key, this.selectedindex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<Users>>(create: (context) => DatabaseService().users, initialData: null,),
        // StreamProvider<TheUser>(create: (context) => DatabaseService(uid: user.uid).currentUser, initialData: null,catchError: (_,__)=> null,),
        StreamProvider<List<Widgets>>(create: (context) => WidgetsController().widgets, initialData: null,),
      ],
        child: IndexedStack(
          index: selectedindex,
          children: [
            WidgetList(),        
            WidgetList(),            
            AddWidget(),    
          ],
          )
  );
  }
}
