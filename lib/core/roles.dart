// lib/core/roles.dart

/// Enum for user roles in the UI
enum UiUserRole {
  admin,
  manager,
  creator,
}

/// Global variable to hold the current UI role
UiUserRole currentUiUserRole = UiUserRole.admin;
