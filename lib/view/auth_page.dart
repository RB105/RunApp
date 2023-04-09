
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/provider/auth/auth_provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AnimationController? animateController;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Login",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "Register",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                Switch(
                  //activeTrackColor: Colors.black,
                  value: context.watch<AuthProvider>().isRegister,
                  onChanged: (value) {
                    context.read<AuthProvider>().turnAround(value);
                  },
                ),
                Visibility(
                  visible: context.watch<AuthProvider>().isRegister,
                  replacement: _loginWidget(size, context),
                  child: _registerWidget(size, context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding _registerWidget(Size size, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Container(
        height: size.height * 0.4,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
                image: AssetImage('assets/img2.jpg'), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Register",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.005),
              child: TextFormField(
                controller:
                    context.watch<AuthProvider>().registerUsernameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: "Username",
                    filled: true,
                    fillColor: Colors.blue.shade900,
                    prefixIcon: const Icon(Icons.person)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.005),
              child: TextFormField(
                controller:
                    context.watch<AuthProvider>().registerPhonecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Your phone number",
                    filled: true,
                    fillColor: Colors.blue.shade900,
                    prefixIcon: const Icon(Icons.phone)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.005),
              child: TextFormField(
                controller:
                    context.watch<AuthProvider>().registerPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Set a strong password",
                    filled: true,
                    fillColor: Colors.blue.shade900,
                    prefixIcon: const Icon(Icons.lock_outline)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthProvider>().register(context);
                  },
                  child: context.watch<AuthProvider>().isLoading
                      ? const CircularProgressIndicator()
                      : const Text("SUBMIT")),
            )
          ],
        ),
      ),
    );
  }

  Padding _loginWidget(Size size, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Container(
        height: size.height * 0.4,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
                image: AssetImage('assets/img2.jpg'), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Login",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.02),
              child: TextFormField(
                controller: context.watch<AuthProvider>().loginPhonecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Your phone number",
                    filled: true,
                    fillColor: Colors.blue.shade900,
                    prefixIcon: const Icon(Icons.phone)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.01),
              child: TextFormField(
                controller:
                    context.watch<AuthProvider>().loginPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Your password",
                    filled: true,
                    fillColor: Colors.blue.shade900,
                    prefixIcon: const Icon(Icons.lock_outline)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthProvider>().login(context);
                  },
                  child: context.watch<AuthProvider>().isLoading
                      ? const CircularProgressIndicator()
                      : const Text("SUBMIT")),
            )
          ],
        ),
      ),
    );
  }
}
