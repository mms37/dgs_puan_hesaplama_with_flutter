import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DGS Puan Hesaplama'),
        ),
        body: Center(
          child: DGSPuanHesaplayici(),
        ),
      ),
    );
  }
}

class DGSPuanHesaplayici extends StatefulWidget {
  @override
  _DGSPuanHesaplayiciState createState() => _DGSPuanHesaplayiciState();
}

class _DGSPuanHesaplayiciState extends State<DGSPuanHesaplayici> {
  TextEditingController onlisansPuanController = TextEditingController();
  TextEditingController sayisalDogruController = TextEditingController();
  TextEditingController sayisalYanlisController = TextEditingController();
  TextEditingController sozelDogruController = TextEditingController();
  TextEditingController sozelYanlisController = TextEditingController();

  double hesaplananSayisalPuan = 0;
  double hesaplananSozelPuan = 0;
  double hesaplananEaPuan = 0;

  void _hesaplamayiYap() {
    double onlisansPuan = double.tryParse(onlisansPuanController.text) ?? 0;
    int sayisalDogru = int.tryParse(sayisalDogruController.text) ?? 0;
    int sayisalYanlis = int.tryParse(sayisalYanlisController.text) ?? 0;
    int sozelDogru = int.tryParse(sozelDogruController.text) ?? 0;
    int sozelYanlis = int.tryParse(sozelYanlisController.text) ?? 0;

    int kalanSayisalDogru = (sayisalDogru - sayisalYanlis * 0.25).clamp(0, 50).toInt();
    int kalanSozelDogru = (sozelDogru - sozelYanlis * 0.25).clamp(0, 50).toInt();

    hesaplananSayisalPuan = 105.536 + (kalanSozelDogru * 0.336) + (kalanSayisalDogru * 1.575) + (onlisansPuan * 0.6);
    hesaplananSozelPuan = 87.747 + (kalanSozelDogru * 1.681) + (kalanSayisalDogru * 0.315) + (onlisansPuan * 0.6);
    hesaplananEaPuan = 96.642 + (kalanSozelDogru * 1.009) + (kalanSayisalDogru * 0.945) + (onlisansPuan * 0.6);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: onlisansPuanController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: 'Önlisans Başarı Puanı (40-80 arası)'),
          ),
          SizedBox(height: 10),
          TextField(
            controller: sayisalDogruController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Sayısal Doğru Sayısı'),
          ),
          TextField(
            controller: sayisalYanlisController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Sayısal Yanlış Sayısı (Maksimum 50)'),
          ),
          SizedBox(height: 10),
          TextField(
            controller: sozelDogruController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Sözel Doğru Sayısı'),
          ),
          TextField(
            controller: sozelYanlisController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Sözel Yanlış Sayısı (Maksimum 50)'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _hesaplamayiYap,
            child: Text('Puanları Hesapla'),
          ),
          SizedBox(height: 20),
          Text(
            'DGS Sayısal: ${hesaplananSayisalPuan.toStringAsFixed(3)}',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'DGS Sözel: ${hesaplananSozelPuan.toStringAsFixed(3)}',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'DGS Eşit Ağırlık: ${hesaplananEaPuan.toStringAsFixed(3)}',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
