import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/data_annotation_header.dart';
import '../widgets/footer_widget.dart';
import '../theme.dart';

class ImpressumPage extends StatefulWidget {
  const ImpressumPage({super.key});

  @override
  State<ImpressumPage> createState() => _ImpressumPageState();
}

class _ImpressumPageState extends State<ImpressumPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const DataAnnotationHeader(),
                _buildHeroSection(context)
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 200.ms)
                    .slideY(begin: 0.3, end: 0),
                _buildImpressumContent(context)
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 400.ms)
                    .slideY(begin: 0.3, end: 0),
                const FooterWidget()
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 600.ms)
                    .slideY(begin: 0.3, end: 0),
              ],
            ),
          ),
          Positioned(
            bottom: 32,
            right: 32,
            child: _buildScrollToTopButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.05),
            Theme.of(context).colorScheme.secondary.withOpacity(0.05),
          ],
        ),
      ),
      child: Column(
        children: [
          // Breadcrumb
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => Navigator.pushReplacementNamed(context, '/'),
                  child: Text(
                    'Home',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                    size: 16,
                  ),
                ),
                Text(
                  'Impressum',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
          .animate()
          .slideX(begin: -0.5, end: 0, duration: 600.ms, delay: 200.ms)
          .fadeIn(duration: 600.ms, delay: 200.ms),
          
          const SizedBox(height: 40),
          
          // Main Title
          Text(
            'Impressum',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 48,
              letterSpacing: -1,
            ),
            textAlign: TextAlign.center,
          )
          .animate()
          .fadeIn(duration: 800.ms, delay: 400.ms)
          .slideY(begin: 0.3, end: 0)
          .shimmer(duration: 2000.ms, delay: 1200.ms),
          
          const SizedBox(height: 20),
          
          // Subtitle
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              'Legal information and contact details according to German law',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                fontWeight: FontWeight.w400,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          )
          .animate()
          .fadeIn(duration: 800.ms, delay: 600.ms)
          .slideY(begin: 0.3, end: 0),
        ],
      ),
    );
  }

  Widget _buildImpressumContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection(
                  context,
                  'Angaben gemäß § 5 TMG',
                  Icons.business,
                  '''ImplementAI MH UG (haftungsbeschränkt)

Zur Schlottareuth 22

90427 Nürnberg

Deutschland''',
                ),
                
                const SizedBox(height: 40),
                
                _buildSection(
                  context,
                  'Vertreten durch',
                  Icons.person,
                  '''Die Geschäftsführer:

Benedikt Herlt

Mahdi Mantash''',
                ),
                
                const SizedBox(height: 40),
                
                _buildSection(
                  context,
                  'Kontakt',
                  Icons.contact_mail,
                  'E-Mail: official@implementai-mh.de',
                ),
                
                const SizedBox(height: 40),
                
                _buildSection(
                  context,
                  'Registereintrag',
                  Icons.article,
                  '''Eintragung im Handelsregister.

Registergericht: Amtsgericht Nürnberg

Registernummer: HRB 44445''',
                ),
                
                const SizedBox(height: 40),
                
                _buildSection(
                  context,
                  'Umsatzsteuer-ID',
                  Icons.receipt,
                  '''Umsatzsteuer-Identifikationsnummer gemäß § 27 a Umsatzsteuergesetz:

DEXXXXXXXXX''',
                ),
                
                const SizedBox(height: 40),
                
                _buildSection(
                  context,
                  'Verantwortlich für den Inhalt nach § 55 Abs. 2 RStV',
                  Icons.edit,
                  '''Benedikt Herlt, Mahdi Mantash

Zur Schlottareuth 22

90427 Nürnberg''',
                ),
                
                const SizedBox(height: 40),
                
                _buildSection(
                  context,
                  'EU-Streitschlichtung',
                  Icons.gavel,
                  '''Die Europäische Kommission stellt eine Plattform zur Online-Streitbeilegung (OS) bereit:

https://ec.europa.eu/consumers/odr/

Unsere E-Mail-Adresse finden Sie oben im Impressum.''',
                ),
                
                const SizedBox(height: 40),
                
                _buildSection(
                  context,
                  'Verbraucherstreitbeilegung / Universalschlichtungsstelle',
                  Icons.balance,
                  'Wir sind nicht bereit oder verpflichtet, an Streitbeilegungsverfahren vor einer Verbraucherschlichtungsstelle teilzunehmen.',
                ),
                
                const SizedBox(height: 40),
                
                _buildDisclaimerSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, IconData icon, String content) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimerSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.warning,
                  color: Theme.of(context).colorScheme.error,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Haftungsausschluss (Disclaimer)',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          _buildDisclaimerSubsection(
            context,
            'Haftung für Inhalte',
            '''Als Diensteanbieter sind wir gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Diensteanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen. Verpflichtungen zur Entfernung oder Sperrung der Nutzung von Informationen nach den allgemeinen Gesetzen bleiben hiervon unberührt. Eine diesbezügliche Haftung ist jedoch erst ab dem Zeitpunkt der Kenntnis einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden von entsprechenden Rechtsverletzungen werden wir diese Inhalte umgehend entfernen.''',
          ),
          
          const SizedBox(height: 24),
          
          _buildDisclaimerSubsection(
            context,
            'Haftung für Links',
            '''Unser Angebot enthält Links zu externen Webseiten Dritter, auf deren Inhalte wir keinen Einfluss haben. Deshalb können wir für diese fremden Inhalte auch keine Gewähr übernehmen. Für die Inhalte der verlinkten Seiten ist stets der jeweilige Anbieter oder Betreiber der Seiten verantwortlich. Die verlinkten Seiten wurden zum Zeitpunkt der Verlinkung auf mögliche Rechtsverstöße überprüft. Rechtswidrige Inhalte waren zum Zeitpunkt der Verlinkung nicht erkennbar. Eine permanente inhaltliche Kontrolle der verlinkten Seiten ist jedoch ohne konkrete Anhaltspunkte einer Rechtsverletzung nicht zumutbar. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Links umgehend entfernen.''',
          ),
          
          const SizedBox(height: 24),
          
          _buildDisclaimerSubsection(
            context,
            'Urheberrecht',
            '''Die durch die Seitenbetreiber erstellten Inhalte und Werke auf diesen Seiten unterliegen dem deutschen Urheberrecht. Die Vervielfältigung, Bearbeitung, Verbreitung und jede Art der Verwertung außerhalb der Grenzen des Urheberrechtes bedürfen der schriftlichen Zustimmung des jeweiligen Autors bzw. Erstellers. Downloads und Kopien dieser Seite sind nur für den privaten, nicht kommerziellen Gebrauch gestattet. Soweit die Inhalte auf dieser Seite nicht vom Betreiber erstellt wurden, werden die Urheberrechte Dritter beachtet. Insbesondere werden Inhalte Dritter als solche gekennzeichnet. Sollten Sie trotzdem auf eine Urheberrechtsverletzung aufmerksam werden, bitten wir um einen entsprechenden Hinweis. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Inhalte umgehend entfernen.''',
          ),
          
          const SizedBox(height: 24),
          
          _buildDisclaimerSubsection(
            context,
            'Weitere rechtliche Hinweise',
            '''Wir haben alle Inhalte dieser Website sorgfältig geprüft. Dennoch können wir keine Garantie für die Vollständigkeit, Richtigkeit und Aktualität der bereitgestellten Informationen übernehmen.''',
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimerSubsection(BuildContext context, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildScrollToTopButton(BuildContext context) {
    return AnimatedBuilder(
      animation: _scrollController,
      builder: (context, child) {
        final showButton = _scrollController.hasClients && 
                          _scrollController.offset > 500;
        
        return AnimatedScale(
          scale: showButton ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: FloatingActionButton(
            onPressed: _scrollToTop,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            child: const Icon(Icons.keyboard_arrow_up, size: 28),
          ),
        );
      },
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
    );
  }
}