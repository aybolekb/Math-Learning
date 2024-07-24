import 'package:flutter/material.dart';
import 'package:math_web/screens/web_viewContainer.dart';

class TeachScreen extends StatelessWidget {
  TeachScreen({super.key});

  final List<Map<String, dynamic>> mathItems = [
    {
      'title': 'Ahtimallyk',
      'icon': Icons.add,
      'color': Colors.red.shade100,
      'webUrl': 'assets/html_math/ahtimallyk.html'
    },
    {
      'title': 'Asyl funksiya',
      'icon': Icons.remove,
      'color': Colors.blue.shade100,
      'webUrl': 'assets/html_math/asyl_funksiya.html'
    },
    {
      'title': 'Bikwadrat denleme',
      'icon': Icons.close,
      'color': Colors.green.shade100,
      'webUrl': 'assets/html_math/bikwadrat_denleme.html'
    },
    {
      'title': 'Çylsyrymly göterimler',
      'icon': Icons.percent,
      'color': Colors.yellow.shade100,
      'webUrl': 'assets/html_math/cylsyrymly_goterimler.html'
    },
    {
      'title': 'Deňlemeler deňsizlikler',
      'icon': Icons.equalizer,
      'color': Colors.orange.shade100,
      'webUrl': 'assets/html_math/denlemeler_densizlikler.html'
    },
    {
      'title': 'Deňlemeler sistemasy',
      'icon': Icons.attach_money,
      'color': Colors.purple.shade100,
      'webUrl': 'assets/html_math/denlemeler_sistemasy.html'
    },
    {
      'title': 'Differensial',
      'icon': Icons.functions,
      'color': Colors.teal.shade100,
      'webUrl': 'assets/html_math/differensial.html'
    },
    {
      'title': 'Erkin burcun sinusy kosinusy',
      'icon': Icons.calculate,
      'color': Colors.pink.shade100,
      'webUrl': 'assets/html_math/erkin_burcun_sinusy_kosinusy.html'
    },
    {
      'title': 'Funksiya',
      'icon': Icons.filter_9,
      'color': Colors.amber.shade100,
      'webUrl': 'assets/html_math/funksiya.html'
    },
    {
      'title': 'Getirme formulalar',
      'icon': Icons.exposure_plus_1,
      'color': Colors.indigo.shade100,
      'webUrl': 'assets/html_math/getirme_form.html'
    },
    {
      'title': 'Görkezijili deňleme',
      'icon': Icons.add,
      'color': Colors.red.shade100,
      'webUrl': 'assets/html_math/gorkezijili_denleme.html'
    },
    {
      'title': 'Integral',
      'icon': Icons.close,
      'color': Colors.green.shade100,
      'webUrl': 'assets/html_math/integral__.html'
    },
    {
      'title': 'Jem we tapawut',
      'icon': Icons.percent,
      'color': Colors.yellow.shade100,
      'webUrl': 'assets/html_math/jemin_we_tap.html'
    },
    {
      'title': 'Kombinatorika',
      'icon': Icons.equalizer,
      'color': Colors.orange.shade100,
      'webUrl': 'assets/html_math/kombinatorika.html'
    },
    {
      'title': 'Kompleks sanlar',
      'icon': Icons.attach_money,
      'color': Colors.purple.shade100,
      'webUrl': 'assets/html_math/kompleks_sanlar.html'
    },
    {
      'title': 'Kwadrat ç',
      'icon': Icons.calculate,
      'color': Colors.pink.shade100,
      'webUrl': 'assets/html_math/kwadrat_denlemeler.html'
    },
    {
      'title': 'Kwadrat deňlemeler',
      'icon': Icons.filter_9,
      'color': Colors.amber.shade100,
      'webUrl': 'assets/html_math/logarifm_equation.html'
    },
    {
      'title': 'Natural',
      'icon': Icons.exposure_plus_1,
      'color': Colors.indigo.shade100,
      'webUrl': 'assets/html_math/natural.html'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ...List.generate(
              mathItems.length,
              (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewContainer(
                                  webUrl: mathItems[index]['webUrl'],
                                  title: mathItems[index]['title'])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: ListTile(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          tileColor: mathItems[index]['color'],
                          leading: Icon(mathItems[index]['icon']),
                          trailing: const Icon(
                            Icons.arrow_right_outlined,
                            size: 40,
                          ),
                          title: Text(mathItems[index]['title']),
                        ),
                      ),
                    ),
                  ))
        ],
      ),
    );
  }
}
