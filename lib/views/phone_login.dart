import 'package:chatapp/constant/color.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String countryCode = "+880";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                  child: Image.asset(
                'assets/chat.png',
                fit: BoxFit.cover,
              )),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome to Chat On 👋',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                    ),
                    const Text('Enter your phone number to continue.'),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                        key: _formKey,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          decoration: InputDecoration(
                              labelText: 'Enter your phone number',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: primaryColor, width: 2)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              labelStyle: const TextStyle(color: Colors.black),
                              prefixIcon: CountryCodePicker(
                                initialSelection: "BD",
                                onChanged: (value) {
                                  countryCode = value.dialCode!;
                                },
                              )),
                          validator: (value) {
                            if (value!.length != 10) {
                              return "Invaild phone number";
                            } else {
                              return null;
                            }
                          },
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text("OTP Verification"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Enter the 6 digit OTP'),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Form(
                                            key: _formKey1,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: _otpController,
                                              validator: (value) {
                                                if (value!.length != 6) {
                                                  return 'Invalid otp';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              decoration: InputDecoration(
                                                labelText: 'OTP',
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    primaryColor,
                                                                width: 2)),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                labelStyle: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              if (_formKey1.currentState!
                                                  .validate()) {}
                                            },
                                            child: const Text(
                                              'Submit',
                                              style: TextStyle(
                                                  color: primaryColor),
                                            ))
                                      ],
                                    ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white),
                        child: const Text('Send OTP'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
