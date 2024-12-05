import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> pickPDFandUploadToStorage({required String secOrlecOrexam}) async {
  File? selectedFile;
  try {
    final pdf = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pdf != null && pdf.files.single.path != null) {
      final supabase = Supabase.instance.client;
      // setState(() {
      selectedFile = File(pdf.files.single.path!);
      // });
      await supabase.storage
          .from('files')
          .upload('$secOrlecOrexam/${pdf.names[0]}', selectedFile);
    } else {
      return;
    }
  } catch (e) {
    throw ('Error picking file: $e');
  }
}
