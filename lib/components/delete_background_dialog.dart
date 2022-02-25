import 'package:flutter/cupertino.dart';

class DeleteBackgroundDialog extends StatefulWidget {
  const DeleteBackgroundDialog({Key? key}) : super(key: key);

  @override
  _DeleteBackgroundDialogState createState() => _DeleteBackgroundDialogState();
}

class _DeleteBackgroundDialogState extends State<DeleteBackgroundDialog> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("Delete Profile"),
      content: const Text("Are you sure you want to delete?"),
      actions: [
        CupertinoDialogAction(
            child: const Text("YES"),
            onPressed: ()
            {
              Navigator.pop(context,true);
            }
        ),
        CupertinoDialogAction(
            child: const Text("NO"),
            onPressed: (){
              Navigator.pop(context,false);
            }
        ),
      ],
    );
  }
}
