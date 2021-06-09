import 'dart:io';

class FileUploadBean {
  String name;
  File file;
  String type;
  int size;
  String md5Hash;
  int status;

  FileUploadBean({
    this.name,
    this.file,
    this.type,
    this.size,
  });
}
