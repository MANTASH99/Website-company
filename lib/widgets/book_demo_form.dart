import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../theme.dart';

class BookDemoForm extends StatefulWidget {
  const BookDemoForm({super.key});

  @override
  State<BookDemoForm> createState() => _BookDemoFormState();
}

class _BookDemoFormState extends State<BookDemoForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _companyController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _projectController = TextEditingController();
  
  String? _selectedService;
  String? _selectedIndustry;
  bool _isSubmitting = false;

  final List<String> _services = [
    'Data Annotation',
    'AI Application Development',
    'AI Consulting',
    'AI Data Acquisition',
  ];

  final List<String> _industries = [
    'Technology',
    'Healthcare',
    'Finance',
    'Retail',
    'Manufacturing',
    'Education',
    'Transportation',
    'Real Estate',
    'Entertainment',
    'Other',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _companyController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _projectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFormHeader(context),
                  const SizedBox(height: 40),
                  _buildFormFields(context),
                  const SizedBox(height: 40),
                  _buildSubmitButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.calendar_today,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'DEMO REQUEST',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideX(begin: -0.2, end: 0),
        
        const SizedBox(height: 24),
        
        Text(
          'Request Your Personalized Demo',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        )
        .animate()
        .fadeIn(duration: 800.ms, delay: 200.ms)
        .slideY(begin: 0.3, end: 0),
        
        const SizedBox(height: 16),
        
        Text(
          'Fill out the form below and our team will contact you within 24 hours to schedule your personalized demo.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            height: 1.6,
          ),
        )
        .animate()
        .fadeIn(duration: 800.ms, delay: 400.ms)
        .slideY(begin: 0.3, end: 0),
      ],
    );
  }

  Widget _buildFormFields(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    
    return Column(
      children: [
        // Full Name and Company Name Row
        if (isDesktop)
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: _fullNameController,
                  label: 'Full Name *',
                  hint: 'Enter your full name',
                  icon: Icons.person,
                  isRequired: true,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildTextField(
                  controller: _companyController,
                  label: 'Company Name *',
                  hint: 'Enter your company name',
                  icon: Icons.business,
                  isRequired: true,
                ),
              ),
            ],
          )
        else ...[
          _buildTextField(
            controller: _fullNameController,
            label: 'Full Name *',
            hint: 'Enter your full name',
            icon: Icons.person,
            isRequired: true,
          ),
          const SizedBox(height: 24),
          _buildTextField(
            controller: _companyController,
            label: 'Company Name *',
            hint: 'Enter your company name',
            icon: Icons.business,
            isRequired: true,
          ),
        ],
        
        const SizedBox(height: 24),
        
        // Email and Phone Row
        if (isDesktop)
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: _emailController,
                  label: 'Email Address *',
                  hint: 'Enter your email address',
                  icon: Icons.email,
                  isRequired: true,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildTextField(
                  controller: _phoneController,
                  label: 'Phone Number',
                  hint: 'Enter your phone number',
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
              ),
            ],
          )
        else ...[
          _buildTextField(
            controller: _emailController,
            label: 'Email Address *',
            hint: 'Enter your email address',
            icon: Icons.email,
            isRequired: true,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 24),
          _buildTextField(
            controller: _phoneController,
            label: 'Phone Number',
            hint: 'Enter your phone number',
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
          ),
        ],
        
        const SizedBox(height: 24),
        
        // Service and Industry Row
        if (isDesktop)
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  value: _selectedService,
                  label: 'Service of Interest *',
                  hint: 'Select a service',
                  icon: Icons.construction,
                  items: _services,
                  onChanged: (value) => setState(() => _selectedService = value),
                  isRequired: true,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildDropdown(
                  value: _selectedIndustry,
                  label: 'Industry',
                  hint: 'Select your industry',
                  icon: Icons.domain,
                  items: _industries,
                  onChanged: (value) => setState(() => _selectedIndustry = value),
                ),
              ),
            ],
          )
        else ...[
          _buildDropdown(
            value: _selectedService,
            label: 'Service of Interest *',
            hint: 'Select a service',
            icon: Icons.construction,
            items: _services,
            onChanged: (value) => setState(() => _selectedService = value),
            isRequired: true,
          ),
          const SizedBox(height: 24),
          _buildDropdown(
            value: _selectedIndustry,
            label: 'Industry',
            hint: 'Select your industry',
            icon: Icons.domain,
            items: _industries,
            onChanged: (value) => setState(() => _selectedIndustry = value),
          ),
        ],
        
        const SizedBox(height: 24),
        
        // Project Description
        _buildTextField(
          controller: _projectController,
          label: 'Tell us about your project and requirements *',
          hint: 'Describe your project, goals, and specific requirements...',
          icon: Icons.description,
          isRequired: true,
          maxLines: 5,
        ),
      ]
      .asMap()
      .entries
      .map((entry) => entry.value
          .animate()
          .fadeIn(duration: 600.ms, delay: Duration(milliseconds: 600 + (entry.key * 100)))
          .slideY(begin: 0.3, end: 0))
      .toList(),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isRequired = false,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
              size: 20,
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 1,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: maxLines > 1 ? 16 : 12,
            ),
          ),
          validator: isRequired
              ? (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  if (keyboardType == TextInputType.emailAddress) {
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                  }
                  return null;
                }
              : null,
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String label,
    required String hint,
    required IconData icon,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
              size: 20,
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          validator: isRequired
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option';
                  }
                  return null;
                }
              : null,
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: _isSubmitting ? null : _handleSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        icon: _isSubmitting
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              )
            : Icon(
                Icons.send,
                size: 20,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        label: Text(
          _isSubmitting ? 'Submitting...' : 'Request Demo',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    )
    .animate()
    .fadeIn(duration: 600.ms, delay: 1000.ms)
    .slideY(begin: 0.3, end: 0)
    .shimmer(duration: 2000.ms, delay: 1500.ms);
  }

  void _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSubmitting = true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isSubmitting = false);

    if (mounted) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Demo request submitted successfully! We\'ll contact you within 24 hours.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(seconds: 4),
        ),
      );

      // Clear form
      _formKey.currentState!.reset();
      _fullNameController.clear();
      _companyController.clear();
      _emailController.clear();
      _phoneController.clear();
      _projectController.clear();
      setState(() {
        _selectedService = null;
        _selectedIndustry = null;
      });
    }
  }
}