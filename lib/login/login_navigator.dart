/// Interface
/// Common between (Model-view)

abstract class LoginNavigator{

  void showLoading();
  void hideLoading();
  void showMessage(String message);
  void navigateToHome();
}