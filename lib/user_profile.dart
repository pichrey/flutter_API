import 'package:flutter/material.dart';

class CVScreen extends StatefulWidget {
  const CVScreen({super.key});

  @override
  State<CVScreen> createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('MY CV',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,

          ),),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Header Section
            Container(
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/logo.jpg'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'PICH REY',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Applying for: Programming',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Body Content in Two Columns
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Column
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSectionTitle('CONTACT'),
                        buildContactInfo(Icons.phone, '088 901 8167'),
                        buildContactInfo(Icons.email, 'pichriy72@gmail.com'),
                        buildContactInfo(Icons.location_on, 'Khan Sen Sok in PP'),
                        buildContactInfo(Icons.web, 'www.reallygreatsite.com'),

                        const SizedBox(height: 16),
                        buildSectionTitle('SKILLS'),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: const [
                            Chip(label: Text('Web Development')),
                            Chip(label: Text('HTML, CSS, JavaScript')),
                            Chip(label: Text('PHP / Laravel')),
                            Chip(label: Text('Java Spring Boot')),
                            Chip(label: Text('Python Flask')),
                            Chip(label: Text('Mobile App')),
                            Chip(label: Text('Database')),
                            Chip(label: Text('Oracle / SQL Server / MySQL / PostgreSQL')),
                          ],
                        ),

                        const SizedBox(height: 16),
                        buildSectionTitle('LANGUAGES'),
                        const Text('English: Listening, Reading'),
                        const Text('Khmer: Mother Language'),
                      ],
                    ),
                  ),

                  const SizedBox(width: 16),
                  // Right Column
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSectionTitle('PROFESSIONAL INFORMATION'),
                        const Text('Name: PICH REY'),
                        const Text('Sex: Male'),
                        const Text('Marital Status: Single'),
                        const Text('Address: Pratheat commune, Kampong Trabek district, Prey Veng province'),

                        const SizedBox(height: 16),
                        buildSectionTitle('WORK EXPERIENCE'),
                        buildExperienceEntry(
                          title: 'Borey Lim Cheahnghak',
                          position: 'IT Support - 1 year',
                          description:
                          'Supported IT operations at Borey Lim Cheahnghak, gained experience in technical support and issue resolution.',
                        ),
                        buildExperienceEntry(
                          title: 'Programming',
                          position: '',
                          description: 'School project experience with software development.',
                        ),

                        const SizedBox(height: 16),
                        buildSectionTitle('EDUCATION'),
                        buildEducationEntry(
                          title: 'High School',
                          duration: '2019 - 2021',
                          description: 'Learned at Pratheat High School.',
                        ),
                        buildEducationEntry(
                          title: 'Management Information System',
                          duration: '2021 - 2024',
                          description:
                          'Bachelor of Management Information Systems at SETEC with a focus on Website and Graphic Design.',
                        ),

                        const SizedBox(height: 16),
                        buildSectionTitle('REFERENCES'),
                        buildReferenceEntry(
                          name: 'CHOEURN PINCHHAI',
                          role: 'Software Engineer',
                          phone: '099774967',
                          email: 'pinchai.pc@gmail.com',
                        ),
                        buildReferenceEntry(
                          name: 'ROEURN RAKSMEY',
                          role: 'Database Specialist',
                          phone: '068847180',
                          email: 'roeurnraksney1611@gmail.com',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[900]),
      ),
    );
  }

  Widget buildContactInfo(IconData icon, String info) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[900]),
      title: Text(info),
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }

  Widget buildExperienceEntry({required String title, required String position, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (position.isNotEmpty)
            Text(
              position,
              style: TextStyle(color: Colors.grey[600]),
            ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget buildEducationEntry({required String title, required String duration, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (duration.isNotEmpty)
            Text(
              duration,
              style: TextStyle(color: Colors.grey[600]),
            ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget buildReferenceEntry({required String name, required String role, required String phone, required String email}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            role,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 4),
          Text('Tel: $phone'),
          Text('Email: $email'),
        ],
      ),
    );
  }
}
