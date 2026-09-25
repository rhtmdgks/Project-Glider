# Glider

**Glider** is a Flutter-based, voice-first AI shopping assistant designed to simplify product discovery, comparison, and purchasing through conversational interactions.

The mobile application serves as the client experience for the Glider platform, focusing on an accessible and low-friction shopping flow across iOS and Android.

## Overview

Traditional shopping apps require users to repeatedly search, filter, compare, and navigate through complex interfaces.

Glider approaches commerce as a conversational workflow.

Instead of relying only on conventional search and navigation, users can interact with the shopping experience through natural language and voice-oriented interfaces, allowing the system to guide them through product discovery and purchase-related tasks.

The project is designed around three principles:

* **Conversational Commerce** — shopping through dialogue rather than complex navigation
* **Accessibility** — reducing interaction complexity for users who benefit from simplified interfaces
* **Mobile-First Experience** — providing a focused shopping flow optimized for smartphones

## Core Features

### AI Shopping Experience

Glider is designed to support conversational shopping workflows such as:

* product discovery
* product recommendation
* purchase intent clarification
* product option selection
* comparison
* order preparation
* purchase confirmation

The goal is to reduce the number of manual steps required between expressing a need and completing a shopping task.

### Voice-First Interaction

The product is designed around voice-oriented interaction.

Typical use cases include:

```text
"휴지 하나 주문해줘."

"지난번에 샀던 세제로 다시 주문해줘."

"배송 빠른 생수 찾아줘."

"부모님이 쓰기 쉬운 전기포트 추천해줘."
```

This interaction model is intended to make shopping more natural for users who may find conventional e-commerce interfaces unnecessarily complex.

### Guided Shopping Flow

Glider can present structured shopping steps after the user's intent is understood.

A conceptual flow:

```text
User Request
    │
    ▼
Intent Understanding
    │
    ▼
Product Discovery
    │
    ▼
Product / Option Selection
    │
    ▼
Order Review
    │
    ▼
Purchase Confirmation
```

### Mobile Shopping UI

The Flutter client provides the user-facing mobile experience for:

* product exploration
* conversational shopping
* order-related screens
* account and preference interfaces
* purchase workflows
* delivery-related information

## Platform Architecture

Glider is divided into separate mobile and web/backend-oriented repositories.

```text
┌──────────────────────────────┐
│        Glider Mobile         │
│       Flutter / Dart         │
│                              │
│  Voice & Shopping Interface  │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│         Glider Web           │
│     Next.js / TypeScript     │
│                              │
│ AI Agent / Products / Orders │
│ Payments / Delivery / User   │
└──────────────┬───────────────┘
               │
               ▼
       Commerce Data Layer
```

This repository contains the **mobile client**.

## Tech Stack

| Area          | Technology                     |
| ------------- | ------------------------------ |
| Framework     | Flutter                        |
| Language      | Dart                           |
| Routing       | GoRouter                       |
| UI            | Material 3                     |
| Typography    | Paperlogy                      |
| Platforms     | iOS / Android                  |
| Design Assets | Stitch-generated design assets |

## Project Structure

```text
lib/
├── assets/        # Application fonts and bundled assets
├── layout/        # Shared application layouts
├── router/        # Navigation and route configuration
├── screens/       # Main application screens
├── stitch/        # Stitch-derived UI implementation
├── theme/         # Colors and application theme
├── widgets/       # Shared widgets
└── main.dart

assets/
├── stitch/        # Exported design assets
└── images/        # Product and shopping images

android/
ios/
web/
```

## Design System

Glider uses a custom visual system based on:

* Material 3
* Paperlogy typography
* a blue-centered brand color system
* Stitch-generated interface references
* simplified mobile layouts

The application theme is configured through Flutter's `ThemeData` and custom color definitions.

## Navigation

Navigation is handled with `GoRouter`.

The main application entry point uses:

```dart
MaterialApp.router(
  title: '글라이더',
  routerConfig: appRouter,
)
```

This allows screens and shopping workflows to be organized as route-based experiences.

## Getting Started

### Prerequisites

Install:

* Flutter SDK
* Dart SDK
* Android Studio / Android SDK
* Xcode for iOS development

Verify your environment:

```bash
flutter doctor
```

### Install Dependencies

```bash
flutter pub get
```

### Run

```bash
flutter run
```

Choose a connected device or emulator when prompted.

## Build

### Android

```bash
flutter build apk
```

or:

```bash
flutter build appbundle
```

### iOS

```bash
flutter build ios
```

An Apple development environment and signing configuration are required for iOS builds.

## Related Repository

The Glider platform also includes a separate web application that handles AI-assisted shopping workflows and commerce-related backend functionality.

The web platform includes features such as:

* AI assistant interaction
* conversational product discovery
* user preferences
* product data
* virtual ordering
* payment flow
* delivery tracking
* accessibility settings

The corresponding repository is intended to be maintained separately as:

```text
glider-web
```

## Accessibility Direction

Glider is designed with accessibility and interaction simplicity as important product considerations.

The broader platform architecture supports concepts such as:

* voice feedback
* simplified interaction modes
* large text
* high contrast
* reduced navigation complexity

These capabilities can be integrated into the mobile client as the product evolves.

## Product Direction

Glider is intended to evolve from a conventional shopping client into an **AI shopping agent** capable of handling increasingly complete commerce workflows.

Potential directions include:

### Conversational Product Discovery

Users describe what they need instead of manually searching through categories.

### Personalized Recommendations

Recommendations can consider:

* prior purchases
* user preferences
* price range
* brand preferences
* delivery requirements
* accessibility needs

### Reordering

Users can quickly reorder previously purchased products through natural language.

### Voice Commerce

Shopping flows can increasingly be completed through voice-oriented interaction rather than touch-heavy interfaces.

### Agentic Purchasing

The long-term architecture can support an agent that assists with:

```text
Search
→ Compare
→ Select
→ Configure
→ Order
→ Pay
→ Track
```

while still maintaining appropriate user confirmation for important actions.

## Development Status

Glider is under active development.

The current repository contains the core Flutter mobile shell, routing, design system, screens, and interface assets required to develop the mobile shopping experience.

## Project

**Glider**
A voice-first AI shopping assistant for simpler, more accessible conversational commerce.
