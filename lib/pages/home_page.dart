import 'package:finance/common/index.dart';
import 'package:finance/theme/marathi_finance_theme.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var user;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return MFTheme(
              // appBar: const Text("मराठी Finance"),
              body: Dashboard(),

              user: snapshot.data,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong..!"),
            );
          } else {
            return SignUpPage();
          }
        });
  }
}
