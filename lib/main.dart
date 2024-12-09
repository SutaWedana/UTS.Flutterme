import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Hobby.dart'; // Import halaman untuk menampilkan gambar hobby
import 'Gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              'Home',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              // Tombol Tambah Data Daftar Pengunjung
              IconButton(
                icon: const Icon(Icons.person_add, color: Colors.blue),
                tooltip: 'Tambah Data Pengunjung',
                onPressed: () {
                  _showAddVisitorDialog(context);
                },
              ),
              // Tombol Catatan
              IconButton(
                icon: const Icon(Icons.note, color: Colors.green),
                tooltip: 'Catatan',
                onPressed: () {
                  _showNotesDialog(context);
                },
              ),
              // Menu Drawer
              Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  );
                },
              ),
            ],
          ),
            endDrawer: _buildDrawer(context),
            body: SingleChildScrollView( // Wrap the entire body with SingleChildScrollView to make it scrollable
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/B.jpg'), // Replace with your background image
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [   
                      const SizedBox(height: 20),
                      const AnimatedLogo(),
                      const SizedBox(height: 20),
                      _buildIntroduction(),
                      const SizedBox(height: 20),
                      const SkillsSection(),
                      const SizedBox(height: 20),
                      const HobbiesSection(), // Add hobbies section here
                      const SizedBox(height: 20),
                      _buildContactButtons(context),
                      const SizedBox(height: 20),
                      
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


// Fungsi untuk menampilkan dialog tambah data pengunjung
void _showAddVisitorDialog(BuildContext context) {
  final nameController = TextEditingController();
  final contactController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Tambah Data Pengunjung'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nama Pengunjung'),
              ),
              TextField(
                controller: contactController,
                decoration: const InputDecoration(labelText: 'Kontak Pengunjung'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              final name = nameController.text;
              final contact = contactController.text;

              // Simpan data pengunjung (bisa ke list atau database)
              print('Nama: $name, Kontak: $contact');

              Navigator.pop(context);
            },
            child: const Text('Simpan'),
          ),
        ],
      );
    },
  );
}

// Fungsi untuk menampilkan dialog catatan
void _showNotesDialog(BuildContext context) {
  final notesController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Catatan'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: notesController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Catatan',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              final note = notesController.text;

              // Simpan catatan (bisa ke list atau database)
              print('Catatan: $note');

              Navigator.pop(context);
            },
            child: const Text('Simpan'),
          ),
        ],
      );
    },
  );
}


// Drawer content with social media links
Widget _buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text('I NENGAH SUTA WEDANA'),
          accountEmail: const Text('sutawedana@gmail.com'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                'assets/PP.jpg',
                fit: BoxFit.cover,
                width: 90,
              ),
            ),
          ),
          decoration: const BoxDecoration(
            color: Colors.cyan,
            image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.jpg'), // Ganti dengan path gambar lokal
              ),
            ),
          ),

_buildDrawerItem(Icons.home_filled, 'Home', context, () {
  Navigator.pop(context);
}, color: Colors.blue),
_buildDrawerItem(FontAwesomeIcons.whatsapp, 'WhatsApp', context, () async {
  await _launchUrl('https://wa.me/6285319091245?text=Hello', context);
}, color: Colors.green),
_buildDrawerItem(FontAwesomeIcons.instagram, 'Instagram', context, () async {
  await _launchUrl('https://www.instagram.com/sutawedana_/', context);
}, color: Colors.pinkAccent),
_buildDrawerItem(FontAwesomeIcons.facebookF, 'Facebook', context, () async {
  await _launchUrl('https://web.facebook.com/ehh.suta/', context);
}, color: Colors.blueAccent),
_buildDrawerItem(Icons.photo_album_rounded, 'Gallery', context, () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const GalleryPage()), // Navigate to the GalleryPage
  );
}, color: Colors.orangeAccent),
const Divider(),
_buildDrawerItem(Icons.logout_rounded, 'Logout', context, () {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Logout'),
      content: const Text('Apakah anda yakin ingin keluar?'),
      actions: [
        TextButton(
          child: const Text('Batal'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Keluar', style: TextStyle(color: Colors.red)),
          onPressed: () {
            SystemNavigator.pop();
            },
              ),
            ],
          ),
        );
      }, color: Colors.redAccent),
      ],
    ),
  );
}


// Helper for creating Drawer items
Widget _buildDrawerItem(IconData icon, String title, BuildContext context, Function onTap, {Color? color}) {
  return InkWell(
    onTap: () => onTap(),
    splashColor: Colors.grey.withOpacity(0.3), // Efek splash
    highlightColor: Colors.grey.withOpacity(0.1), // Efek highlight
    borderRadius: BorderRadius.circular(8), // Membuat sudut efek menjadi melengkung
    child: ListTile(
      leading: Icon(icon, color: color ?? Colors.grey),
      title: Text(title),
    ),
  );
}


// Launch URL helper
Future<void> _launchUrl(String url, BuildContext context) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Unable to open $url')),
    );
  }
}

// Introduction Section
Widget _buildIntroduction() {
  return Column(
    children: [
      Text(
        'I NENGAH SUTA WEDANA',
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      const SizedBox(height: 10),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Text(
          'Mobile App Development, eager to learn and grow!',
          style: TextStyle(
            fontSize: 17,
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 202, 198, 198),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            """Hello, my name is I Nengah Suta Wedana, 
or commonly called Suta. I am an Informatics Engineering student at ITB - Stikom Ambon. Currently, I am focusing on graphic design, photography, editing, and my major.""",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    ],
  );
}

// Contact Buttons (Email, Call)
Widget _buildContactButtons(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,  // Center the buttons horizontally
    mainAxisSize: MainAxisSize.min,  // Minimize the space taken by the Row
    children: [
      ElevatedButton.icon(
        onPressed: () async {
          await _launchUrl('mailto:sutawedana9@gmail.com', context);
        },
        icon: const Icon(Icons.email),
        label: const Text('Email Me'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan,
        ),
      ),
      const SizedBox(width: 10),  // Add space between the buttons
      ElevatedButton.icon(
        onPressed: () async {
          await _launchUrl('tel:+6285319091245', context);
        },
        icon: const Icon(Icons.phone),
        label: const Text('Call Me'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan,
        ),
      ),
    ],
  );
}

// Animated Logo
class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  bool isZoomed = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        isZoomed = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      height: isZoomed ? 150 : 100,
      width: isZoomed ? 150 : 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [
            Colors.cyan,
            Colors.blue,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: ClipOval( // Wrap the "S" in ClipOval to make it circular
          child: Image.asset(
            'assets/PP.jpg', // Replace with your image file
            fit: BoxFit.cover,
            width: 145,
            height: 145,
          ),
        ),
      ),
    );
  }
}


// Skills Section
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills & Interests',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              _SkillChip('Mobile App Development',10 ), // 10% skill
              _SkillChip('Graphic Design', 70 ), // 80% skill
              _SkillChip('Photography', 75), // 50% skill
              _SkillChip('Editing', 50), // 75% skill
              _SkillChip('Web Development', 10), // 10% skill
            ],
          ),
        ],
      ),
    );
  }
}

// Skill Chip Widget
class _SkillChip extends StatefulWidget {
  final String skill;
  final int skillPercentage;

  const _SkillChip(this.skill, this.skillPercentage);

  @override
  _SkillChipState createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _isTapped = false; // Flag to check if the chip was tapped

  Color _getBackgroundColor() {
    // Determine the color based on skill percentage
    if (widget.skillPercentage >= 80) {
      return Colors.green; // High skill - Green
    } else if (widget.skillPercentage >= 60) {
      return Colors.blue; // Medium skill - Blue
    } else if (widget.skillPercentage >= 40) {
      return Colors.orange; // Low skill - Orange
    } else {
      return Colors.red; // Very low skill - Red
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped; // Toggle tapped state
        });
      },
      child: Chip(
        label: Text(
          _isTapped ? '${widget.skill} - ${widget.skillPercentage}%' : widget.skill,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: _getBackgroundColor(),
      ),
    );
  }
}

class HobbiesSection extends StatelessWidget {
  const HobbiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hobbies',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Photography Icon with Hover and Tap Effects
              _HobbyIcon(
                icon: FontAwesomeIcons.camera,
                hobbyName: 'Photography',
                color: Color.fromARGB(255, 10, 255, 22),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const HobbyImagesPage(hobby: 'Photography'),
                    ),
                  );
                },
              ),
              const SizedBox(width: 20),
              // Design Icon (For logo creation/design hobby)
              _HobbyIcon(
                icon: FontAwesomeIcons.paintBrush,
                hobbyName: '  Editing ',
                color: Color.fromARGB(255, 57, 237, 7),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const HobbyImagesPage(hobby: 'Editing'),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Widget for Hobby Icon with Tap and Hover Effects
class _HobbyIcon extends StatefulWidget {
  final IconData icon;
  final String hobbyName;
  final Color color;
  final VoidCallback onTap;

  const _HobbyIcon({
    required this.icon,
    required this.hobbyName,
    required this.color,
    required this.onTap,
  });

  @override
  _HobbyIconState createState() => _HobbyIconState();
}

class _HobbyIconState extends State<_HobbyIcon> {
  bool _isHovered = false; // Track hover state

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true;
      }),
      onExit: (_) => setState(() {
        _isHovered = false;
      }),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(50),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: _isHovered
                ? RadialGradient(
                    colors: [
                      widget.color.withOpacity(0.6),
                      widget.color.withOpacity(0.2),
                      Colors.transparent
                    ],
                    radius: 1.5,
                  )
                : null,
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: widget.color.withOpacity(0.6),
                      spreadRadius: 10,
                      blurRadius: 15,
                    ),
                  ]
                : [],
          ),
          child: Column(
            children: [
              Icon(
                widget.icon,
                color: widget.color,
                size: 40,
              ),
              const SizedBox(height: 8),
              Text(
                widget.hobbyName,
                style: TextStyle(
                  color: widget.color,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
