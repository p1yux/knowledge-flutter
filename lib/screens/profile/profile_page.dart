import 'package:flutter/material.dart';
import '../../components/forms/auth/custom_input_field.dart';
import '../../components/switch/switch.dart';
import '../../components/checkbox/radio.dart';
import '../../components/buttons/yellow_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const String route = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  String? _selectedPronoun;
  String _selectedLanguage = 'English';
  bool _isDarkMode = false;
  File? _imageFile;

  final List<String> _pronouns = [
    'He/Him',
    'She/Her',
    'They/Them',
    'Prefer not to say',
  ];

  final List<String> _languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese',
    'Arabic',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildProfileImage(),
            const SizedBox(height: 30),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Personal Information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3A8A),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(
                      placeholder: 'Full Name',
                      controller: _nameController,
                    ),
                    const SizedBox(height: 20),
                    _buildLanguageSelector(),
                    const SizedBox(height: 20),
                    _buildPronounSelector(),
                    const SizedBox(height: 20),
                    CustomInputField(
                      placeholder: 'Location (Optional)',
                      controller: _locationController,
                    ),
                    const SizedBox(height: 20),
                    CustomSwitch(
                      value: _isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          _isDarkMode = value;
                        });
                      },
                      label: 'Dark Mode',
                    ),
                    const SizedBox(height: 30),
                    YellowButton(
                      text: 'Save Changes',
                      onPressed: () {
                        // Handle save changes
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return GestureDetector(
      onTap: _pickImage,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            backgroundImage: _imageFile != null
                ? FileImage(_imageFile!)
                : const NetworkImage(
                    'https://picsum.photos/seed/profile/200/200',
                  ) as ImageProvider,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Color(0xFFD9F99D),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Color(0xFF1E3A8A),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Preferred Language',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1E3A8A),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: _selectedLanguage,
            isExpanded: true,
            underline: const SizedBox(),
            items: _languages.map((String language) {
              return DropdownMenuItem<String>(
                value: language,
                child: Text(language),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedLanguage = newValue;
                });
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPronounSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pronouns (Optional)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1E3A8A),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: _pronouns.map((pronoun) {
            return CustomRadio<String>(
              value: pronoun,
              groupValue: _selectedPronoun,
              onChanged: (value) {
                setState(() {
                  _selectedPronoun = value;
                });
              },
              label: pronoun,
            );
          }).toList(),
        ),
      ],
    );
  }
}
