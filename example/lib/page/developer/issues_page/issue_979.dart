import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_example/page/developer/issues_page/issue_index_page.dart';
import 'package:photo_manager_example/util/asset_utils.dart';

class Issue979 extends StatefulWidget {
  const Issue979({Key? key}) : super(key: key);

  @override
  State<Issue979> createState() => _Issue979State();
}

class _Issue979State extends State<Issue979> with IssueBase {
  @override
  Widget build(BuildContext context) {
    return buildScaffold([
      buildButton('Save image and read asset', _saveAndRead),
      buildLogWidget(),
    ]);
  }

  @override
  int get issueNumber => 979;

  Future<void> _saveAndRead() async {
    try {
      final file = await AssetsUtils.downloadJpeg();
      final name = file.path.split('/').last;
      final asset =
          await PhotoManager.editor.saveImageWithPath(file.path, title: name);

      if (asset != null) {
        final id = asset.id;
        final width = asset.width;
        final height = asset.height;
        addLog('The save id = $id, width = $width, height = $height');
      } else {
        addLog('The save asset is null');
      }
    } catch (e) {
      addLog('Save error : $e');
    }
  }
}
