import 'package:berry_catalog/theme/app_theme.dart';
import 'package:berry_catalog/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Apptheme.colorbackground, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        centerTitle: true,
        leading: AppBarLeadingBackButton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Apptheme.colorbackground,
        title: Image.asset(
          'images/LetrasLogo2.png',
          // fit: BoxFit.contain,
          height: 100,
          width: 150,
        ),
        elevation: 0,
        toolbarHeight: 40,
      ),
      body: const SingleChildScrollView(child: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: Colors.red,
      margin: const EdgeInsets.only(left: 20, bottom: 2, right: 20),
      child: Column(
        children: [
          // _MyHistory(),
          _InfoCard(
            title: 'Mi Historia',
            description:
                'Cuando me convertí  en madre por primera vez, sentí la necesidad de hacer algo creativo mientras criaba a mi hija en casa. Siendo que en mi trabajo de sistemas ya no me daba el tiempo necesario para poder estar más cerca de mi hija y perdiéndome de momentos mágicos, decidí emprender en algo que siembre había sido una pasión para mí, la joyería.',
            color2: const Color(0xffFAF0BF).withOpacity(0.7),
            color1: const Color(0xffFAF0BF).withOpacity(0.9),
            leftIcon: 171,
          ),
          const SizedBox(height: 5),
          // _Berry(),
          _InfoCard(
            title: 'Berrylicious',
            description:
                'Berrylicious, surge por ese amor de mi hija a las berrys, que nunca olvidaré y quise plasmarlo en algo que me recordara ese bello momento toda mi vida.',
            color2: const Color(0xffFAF0BF).withOpacity(0.5),
            color1: const Color(0xffFAF0BF).withOpacity(0.7),
            leftIcon: 171,
          ),
          const SizedBox(height: 5),
          _InfoCard(
            title: 'Misión',
            description:
                'Berrylicious, surge por ese amor de mi hija a las berrys, que nunca olvidaré y quise plasmarlo en algo que me recordara ese bello momento toda mi vida.',
            color2: const Color(0xffFAF0BF).withOpacity(0.4),
            color1: const Color(0xffFAF0BF).withOpacity(0.6),
            leftIcon: 171,
          ),
          const SizedBox(height: 5),
          _InfoCard(
            title: 'Mi Mensaje',
            description:
                'Como madre emprendedora, he aprendido que la joyería es más que solo un accesorio. Puede ser una forma de expresar amor, amistad, gratitud y alegría. Por lo tanto, nuestro objetivo es brindar a nuestros clientes una experiencia de compra excepcional, con productos y servicios cuidadosamente seleccionados y ofrecidos con amor y atención al detalle.',
            color2: const Color(0xffFAF0BF).withOpacity(0.2),
            color1: const Color(0xffFAF0BF).withOpacity(0.4),
            leftIcon: 171,
          ),
          const SizedBox(height: 5),
          _InfoCard(
            title: 'Productos',
            description:
                'Creamos un empaque con mucho amor y cuidado para ti. Nos aseguramos que cada producto sea cuidadosamente empaquetado antes de entregar o enviar a nuestros clientes. Nos tomamos muy en serio el asegurarnos de que tus productos lleguen en perfectas condiciones y que tengas una experiencia de compra satisfactoria' +
                    '\n' +
                    '\n' +
                    'Esperamos que al abrirlo encuentres la misma alegría y emoción que sentimos al prepararlo para ti. Queremos que sientas que tu compra es muy especial y valorada.' +
                    '\n' +
                    '\n' +
                    ' Gracias por confiar en nosotros para ofrecerte joyas de calidad y una experiencia de compra única. ¡Disfruta de tu compra y vuelve pronto!',
            color1: const Color(0xffFAF0BF).withOpacity(0.2),
            color2: const Color(0xffFAF0BF).withOpacity(0.1),
            leftIcon: 171,
          ),
        ],
      ),
    );
  }
}

class _MyHistory extends StatelessWidget {
  const _MyHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          // top: 1,
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            // margin: EdgeInsets.only(right: 1),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.amber,
                  Colors.amber.withOpacity(0.5),
                ],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mi Historia',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Cuando me convertí  en madre por primera vez, sentí la necesidad de hacer algo creativo mientras criaba a mi hija en casa. Siendo que en mi trabajo de sistemas ya no me daba el tiempo necesario para poder estar más cerca de mi hija y perdiéndome de momentos mágicos, decidí emprender en algo que siembre había sido una pasión para mí, la joyería.',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, letterSpacing: 0),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 100,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
              color: Apptheme.colorbackground,
            ),
            child: Image.asset('images/LogoNegro.png'),
          ),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String description;
  final double? leftIcon;
  final Color color1;
  final Color color2;
  const _InfoCard({
    Key? key,
    required this.title,
    required this.description,
    required this.color1,
    required this.color2,
    this.leftIcon = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          // top: 1,
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            // margin: EdgeInsets.only(right: 1),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  color1,
                  color2,
                ],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, letterSpacing: 0),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: leftIcon,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
              color: Apptheme.colorbackground,
            ),
            child: Image.asset('images/LogoNegro.png'),
          ),
        ),
      ],
    );
  }
}

class _Berry extends StatelessWidget {
  const _Berry({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          // top: 1,
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            // margin: EdgeInsets.only(right: 1),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  // Colors.amber.withOpacity(0.5),
                  // Colors.orange.withOpacity(0.7),
                  const Color(0xffFAF0BF).withOpacity(0.7),
                  const Color(0xffFAF0BF),
                ],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Berrylicious',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Berrylicious, surge por ese amor de mi hija a las berrys, que nunca olvidaré y quise plasmarlo en algo que me recordara ese bello momento toda mi vida.',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, letterSpacing: 0),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 110,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
              color: Apptheme.colorbackground,
            ),
            child: Image.asset('images/LogoNegro.png'),
          ),
        ),
      ],
    );
  }
}
