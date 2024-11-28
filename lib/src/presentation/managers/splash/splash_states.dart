class SplashStates{}
class InitialState extends SplashStates{}
class NavigateToNextScreen extends SplashStates{
  String nextRoute;
  NavigateToNextScreen(this.nextRoute);
}