import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:customer_manager/viewmodel/Mainvm.dart';

class Mainv extends StatelessWidget {
  @override
  build(BuildContext context) {
    final provider = Provider.of<Mainvm>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: provider.usernameController,
            decoration: InputDecoration(labelText: "username"),
          ),
          TextField(
            controller: provider.passwordController,
            decoration: InputDecoration(labelText: "password"),
          ),
          RaisedButton(
            onPressed: provider.login,

            /// 根据 state 的值，按钮显示不同内容。
            child: provider.state == 0
                ? Text("login")
                : provider.state == 1
                    ? CircularProgressIndicator()
                    : provider.state == 2
                        ? Icon(Icons.done)
                        : Icon(Icons.cancel),
          ),
        ],
      ),
    );
  }
}
