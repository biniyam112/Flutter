bool accNameValidate(String username) {
  if (username.isEmpty ||
      (!username.contains(new RegExp(r'[a-z]')) &&
          !username.contains(new RegExp(r'[A-Z]')) &&
          !username.contains(new RegExp(r'[0-9]'))) ||
      username.startsWith(' ')) {
    return false;
  } else
    return true;
}

bool passwordValidate(String password) {
  if (password.isEmpty ||
      (!password.contains(new RegExp(r'[a-z]')) &&
          !password.contains(new RegExp(r'[A-Z]')) &&
          !password.contains(new RegExp(r'[0-9]')))) {
    return false;
  } else
    return true;
}
