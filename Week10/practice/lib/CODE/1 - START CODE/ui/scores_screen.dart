import 'package:flutter/material.dart';
import 'package:practice/CODE/1%20-%20START%20CODE/data/services/auth_service.dart';
import 'package:practice/CODE/1%20-%20START%20CODE/ui/theme.dart';

import '../model/score.dart';
import '../data/repositories/scores_repository.dart';

class ScoresScreen extends StatefulWidget {
  const ScoresScreen({super.key, required this.onLogout});

  final VoidCallback onLogout;

  @override
  State<ScoresScreen> createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoresScreen> {
  List<Score>? scores;
  String? error;

  @override
  void initState() {
    super.initState();

    fetchSCores();
  }

  void fetchSCores() async {
    // Ask the ScoresRepository instance to fetch the scores
    scores = await ScoresRepository.instance.getSCores();
    setState(() {}); // since scores is future so it takes some time to load, therefore we need to rebuild the ui , otherwise we will we get the error display "Fail to show  the content"

    if (scores == null) {
      setState(() {
        error = "Failed to fetch the scores";
      });
    }
    // if succes, update the scores list and refresh
    // If failure, update the error and refresh
  }

  String? get userName {
    // Ask the AuthenticationService instance the current user nale (if any)
    if (AuthenticationService.instance.session?.user.name != null) {
      return AuthenticationService.instance.session?.user.name;
    }

    return null;
  }

  Widget get content {
    // If scores list => dispaly the list using the ScoreTile
    if (scores != null) {
      return ListView.builder(
        itemCount: scores!.length,
        itemBuilder: (context, index) => ScoreTile(score: scores![index]),
      );
    }

    // if error, dispaly the erro in red, centered
    if (scores == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Center(
          child: Text(
            error = 'Fail to show the content',
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    // otherwise, we disaply the  CircularProgressIndicator
    return CircularProgressIndicator();
  }

  String get welcomeLabel => "Welcome ${userName != null ? userName! : ""} !";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(welcomeLabel, style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: widget.onLogout,
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
        backgroundColor: AppTheme.mainColor,
      ),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Padding(padding: const EdgeInsets.all(20.0), child: content),
      ),
    );
  }
}

class ScoreTile extends StatelessWidget {
  const ScoreTile({super.key, required this.score});

  final Score score;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(8.0),
      // child: ListTile(
      //   tileColor: Colors.amber,
      //   title: Text(score.title),
      //   trailing: Text('${score.value}/100', style: TextStyle(color: color),),
      // ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Text(score.title, style: TextStyle(fontSize: 16)),
          Spacer(),
          Text('${score.value}/100', style: TextStyle(color: color)),
        ],
      ),
    );
  }

  // I do:  to get color depending on the result
  Color? get color {
    if (score.value >= 75 && score.value <= 100) {
      return Colors.green;
    }
    if (score.value < 75 && score.value >= 50) {
      return Colors.orange;
    }
    if (score.value < 50 && score.value >= 0) {
      return Colors.red;
    }
    return null;
  }
}
