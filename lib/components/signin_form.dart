import 'package:animated_app_using_rive/entry_point.dart';
import 'package:animated_app_using_rive/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool isShowLoading = false;
  bool isShowConfetti = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  late SMITrigger confetti;



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Email",
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return "";
                    }
                    return null;
                  },
                  onSaved: (email) {},
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("assets/icons/email.svg"),
                    ),
                  ),
                ),
              ),
              const Text(
                "Password",
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return "";
                    }
                    return null;
                  },
                  onSaved: (password){},
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("assets/icons/password.svg"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      isShowLoading = true;
                      isShowConfetti = true;
                    });
                    Future.delayed(Duration(seconds: 1),
                    (){
                      if(_formkey.currentState!.validate()){
                        check.fire();
                        Future.delayed(Duration(seconds: 2),
                            (){
                          setState(() {
                            isShowLoading = false;
                          });
                          confetti.fire();
                          Future.delayed(Duration(seconds: 1),
                              (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  EntryPoint(),
                            ));
                            },
                          );
                        },
                        );
                      } else{
                        error.fire();
                        Future.delayed(const Duration(seconds: 2),
                            (){
                          setState(() {
                            isShowLoading = false;
                          });
                        });
                      }
                      },
                    );
                    },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade300,
                      minimumSize: const Size(double.infinity, 50),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ))),
                  icon: const Icon(Icons.arrow_right_alt),
                  label: const Text("Sign In"),
                ),
              ),
            ],
          ),
        ),
        isShowLoading ?
           CustomePositioned(child: RiveAnimation.asset("assets/RiveAssets/checkerror.riv",
             onInit: (artboard){
             StateMachineController controller = RiveUtils.getRiveController(artboard);
             check = controller.findSMI("Check") as SMITrigger;
             error = controller.findSMI("Error") as SMITrigger;
             reset = controller.findSMI("Reset") as SMITrigger;
             },
           ),
           )
            : const SizedBox(),

        isShowConfetti ? CustomePositioned(
          child: Transform.scale(
            scale: 7,
            child: RiveAnimation.asset("assets/RiveAssets/confetti.riv",
              onInit: (artboard){
              StateMachineController controller = RiveUtils.getRiveController(artboard);

          confetti = controller.findSMI("Trigger explosion") as SMITrigger;
          },
          ),
        ),
        ) : const SizedBox(),
      ],
    );
  }
}


class CustomePositioned extends StatelessWidget {
  const CustomePositioned({Key? key, required this.child, this.size = 100}) : super(key: key);

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: size,
            width: size,
            child: child,
          ),
        const Spacer(flex: 2,),
        ],
      ),
    );
  }
}
