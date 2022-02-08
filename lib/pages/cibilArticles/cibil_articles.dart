import 'package:finance/common/index.dart';

class CibilArticles extends StatefulWidget {
  CibilArticles();

  @override
  _CibilArticlesState createState() => _CibilArticlesState();
}

class _CibilArticlesState extends State<CibilArticles> {
  Query? _cibilArticlesRef;
  @override
  void initState() {
    _cibilArticlesRef = FirebaseDatabase.instance
        .ref()
        .child('inventory/articles/cibil')
        .orderByChild('index-of-article');
    super.initState();
  }

  _cibilArticles({Map? map, double? screenHeight}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CibilArticleDetailsPage(map)),
          );
        },
        child: Container(
          height: screenHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: coffee,
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [white, coffee],
            ),
            border: Border.all(
              width: 0.3,
              color: brown,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  map!['title'] + " ...",
                  style: const TextStyle(
                      color: brown, fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  map['article'],
                  style: const TextStyle(
                      color: grey, fontWeight: FontWeight.bold, fontSize: 10),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size? screenSize = MediaQuery.of(context).size;

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FirebaseAnimatedList(
          query: _cibilArticlesRef!,
          itemBuilder: (BuildContext ctx, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map articles = snapshot.value as Map<dynamic, dynamic>;
            return _cibilArticles(
                map: articles, screenHeight: screenSize.height * 0.1);
          },
        ),
      ),
    );
  }
}
