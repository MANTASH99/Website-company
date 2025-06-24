class ServiceModel {
  final String title;
  final String description;
  final String icon;
  final List<String> features;
  final bool isPrimary;
  final bool isPreview;

  const ServiceModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.features,
    this.isPrimary = false,
    this.isPreview = false,
  });
}

class ProductModel {
  final String name;
  final String description;
  final String imageUrl;
  final List<String> keyPoints;

  const ProductModel({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.keyPoints,
  });
}

class ServiceData {
  static List<ServiceModel> getServices() {
    return [
      const ServiceModel(
        title: 'Data Labeling',
        description: 'Professional data annotation and labeling services for training high-quality AI models across multiple data types.',
        icon: 'dataset',
        isPrimary: true,
        features: [
          'Text Annotation & Classification',
          'Image Segmentation & Object Detection',
          'Geospatial Data Mapping',
          'Video Analysis & Tagging',
        ],
      ),
      const ServiceModel(
        title: 'AI Applications',
        description: 'Custom AI-powered mobile and desktop applications tailored to your business needs.',
        icon: 'phone_android',
        features: [
          'Mobile App Development',
          'Desktop Applications',
          'Cross-Platform Solutions',
          'AI Integration & Optimization',
        ],
      ),
      const ServiceModel(
        title: 'AI Services & Consulting',
        description: 'Strategic AI consulting and implementation services to transform your business processes.',
        icon: 'psychology',
        features: [
          'AI Strategy Development',
          'Technology Assessment',
          'Implementation Planning',
          'Performance Optimization',
        ],
      ),
      const ServiceModel(
        title: 'Data Acquisition & Generation',
        description: 'Comprehensive data collection and synthetic data generation services for AI training.',
        icon: 'cloud_download',
        features: [
          'Data Collection & Sourcing',
          'Synthetic Data Generation',
          'Data Quality Assurance',
          'Custom Dataset Creation',
        ],
      ),
    ];
  }

  static ProductModel getFindRosiProduct() {
    return const ProductModel(
      name: 'Find Rosi',
      description: 'A social media app showcasing smart AI integration with advanced features for community building and content discovery.',
      imageUrl: 'https://images.unsplash.com/photo-1611224923853-80b023f02d71?w=400&h=400&fit=crop',
      keyPoints: [
        'Mobile-First Design',
        'Web Platform Ready',
        'Smart AI Implementation',
      ],
    );
  }
}