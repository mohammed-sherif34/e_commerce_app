
Route E-Commerce App
====================

Overview
--------

The **Route E-Commerce App** is a comprehensive mobile application built using **Flutter**. It offers a smooth and user-friendly shopping experience by incorporating key e-commerce features like user authentication, product browsing, cart management, and payment processing with **Stripe**. The app adheres to **clean architecture principles** and employs **Cubit** for efficient state management.

📱 Features
-----------

### Splash Screen

Displays the app logo while the application initializes.

### Home Tab

*   Showcases product categories and brands.
    

### Products Tab

*   Lists all available products in the app.
    

### Favourite Tab

*   Displays a list of products marked as favourites by the user.
    

### Profile Tab

*   Displays user details, including:
    
    *   Name
        
    *   Email
        
    *   Address
        
*   Includes an option to log out.
    

### Cart Management

*   Add, remove, and manage items in the shopping cart.
    

### Payment Integration

*   **Stripe:** Enables secure credit card payments.
    
*   **PayPal:** Offers an additional payment option.
    

🛠 Technologies and Patterns
----------------------------

### 1\. Clean Architecture

*   **Core Layer:** Contains common utilities and configurations used across the app.
    
*   **Data Layer:** Responsible for API calls, data sources, and repositories.
    
*   **Domain Layer:** Manages business logic, entities, and use cases.
    
*   **Presentation Layer:** Handles UI components and state management.
    

### 2\. State Management with Cubit

*   **Cubit:** Used for predictable and reactive state updates across the app.
    

🖼 Screens Overview
-------------------

### 1\. Splash Screen

Displays the app logo while resources and configurations are initialized.

### 2\. Home Tab

Allows users to explore product categories and featured brands.

### 3\. Products Tab

Presents a detailed list of all available products.

### 4\. Favourite Tab

Shows products marked as favourites by the user for quick access.

### 5\. Profile Tab

Enables users to view and update their profile information.

### 6\. Cart and Payment

*   Manage items in the cart.
    
*   Proceed to checkout and complete payments via Stripe or PayPal.
    

🌐 Localization
---------------

Localization setup is managed in the l10n/ folder. Steps to add support for new languages:

1.  Add new language files in l10n/.
    
2.  Update supported locales in MaterialApp.
    

🖌 Theming
----------

Themes and colors are configured in the core/ folder:

*   **app\_theme.dart:** Manages light and dark theme configurations.
    
*   **color\_manager.dart:** Defines the app's color palette.
    

📖 Dependencies
---------------

Key dependencies used in this project:

*   **flutter\_bloc:** For state management with Cubit.
    
*   **stripe\_payment:** For secure payment processing.
    
*   **flutter\_localizations:** For multi-language support.
    
*   **dio:** For making API requests.
    

🗂 Folder Structure
-------------------

The project is organized as follows:

```text
lib/
├── core/
│   ├── api/                        # API-related utilities
│   ├── di/                         # Dependency Injection setup
│   ├── failures/                   # Error handling utilities
│   ├── app_theme.dart              # Application theme configuration
│   ├── assets_manager.dart         # Asset paths management
│   ├── color_manager.dart          # Color palette management
│   ├── constant_double_values.dart # Constants for double values
│   ├── font_manager.dart           # Font style and size management
│   └── snackbar_utils.dart         # Snackbar utility functions
├── data/
│   ├── models/                     # Models for the application
│   └── Ds/                         # data sources follow reposatoris pattern
    └── repo/                       # implementation for domain repos
|___ domain/                        # Business logic
    ├── entities/                   #Core entities
│   └── useCases/                   # Application use cases
    └── repo/                       # Repository classes for data handling
├── presentation/
│   ├── cubit/                      # State management (Cubit and states)
│   ├── view/                       # UI components
│   └── widgets/                    # Reusable UI components
└── main.dart                       # Entry point of the application
```
