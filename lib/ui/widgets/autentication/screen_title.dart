import 'package:flutter/material.dart';

class ScreenTitle extends StatefulWidget {
  TextEditingController email;
  TextEditingController password;
  ScreenTitle({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<ScreenTitle> createState() => _ScreenTitleState();
}

class _ScreenTitleState extends State<ScreenTitle> {
  bool _rememberMe = false;
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: const Text(
            "Sign In to Woorkroom",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 26,
        ),
        const Text(
          "Email Address",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty)
              return "Please return email addres";

            if (!value.contains("@"))
              return "Please,enter @ element to email address";

            return null;
          },
          controller: widget.email,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            hintText: 'youremail@gmail.com',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Password",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.trim().isEmpty)
              return "Please return email addres";

            if (value.trim().length < 6) return "Min password length 6";

            return null;
          },
          controller: widget.password,
          obscureText: _isShow,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            hintText: '********',
            suffixIcon: InkWell(
              onTap: (){
                setState(() {
                  _isShow = !_isShow;
                });
              },
              child: _isShow ? const Icon(Icons.visibility_off) : const Icon(Icons.remove_red_eye),
            ),
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(
                      () {
                        _rememberMe = value!;
                      },
                    );
                  },
                ),
                const Text("Remember me"),
              ],
            ),
            _rememberMe
                ? InkWell(
                    onTap: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        )
      ],
    );
  }
}
