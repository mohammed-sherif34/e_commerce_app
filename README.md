Route E-Commerce App 
==================================

Overview
--------

The **Route E-Commerce App** is a fully-featured mobile application built with **Flutter**, designed to provide users with a seamless shopping experience. The app incorporates essential e-commerce functionalities such as user authentication, product browsing, cart management, and payment integration using Stripe. It is developed following **clean architecture** principles and uses **Cubit** for state management.

Features
--------

### Authentication

*   **Login** and **Sign Up** using email and password.
    

### Tabs

1.  **Home Tab**:
    
    *   Displays product categories and brands.
        
2.  **Products Tab**:
    
    *   Shows all available products.
        
3.  **Favourite Tab**:
    
    *   Lists products marked as favourites by the user.
        
4.  **Profile Tab**:
    
    *   Displays user details (name, email, address).
        
    *   Option to log out.
        

### Cart & Payment

*   **Cart Management**: Add, remove, and manage items in the cart.
    
*   **Payment Integration**:
    
    *   Supports **Stripe** for credit card payments.
        
    *   Includes **PayPal** payment option.
        

Folder Structure

The project follows a Clean Arcitucture structure for better scalability and maintainability:


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
