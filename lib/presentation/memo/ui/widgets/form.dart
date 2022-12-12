import 'package:demo/domains/memo/memo.dart';
import 'package:uuid/uuid.dart';
import 'package:demo/presentation/auth/type.dart';
import 'package:demo/presentation/memo/type.dart';
import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';

class MemoForm extends StatefulWidget {
  const MemoForm({super.key, required this.props});
  final MemoFormWidgetProps props;
  @override
  MemoFormState createState() => MemoFormState();
}

class MemoFormState extends State<MemoForm> {
  final _formKey = GlobalKey<FormState>();
  final titleFormGroup = FormGroup(
    node: FocusNode(),
    controller: TextEditingController(),
  );

  final contentsFormGroup = FormGroup(
    node: FocusNode(),
    controller: TextEditingController(),
  );

  static String? validateFormField(String? value) =>
      value == null || value.isEmpty ? 'Please enter some text' : null;

  @override
  Widget build(BuildContext context) {
    MemoFormWidgetProps props = widget.props;
    Memo? tmpMemo = props.memo;
    String memoId = const Uuid().v1();

    if (tmpMemo != null) {
      memoId = tmpMemo.id;
      titleFormGroup.controller.text = tmpMemo.title;
      contentsFormGroup.controller.text = tmpMemo.contents;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: titleFormGroup.node,
                controller: titleFormGroup.controller,
                validator: (value) => validateFormField(value),
                decoration: const InputDecoration(hintText: "title"),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextFormField(
                focusNode: contentsFormGroup.node,
                controller: contentsFormGroup.controller,
                validator: (value) => validateFormField(value),
                decoration: const InputDecoration(hintText: "contents"),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }

                    await widget.props.function(
                      context: context,
                      memo: Memo(
                        id: memoId,
                        uid: props.user.id,
                        categoryId: props.categoryId,
                        title: titleFormGroup.controller.text,
                        contents: contentsFormGroup.controller.text,
                      ),
                    );
                  },
                  child: Text(tmpMemo == null ? "send memo" : "edit memo"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
