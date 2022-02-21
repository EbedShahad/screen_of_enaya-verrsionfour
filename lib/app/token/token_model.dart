// // To parse this JSON data, do
// //
// //     final tokenCreation = tokenCreationFromJson(jsonString);

// import 'dart:convert';

// TokenCreation tokenCreationFromJson(String str) => TokenCreation.fromJson(json.decode(str));

// String tokenCreationToJson(TokenCreation data) => json.encode(data.toJson());

// class TokenCreation {
//     TokenCreation({
//         this.tokenType,
//         this.expiresIn,
//         this.accessToken,
//     });

//     String tokenType;
//     int expiresIn;
//     String accessToken;

//     factory TokenCreation.fromJson(Map<String, dynamic> json) => TokenCreation(
//         tokenType: json["token_type"],
//         expiresIn: json["expires_in"],
//         accessToken: json["access_token"],
//     );

//     Map<String, dynamic> toJson() => {
//         "token_type": tokenType,
//         "expires_in": expiresIn,
//         "access_token": accessToken,
//     };
// }
