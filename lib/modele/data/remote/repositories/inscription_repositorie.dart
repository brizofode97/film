import 'package:film/modele/data/remote/services/dio_service.dart';

class InscriptionRepositorie{

 final _dioService = DioService();

 Future<dynamic> registrer(
   {required String endpoint,
   required Map<String, dynamic> queryBody,
   required String headerContentType, 
   required String headerAccept,}
 ) async{
   var response = await _dioService.postDio(
    endPoint: endpoint, 
    queryBody: queryBody, 
    headerContentType: headerContentType, 
    headerAccept: headerAccept);
    if(response != 'error'){
      print('les donnees sont envoyees');
    } else{
      print('erreur envoi');
    }
    return null;
 }

}