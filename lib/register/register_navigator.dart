/// Interface
/// Common between (Model-view)

abstract class RegisterNavigator{

  void showLoading();
  void hideLoading();
  void showMessage(String message);
  void navigateToHome();
}