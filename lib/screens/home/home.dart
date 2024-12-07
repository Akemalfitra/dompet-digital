import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:dptdgtl/pages/profile_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF19173D),
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              _userProfile(),
              SizedBox(height: 20),
              _balanceCard(),
              SizedBox(height: 20),
              _actionButtons(),
              SizedBox(height: 20),
              _adBanner(),
              SizedBox(height: 20),
              _walletLogos(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            // Navigasi ke halaman profil
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          child: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF0DA6C2),
                      const Color(0xFF320DAF),
                    ],
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-UQ0Dyv4UEl_PrsuAdgPMxfBgGTYM0NC22A&s',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontFamily: 'Poppins-medium',
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Hakim alfitra',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: const Color.fromARGB(142, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            print('Notification icon pressed');
          },
        ),
      ],
    );
  }

  Widget _balanceCard() {
  return Container(
    width: double.infinity,
    height: 100, // Increase height for better aesthetics
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          const Color(0xFF0DA6C2).withOpacity(0.8),
          const Color(0xFF320DAF).withOpacity(0.8),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Saldo Anda',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rp. 25.000.000',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ],
    ),
  );
}


  Widget _actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _actionButton(Icons.send, 'Kirim'),
        _actionButton(Icons.add, 'Isi Saldo'),
        _actionButton(Icons.history, 'Transaksi'),
        _actionButton(Icons.wallet, 'Dompet'),
      ],
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(42, 254, 254, 255),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _adBanner() {
    final List<String> adImages = [
      'https://a.m.dana.id/danaweb/promo/1731043957-WebsiteBanner-GPV-MegaSale-MLBB.png',
      'https://a.m.dana.id/danaweb/promo/1731291934-WebBanner-MA-MidasbuyRevisi-1440x475px.png',
      'https://a.m.dana.id/danaweb/promo/1728031703-WebsiteBanner-BNR-LoyalUsers.png',
      'https://a.m.dana.id/danaweb/promo/1726196652-WebsiteBanner-DANAAgen-General.png',
      'https://a.m.dana.id/danaweb/promo/1731043275-071124-EIS467-DANA_GAMES_PUBG_NOV-Web_Promo-Cover.png',
    ];

    return Container(
      height: 130,
      child: PageView.builder(
        itemCount: null,
        itemBuilder: (context, index) {
          int adIndex = index % adImages.length;
          return _adItem(adImages[adIndex]);
        },
      ),
    );
  }

  Widget _adItem(String imageUrl) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: 120,
          width: double.infinity,
        ),
      ),
    );
  }

Widget _walletLogos() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Top up E-Wallet',
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      SizedBox(height: 10),
      Container(
        height: 300, // Atur tinggi sesuai kebutuhan
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical, // Mengizinkan scroll vertikal
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _logoButton('https://seeklogo.com/images/B/baru-gojek-logo-CEAE385828-seeklogo.com.png'), // Gojek
                  _logoButton('https://seeklogo.com/images/O/ovo-e-wallet-logo-85BBA60317-seeklogo.com.png'), // OVO
                  _logoButton('https://seeklogo.com/images/D/dana-e-wallet-app-logo-F56CE2EEE0-seeklogo.com.png'), // DANA
                  _logoButton('https://images.seeklogo.com/logo-png/36/1/link-aja-logo-png_seeklogo-363129.png?v=638624353520000000'), // LinkAja
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _logoButton('https://seeklogo.com/images/B/baru-gojek-logo-CEAE385828-seeklogo.com.png'), // Gojek
                  _logoButton('https://seeklogo.com/images/O/ovo-e-wallet-logo-85BBA60317-seeklogo.com.png'), // OVO
                  _logoButton('https://seeklogo.com/images/D/dana-e-wallet-app-logo-F56CE2EEE0-seeklogo.com.png'), // DANA
                  _logoButton('https://images.seeklogo.com/logo-png/36/1/link-aja-logo-png_seeklogo-363129.png?v=638624353520000000'), // LinkAja
                ],
              ),
                            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _logoButton('https://seeklogo.com/images/B/baru-gojek-logo-CEAE385828-seeklogo.com.png'), // Gojek
                  _logoButton('https://seeklogo.com/images/O/ovo-e-wallet-logo-85BBA60317-seeklogo.com.png'), // OVO
                  _logoButton('https://seeklogo.com/images/D/dana-e-wallet-app-logo-F56CE2EEE0-seeklogo.com.png'), // DANA
                  _logoButton('https://images.seeklogo.com/logo-png/36/1/link-aja-logo-png_seeklogo-363129.png?v=638624353520000000'), // LinkAja
                ],
              ),
                            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _logoButton('https://seeklogo.com/images/B/baru-gojek-logo-CEAE385828-seeklogo.com.png'), // Gojek
                  _logoButton('https://seeklogo.com/images/O/ovo-e-wallet-logo-85BBA60317-seeklogo.com.png'), // OVO
                  _logoButton('https://seeklogo.com/images/D/dana-e-wallet-app-logo-F56CE2EEE0-seeklogo.com.png'), // DANA
                  _logoButton('https://images.seeklogo.com/logo-png/36/1/link-aja-logo-png_seeklogo-363129.png?v=638624353520000000'), // LinkAja
                ],
              ),
                            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _logoButton('https://seeklogo.com/images/B/baru-gojek-logo-CEAE385828-seeklogo.com.png'), // Gojek
                  _logoButton('https://seeklogo.com/images/O/ovo-e-wallet-logo-85BBA60317-seeklogo.com.png'), // OVO
                  _logoButton('https://seeklogo.com/images/D/dana-e-wallet-app-logo-F56CE2EEE0-seeklogo.com.png'), // DANA
                  _logoButton('https://images.seeklogo.com/logo-png/36/1/link-aja-logo-png_seeklogo-363129.png?v=638624353520000000'), // LinkAja
                ],
              ),
                            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _logoButton('https://seeklogo.com/images/B/baru-gojek-logo-CEAE385828-seeklogo.com.png'), // Gojek
                  _logoButton('https://seeklogo.com/images/O/ovo-e-wallet-logo-85BBA60317-seeklogo.com.png'), // OVO
                  _logoButton('https://seeklogo.com/images/D/dana-e-wallet-app-logo-F56CE2EEE0-seeklogo.com.png'), // DANA
                  _logoButton('https://images.seeklogo.com/logo-png/36/1/link-aja-logo-png_seeklogo-363129.png?v=638624353520000000'), // LinkAja
                ],
              ),
                            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _logoButton('https://seeklogo.com/images/B/baru-gojek-logo-CEAE385828-seeklogo.com.png'), // Gojek
                  _logoButton('https://seeklogo.com/images/O/ovo-e-wallet-logo-85BBA60317-seeklogo.com.png'), // OVO
                  _logoButton('https://seeklogo.com/images/D/dana-e-wallet-app-logo-F56CE2EEE0-seeklogo.com.png'), // DANA
                  _logoButton('https://images.seeklogo.com/logo-png/36/1/link-aja-logo-png_seeklogo-363129.png?v=638624353520000000'), // LinkAja
                ],
              ),
                            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _logoButton('https://seeklogo.com/images/B/baru-gojek-logo-CEAE385828-seeklogo.com.png'), // Gojek
                  _logoButton('https://seeklogo.com/images/O/ovo-e-wallet-logo-85BBA60317-seeklogo.com.png'), // OVO
                  _logoButton('https://seeklogo.com/images/D/dana-e-wallet-app-logo-F56CE2EEE0-seeklogo.com.png'), // DANA
                  _logoButton('https://images.seeklogo.com/logo-png/36/1/link-aja-logo-png_seeklogo-363129.png?v=638624353520000000'), // LinkAja
                ],
              ),
                            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _logoButton('https://seeklogo.com/images/B/baru-gojek-logo-CEAE385828-seeklogo.com.png'), // Gojek
                  _logoButton('https://seeklogo.com/images/O/ovo-e-wallet-logo-85BBA60317-seeklogo.com.png'), // OVO
                  _logoButton('https://seeklogo.com/images/D/dana-e-wallet-app-logo-F56CE2EEE0-seeklogo.com.png'), // DANA
                  _logoButton('https://images.seeklogo.com/logo-png/36/1/link-aja-logo-png_seeklogo-363129.png?v=638624353520000000'), // LinkAja
                ],
              ),
                            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _logoButton('https://seeklogo.com/images/B/baru-gojek-logo-CEAE385828-seeklogo.com.png'), // Gojek
                  _logoButton('https://seeklogo.com/images/O/ovo-e-wallet-logo-85BBA60317-seeklogo.com.png'), // OVO
                  _logoButton('https://seeklogo.com/images/D/dana-e-wallet-app-logo-F56CE2EEE0-seeklogo.com.png'), // DANA
                  _logoButton('https://images.seeklogo.com/logo-png/36/1/link-aja-logo-png_seeklogo-363129.png?v=638624353520000000'), // LinkAja
                ],
              ),
                            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _logoButton('https://seeklogo.com/images/B/baru-gojek-logo-CEAE385828-seeklogo.com.png'), // Gojek
                  _logoButton('https://seeklogo.com/images/O/ovo-e-wallet-logo-85BBA60317-seeklogo.com.png'), // OVO
                  _logoButton('https://seeklogo.com/images/D/dana-e-wallet-app-logo-F56CE2EEE0-seeklogo.com.png'), // DANA
                  _logoButton('https://images.seeklogo.com/logo-png/36/1/link-aja-logo-png_seeklogo-363129.png?v=638624353520000000'), // LinkAja
                ],
              ),
                            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _logoButton('https://seeklogo.com/images/B/baru-gojek-logo-CEAE385828-seeklogo.com.png'), // Gojek
                  _logoButton('https://seeklogo.com/images/O/ovo-e-wallet-logo-85BBA60317-seeklogo.com.png'), // OVO
                  _logoButton('https://seeklogo.com/images/D/dana-e-wallet-app-logo-F56CE2EEE0-seeklogo.com.png'), // DANA
                  _logoButton('https://images.seeklogo.com/logo-png/36/1/link-aja-logo-png_seeklogo-363129.png?v=638624353520000000'), // LinkAja
                ],
              ),
              // Tambahkan lebih banyak Row sesuai kebutuhan
            ],
          ),
        ),
      ),
    ],
  );
}

  Widget _logoButton(String imageUrl) {
    return StatefulBuilder(
      builder: (context, setState) {
        final AnimationController _controller = AnimationController(
          duration: const Duration(milliseconds: 200),
          vsync: TestVSync(),
        );
        final Animation<double> _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);

        return GestureDetector(
          onTapDown: (_) {
            _controller.forward();
          },
          onTapUp: (_) {
            _controller.reverse();
            print('Tombol $imageUrl ditekan');
          },
          onTapCancel: () {
            _controller.reverse();
          },
          child: ScaleTransition(
            scale: _animation,
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  height: 45,
                  width: 45,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// untuk TestVSync
class TestVSync implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
