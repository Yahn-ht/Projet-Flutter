
// class Voiture{
//   late double _price;
//   late double _matr;

//   Voiture(double prix, double matr){
//     _matr = matr;
//     _price = prix;
//   }

  
//   double getPrice(){
//     return _price;
//   }

//   double getMatr(){
//     return _matr;
//   }

//   void prendre() async{

//   }

//   void setPrice(double prix){
//     _price = prix;
//   }
//   void setMatr(double matr){
//     _matr = matr;
//   }
// }

Future<String> fetchData1() {
  return Future.delayed(const Duration(seconds: 2), () {
    return 'Data 1 fetched';
  });
}

Future<String> fetchData2() {
  return Future.delayed(const Duration(seconds: 3), () {
    return 'Data 2 fetched';
  });
}

void main() async {
  List<String> results = await Future.wait([fetchData1(), fetchData2()]);
  print(results); // Affiche ['Data 1 fetched', 'Data 2 fetched'] après 3 secondes
}
