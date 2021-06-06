import 'package:click_to_chat/pages/whatsapp_tool_page.dart';
import 'package:click_to_chat/pages/ws_tool_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('emprendedores TOOLS'),
        actions: [],
      ),
      body: _homePageBoddy(),
      // body: WsTools(),
    );
  }
}

class _homePageBoddy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return WhatsAppTool();
    return WsTools();
  }
}
