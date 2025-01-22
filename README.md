Route E-Commerce App Documentation
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

The project follows a modular structure for better scalability and maintainability:

lib/

├── api/ # API-related utilities and services

├── utils/ # Common utilities and helpers

├── widgets/ # Reusable UI components

├── data/ # Data sources

│ ├── models/ # Data models

│ └── repo/ # Repository classes for data handling

├── domain/ # Business logic

│ ├── entities/ # Core entities

│ └── useCases/ # Application use cases

├── presentation/ # UI layer

│ ├── auth/ # Authentication screens

│ ├── cart/ # Cart screens
