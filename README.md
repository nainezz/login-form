# 🛒 Abda: Shopping App (Flutter + Fake Store API)

**Abda** is a shopping app built with **Flutter**. It starts with an onboarding screen and login and sign-up forms, then loads real product data from the [Fake Store API](https://fakestoreapi.com) with search, categories, product details and a cart.

> The repository is named `login-form` because the project started as a login screen and grew into a full shopping app.

## Features

- **Intro / onboarding screen** with a background image, gradient overlay and a "Get Started" button.
- **Login and registration forms** for full name, email, phone and password.
- **Home screen** with a search bar, an image carousel (`carousel_slider`) and a product grid loaded from the API.
- **Categories.** Browse products by category, for example electronics and jewelery.
- **Product details** with image, title, price and description.
- **Cart** managed with Provider, plus a badge showing the item count.
- **Profile screen** with personal data, settings and FAQs.
- **Bottom navigation** between Home, Cart and Profile.

## Tech stack

| | |
|---|---|
| Framework | Flutter (Dart) |
| State management | Provider (`CartProvider`) |
| Networking | `http` with the Fake Store REST API |
| UI packages | `carousel_slider`, `badges`, `flutter_svg`, `one_ui` |

## API endpoints used

| Data | Endpoint |
|---|---|
| All products | `GET /products` |
| Single product | `GET /products/:id` |
| Categories | `GET /products/categories` |
| Products in a category | `GET /products/category/:name` |

## Project structure

```
lib/
├── main.dart        # App entry and providers
├── model/           # ProductModel, categoryModel
├── procciders/      # CartProvider
├── screen/          # intro, login, registration, home, category, details, cart, profile
└── widgets/         # Product card
```

## Getting started

```bash
git clone https://github.com/nainezz/login-form.git
cd login-form
flutter pub get
flutter run
```

Requires Dart `>=2.17.6 <3.0.0`.

## Author

**Nainezz**, a software engineer in Nairobi, Kenya · [GitHub](https://github.com/nainezz)
