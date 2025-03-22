import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_mdc/core/route_name.dart';
import 'package:test_mdc/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:test_mdc/modules/auth/presentation/forgot_password_page.dart';
import 'package:test_mdc/modules/auth/presentation/new_password_page.dart';
import 'package:test_mdc/modules/auth/presentation/password_change_done_page.dart';
import 'package:test_mdc/modules/auth/presentation/phone_verification.dart';
import 'package:test_mdc/modules/auth/presentation/sign_in/sign_in_page.dart';
import 'package:test_mdc/modules/auth/presentation/sign_in/sign_in_vm.dart';
import 'package:test_mdc/modules/auth/presentation/sign_up/sign_up_page.dart';
import 'package:test_mdc/modules/auth/presentation/sign_up/sign_up_vm.dart';
import 'package:test_mdc/modules/auth/presentation/term_service_page.dart';

class AppModule extends Module {

  @override
  void binds(Injector i) {
    i.add(AuthRepositoryImpl.new);
    i.add(SignInVM.new);
    i.add(SignUpVM.new);
  }

  @override
  void routes(RouteManager r) {
      r.child(RouteName.signIn, child: (context) => SignInPage());
      r.child(RouteName.signUp, child: (context) => SignUpPage());
      r.child(RouteName.forgotPassword, child: (context) => ForgotPasswordPage());
      r.child(RouteName.phoneVerify, child: (context) => PhoneVerification());
      r.child(RouteName.termService, child: (context) => TermServicePage());
      r.child(RouteName.newPassword, child: (context) => NewPasswordPage());
      r.child(RouteName.pwChangeDone, child: (context) => PasswordChangeDonePage());
  }
}