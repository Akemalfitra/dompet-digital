import 'package:dptdgtl/screens/login/login.dart';
import 'package:flutter/material.dart';
//import 'package:dptdgtl/screens/login/login.dart'; // Ganti dengan path yang benar ke file login.dart Anda

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key}); // Constructor sudah const

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: screenHeight, // Tinggi layar penuh
        decoration: const BoxDecoration(
          color: Color(0xFF19173D), // Warna latar belakang
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.15), // Tidak bisa const karena dinamis
              child: const Text(
                'E-Wallet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Aclonica',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Spacer(), // Menambahkan const
            const Column(
              children: [
                Text(
                  'Solusi Cerdas Finansial',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'ADLamDisplay',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5), // Menambahkan const
                Text(
                  'Nikmati berbagai layanan finansial dan kemudahan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20), // Menambahkan const
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: screenHeight * 0.05), // Tidak bisa const karena dinamis
              child: MouseRegion(
                cursor: SystemMouseCursors.click, // Mengubah cursor menjadi tangan
                child: GestureDetector(
                  onTap: () {
                    debugPrint("Tombol Lanjutkan diklik");
                    // Navigasi ke halaman login
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()), // Pastikan ini sesuai dengan nama widget di login.dart
                    );
                  },
                  child: Container(
                    width: screenWidth * 0.8, // Tidak bisa const karena dinamis
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D7BC4), // Menambahkan const
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: const Center(
                      child: Text(
                        'Lanjutkan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Pastikan LoginScreen didefinisikan di login.dart
