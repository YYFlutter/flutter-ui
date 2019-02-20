```

class _DemoState extends State<Demo> {
  bool loading = true;
  String ___MD___ = _mdUrl;

  @override
  void initState() {
    super.initState();
    this.initMd();
  }

  initMd() async {
    String mdStr = await FileUtils.readLocaleFile(___MD___);
    setState(() {
      this.___MD___ = mdStr;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetComp(
      name: Demo.name,
      codeUrl: Demo.codeUrl,
      mdUrl: Demo.mdUrl,
      loading: loading,
      modelChild: (context, child, model) {
        return [
          ___MD___,
          Container(
            color: Colors.teal.shade700,
            alignment: Alignment.center,
            child: Text(
              'Hello WorldHello WorldHello  WorldHello WorldHello World',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(color: Colors.white),
            ),
          ),
        ];
      },
    );
  }
}

```
