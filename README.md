# Mobile CBT Application

## Overview

This project is a mobile-based Computer-Based Testing (CBT) application developed using Flutter. The app facilitates online examinations, providing a more accessible, cost-effective, and user-friendly alternative to traditional CBT systems. It integrates various security measures, such as biometric authentication and lockdown modes, to prevent cheating and ensure exam integrity. Firebase is used as the backend to manage user data, authentication, and real-time exam activities.

## Background

Computer-Based Tests (CBT) have become a crucial part of educational assessment systems, offering a flexible and efficient method of evaluating students' knowledge. The rise of mobile-based CBT platforms allows students to take exams from anywhere at their convenience, helping to overcome logistical challenges like computer lab limitations and long queues during traditional exams.

This mobile application is designed to address the challenges of CBT systems by providing a mobile-friendly solution with features that improve accessibility, security, and the overall exam experience.

## Problem Statement

Traditional CBT systems face several challenges:
- High setup costs (for computer labs, software, and infrastructure)
- Long wait times and logistical issues due to limited computer lab availability
- Vulnerabilities to cheating and malpractice in exam settings

This mobile CBT application aims to solve these issues by:
- Enabling students to take exams on their personal mobile devices
- Providing enhanced security features to minimize cheating
- Offering real-time feedback and multimedia integration to enhance the learning experience

## Features

- **User Authentication**: Secure login via Firebase Authentication, with options for biometric authentication (fingerprint/face recognition) and two-factor authentication (2FA).
- **Exam Integrity**: Lockdown mode that restricts access to other apps during the exam. Question shuffling ensures a unique experience for every user.
- **Real-Time Feedback**: Immediate feedback on answers after the completion of the exam.
- **Cross-Platform Support**: Supports both Android and iOS devices for a broader reach.
- **Data Storage and Synchronization**: Firebase backend for real-time data synchronization and storage of exam results and user profiles.
- **Secure Exam Environment**: Includes features like screen capture prevention and AI-based monitoring to detect cheating behavior.

## Technologies Used

- **Frontend**: Flutter (for building the cross-platform mobile application)
- **Backend**: Firebase (for user authentication, real-time database, and cloud storage)
- **Authentication**: Firebase Authentication, Biometric Authentication (Fingerprint/Face ID), Two-Factor Authentication (2FA)
- **Exam Security**: Lockdown Mode, AI-based cheating detection, Question Shuffling
- **Cross-Platform**: Supports both Android and iOS devices

## Aim of the Project

The primary aim of this project is to develop a secure, accessible, and user-friendly mobile-based application for conducting Computer-Based Tests (CBT). It focuses on providing an alternative to traditional exam systems while ensuring that the testing process is fair and efficient.

## Objectives

- Define use cases and capture detailed functional requirements
- Prioritize features and create milestones toward a minimum viable product (MVP)
- Design an intuitive and interactive user interface
- Develop the mobile application to support both Android and iOS platforms
- Conduct thorough quality assurance (QA) testing for stability, security, and usability

## Scope of the Study

This study focuses on the development and implementation of a mobile-based CBT exam application. The app is designed to be flexible and scalable for use in educational institutions, addressing the challenges posed by traditional computer labs, such as limited access and time delays. The geographical scope of this study is not region-specific but focuses on institutions globally that face similar challenges in exam administration.

## Significance of the Study

- **Cost-Effective**: Shifting to mobile devices eliminates the need for expensive computer labs and specialized software, reducing costs for educational institutions.
- **Improved Accessibility**: Students can take exams on their personal mobile devices, making it more convenient and reducing time delays associated with traditional CBT systems.
- **Enhanced Security**: The app features biometric authentication, lockdown modes, and AI-based behavior monitoring, ensuring the integrity of the examination process.

## Getting Started

To get started with the project, follow these instructions:

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/CBT-Mobile-App.git
