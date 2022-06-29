import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'put_request.dart';
import 'dart:io';

class S3Client {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserToken() async {
    final User? user = auth.currentUser;
    final String? token = await user?.getIdToken();
    return (token);
  }

  String? stringResponse;
  Map? mapResponse;
  final PutRequest putRequest = PutRequest();
  Future upload(File file) async {
    http.Response response;

    //temporary URL generated by ngrok to test server locally
    const String url = "https://api.hearsome.live/v1/user/signed_url";
    //seng get request to get signed URL which will be used to upload audio the bucket
    response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer ' + (await getUserToken())!,
      'language': 'en',
      'platform': 'ios',
      "app-version": "1"
    });

    if (response.statusCode == 200) {
      //if our call is successful, Extract data from response body
      mapResponse = jsonDecode(response.body);
      final String signedURL = mapResponse?['signedURL'];
      final String objectName = mapResponse?['objectName'];
      final String bucketName = mapResponse?['bucketName'];

      //call put request from putRequest file to upload audio to s3 bucket
      putRequest.request(signedURL, file);
      final String objectURL =
          'https://' + bucketName + '.s3.amazonaws.com/' + objectName;
      print(objectURL);

      // TODO:: send objectURL to transcribe endpoint

    }
  }
}
