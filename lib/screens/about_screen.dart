import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Okuw platformamyza hoş geldiňiz!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const Text('Biziň wezipämiz',
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(
            height: 10,
          ),
          const Text(
            ' Platformaňyzyň ady, biz ähli ýaşdaky okuwçylar üçin matematika bilimini elýeterli, özüne çekiji we güýçlendirmek wezipesini ýerine ýetirýäris. Bilimiň özgeriş güýjüne ynanýarys we matematika söýgüsini artdyrýan platforma üpjün etmegi maksat edinýäris.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Topar bilen tanyş',
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(
            height: 10,
          ),
          const Text(
              'Her setir setiriniň we her sapak meýilnamasynyň aňyrsynda matematika biliminiň geljegini kesgitlemek üçin ýadawsyz işleýän mugallymlar, işläp düzüjiler we dizaýnerler topary bar. ',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16)),
          const SizedBox(
            height: 20,
          ),
          // const Text(
          //     '[Platformanyňyzyň adyny] saýlanyňyz üçin sag boluň. Geliň, matematikany bilelikde başdan geçirmeli!',
          //     textAlign: TextAlign.justify,
          //     style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
