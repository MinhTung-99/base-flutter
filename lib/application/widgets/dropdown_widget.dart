import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'auto_size_text_field_widget.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget(
      {required this.dropDownList,
        Key? key,
        required this.singleController,
        this.isEnabled = true,
        this.readOnly = true,
        this.dropdownRadius = 8,
        this.dropDownItemCount = 6,
        this.listSpace = 0,
        this.maxLine = 1,
        this.height = 50,
        this.maxDropdownHeight = 208,
        this.borderRadius = 8,
        this.withBorderDropDown = 1,
        this.minDropDownHeight = 52,
        this.paddingOffsetDropDown = const EdgeInsets.symmetric(vertical: 4),
        this.colorBorderCloseDropDown = Colors.black12,
        this.colorBorderOpenDropDown = Colors.red,
        this.initialValue,
        this.padding,
        this.onChanged,
        this.hintText,
        this.hintStyle,
        this.contentPadding,
        this.listPadding,
        this.listTextStyle,
        this.hintColor})
      : assert(!(initialValue != null && singleController != null),
  'you cannot add both initialValue and singleController,\nset initial value using controller \n\tEg: SingleValueDropDownController(data:initial value) '),
        super(key: key);

  final Color? hintColor;

  ///single dropdown controller,
  final SingleValueDropDownController? singleController;

  ///define the radius of dropdown List ,default value is 8
  final double dropdownRadius;

  ///initial value ,if it is null or not exist in dropDownList then it will not display value.
  final dynamic initialValue;

  ///dropDownList,List of dropdown values
  ///List<DropDownValueModel>
  final List<DropDownValueModel> dropDownList;

  ///function,called when value selected from dropdown.
  ///for single Selection Dropdown it will return single DropDownValueModel object,
  ///and for multi Selection Dropdown ,it will return list of DropDownValueModel object,
  final ValueSetter? onChanged;

  final Color colorBorderCloseDropDown;

  final Color colorBorderOpenDropDown;

  final double borderRadius;

  final EdgeInsets? padding;

  final EdgeInsetsGeometry paddingOffsetDropDown;

  final double withBorderDropDown;

  final double minDropDownHeight;

  ///by setting isEnabled=false to disable textfield,default value true
  final bool isEnabled;

  final double height;

  final int maxLine;

  final bool readOnly;

  ///Maximum number of dropdown item to display,default value is 6
  final int dropDownItemCount;

  ///space between textfield and list ,default value is 0
  final double listSpace;

  ///dropdown List item padding
  final ListPadding? listPadding;

  final String? hintText;

  final TextStyle? hintStyle;

  final EdgeInsetsGeometry? contentPadding;

  ///dropdown list item text style
  final TextStyle? listTextStyle;

  final double maxDropdownHeight;

  @override
  DropDownWidgetState createState() => DropDownWidgetState();
}

class DropDownWidgetState extends State<DropDownWidget>
    with TickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
  CurveTween(curve: Curves.easeIn);

  late TextEditingController _cnt;
  late dynamic _idSelectd;

  late bool _isOpenDropDown;
  OverlayEntry? _entry;
  OverlayEntry? _entry2;
  OverlayEntry? _barrierOverlay;
  final _layerLink = LayerLink();
  late AnimationController _controller;
  late AnimationController _arrowController;
  late Animation<double> _heightFactor;

  late double _height;
  late List<DropDownValueModel> _dropDownList;
  late FocusNode _searchFocusNode;
  late FocusNode _textFieldFocusNode;
  late bool _isOutsideClickOverlay;
  late bool _isScrollPadding;
  final int _duration = 150;
  late Offset _offset;
  late double _listTileHeight;
  late double _keyboardHeight;
  late TextStyle _listTileTextStyle;
  late ListPadding _listPadding;

  @override
  void initState() {
    _cnt = TextEditingController();
    _keyboardHeight = 450;
    _isScrollPadding = false;
    _isOutsideClickOverlay = false;
    _textFieldFocusNode = FocusNode();
    _isOpenDropDown = false;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _duration),
    );

    _arrowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      upperBound: 0.5,
    );
    _heightFactor = _controller.drive(_easeInTween);

    ///initial value load
    _cnt.text = widget.singleController?.dropDownValue?.name ?? '';
    _idSelectd = widget.singleController?.dropDownValue?.value;

    updateFunction();

    super.initState();
  }

  Size _textWidgetSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  updateFunction({DropDownWidget? oldWidget}) {
    _dropDownList = List.from(widget.dropDownList);

    _listPadding = widget.listPadding ?? ListPadding();

    WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.singleController != null) {
          if (widget.singleController!.dropDownValue != null) {
            _cnt.text = widget.singleController!.dropDownValue?.name ?? '';
            _idSelectd = widget.singleController!.dropDownValue?.value;
          } else {
            _cnt.clear();
          }
        }
      if (mounted) {
        _listTileTextStyle =
        (widget.listTextStyle ?? const TextStyle(fontSize: 16));
      }
      _listTileHeight =
          _textWidgetSize('dummy Text', _listTileTextStyle).height +
              _listPadding.top +
              _listPadding.bottom;

      _height = (_dropDownList.length < widget.dropDownItemCount
          ? _dropDownList.length * _listTileHeight
          : _listTileHeight * widget.dropDownItemCount.toDouble());
    });
  }

  @override
  void didUpdateWidget(covariant DropDownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateFunction(oldWidget: oldWidget);
  }

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    _arrowController.dispose();
    _controller.dispose();
    super.dispose();
  }

  clearFun() {
    if (_isOpenDropDown) {
      _isOpenDropDown = !_isOpenDropDown;
      hideOverlay();
    }
    _cnt.clear();
      if (widget.singleController != null) {
        widget.singleController!.setDropDown(null);
      }
      if (widget.onChanged != null) {
        widget.onChanged!('');
      }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        if (!isKeyboardVisible && _isOpenDropDown && _isScrollPadding) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            shiftOverlayEntry2to1();
          });
        }
        return CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            onTap: _tabWidget,
            child: Container(
              padding: widget.padding,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: (_isOpenDropDown
                            ? widget.colorBorderOpenDropDown
                            : widget.colorBorderCloseDropDown),
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius)),
              height: widget.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeTextFieldWidget(
                        minFontSize: 16,
                        maxFontSize: 16,
                        overflowReplacement: Text(
                          _cnt.text,
                          overflow: TextOverflow.ellipsis,
                          maxLines: widget.maxLine
                        ),
                        focusNode: _textFieldFocusNode,
                        style: const TextStyle(color: Colors.blue),
                        enabled: widget.isEnabled,
                        readOnly: widget.readOnly,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.left,
                        controller: _cnt,
                        onTap: _tabWidget,
                        decoration: InputDecoration(
                           floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: widget.hintText,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          isDense: true,
                          hintStyle: widget.hintStyle,
                          contentPadding: widget.contentPadding
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _tabWidget,
                    child: RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0)
                            .animate(_arrowController),
                        child: _isOpenDropDown
                            ? const Icon(Icons.expand_more_rounded,
                            color: Colors.red)
                            : const Icon(Icons.expand_more_rounded,
                            color: Colors.red)),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _tabWidget() {
    if (_isOpenDropDown) {
      _arrowController.reverse(from: 0.5);
    } else {
      _arrowController.forward(from: 0.0);
    }
    if (!_isOpenDropDown) {
      if (_dropDownList.isNotEmpty) {
        _showOverlay();
      }
    } else {
      _isOpenDropDown = false;
      hideOverlay();
    }
    setState(() {});
  }

  Future<void> _showOverlay() async {
    _controller.forward();
    _isOpenDropDown = true;
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    _offset = renderBox.localToGlobal(Offset.zero);
    final double posFromTop = _offset.dy;
    final double posFromBot = MediaQuery.of(context).size.height - posFromTop;

    final double dropdownListHeight = _height;
    final double ht = dropdownListHeight + 120;
    _isOutsideClickOverlay = _isScrollPadding ||
        (widget.readOnly &&
            dropdownListHeight >
                (posFromTop - MediaQuery.of(context).padding.top - 15) &&
            posFromBot > ht);
    final double topPaddingHeight = _isOutsideClickOverlay
        ? (dropdownListHeight -
        (posFromTop - MediaQuery.of(context).padding.top - 15))
        : 0;

    final double htPos = posFromBot < ht
        ? size.height - 100 + topPaddingHeight
        : _isScrollPadding
        ? size.height - (_keyboardHeight - posFromBot)
        : size.height;

    _openOutSideClickOverlay(context);

    _entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          targetAnchor:
          posFromBot < ht ? Alignment.bottomCenter : Alignment.topCenter,
          followerAnchor:
          posFromBot < ht ? Alignment.bottomCenter : Alignment.topCenter,
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(
            0,
            posFromBot < ht
                ? htPos - widget.listSpace + 3
                : htPos + widget.listSpace + 2,
          ),
          child: AnimatedBuilder(
            animation: _controller.view,
            builder: buildOverlay,
          ),
        ),
      ),
    );
    _entry2 = OverlayEntry(
      builder: (context) => Positioned(
          width: size.width,
          child: CompositedTransformFollower(
              targetAnchor: Alignment.bottomCenter,
              followerAnchor: Alignment.bottomCenter,
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(
                0,
                htPos,
              ),
              child: AnimatedBuilder(
                animation: _controller.view,
                builder: buildOverlay,
              ))),
    );
    overlay.insert(_isScrollPadding ? _entry2! : _entry!);
    setState(() {});
  }

  void _openOutSideClickOverlay(BuildContext context) {
    final overlay2 = Overlay.of(context);
    _barrierOverlay?.remove();
    _barrierOverlay = null;
    _barrierOverlay = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return GestureDetector(
        onTap: () {
          setState(() {
            _isOpenDropDown = !_isOpenDropDown;
          });
          hideOverlay();
        },
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.transparent,
        ),
      );
    });
    overlay2.insert(_barrierOverlay!);
  }

  void hideOverlay() {
    if (!_isScrollPadding) {}
    _controller.reverse().then<void>((void value) {
      if (_entry != null && _entry!.mounted) {
        _entry?.remove();
        _entry = null;
      }
      if (_entry2 != null && _entry2!.mounted) {
        _entry2?.remove();
        _entry2 = null;
      }

      if (_barrierOverlay != null && _barrierOverlay!.mounted) {
        _barrierOverlay?.remove();
        _barrierOverlay = null;
        _isOutsideClickOverlay = false;
      }
      _isScrollPadding = false;
      _isOpenDropDown = false;
    });
    _arrowController.reverse();
    setState(() {});
  }

  void shiftOverlayEntry1to2() {
    _entry?.remove();
    _entry = null;
    if (_barrierOverlay != null && _barrierOverlay!.mounted) {
      _barrierOverlay?.remove();
      _barrierOverlay = null;
      _isOutsideClickOverlay = false;
    }
    _isScrollPadding = true;
    _showOverlay();
    _textFieldFocusNode.requestFocus();

    Future.delayed(Duration(milliseconds: _duration), () {
      _searchFocusNode.requestFocus();
    });
  }

  void shiftOverlayEntry2to1() {
    _entry2?.remove();
    _entry2 = null;
    if (_barrierOverlay != null && _barrierOverlay!.mounted) {
      _barrierOverlay?.remove();
      _barrierOverlay = null;
      _isOutsideClickOverlay = false;
    }
    _controller.reset();
    _isScrollPadding = false;
    _showOverlay();
    _textFieldFocusNode.requestFocus();
  }

  Widget buildOverlay(context, child) {
    return ClipRect(
      child: Align(
        heightFactor: _heightFactor.value,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: widget.paddingOffsetDropDown,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: _isOpenDropDown ? widget.colorBorderOpenDropDown : widget.colorBorderCloseDropDown, width: widget.withBorderDropDown),
                borderRadius: BorderRadius.all(Radius.circular(widget.dropdownRadius)),
              ),
              child: SingleSelection(
                  mainController: _cnt,
                  autoSort: !widget.readOnly,
                  mainFocusNode: _textFieldFocusNode,
                  height: _height,
                  dropDownList: _dropDownList,
                  dropdownRadius: widget.dropdownRadius,
                  listTextStyle: _listTileTextStyle,
                  idSelected: _idSelectd,
                  onChanged: (item) {
                    setState(() {
                      _cnt.text = item.name;
                      _isOpenDropDown = !_isOpenDropDown;

                      _idSelectd = item.value;
                    });
                    if (widget.singleController != null) {
                      widget.singleController!.setDropDown(item);
                    }
                    if (widget.onChanged != null) {
                      widget.onChanged!(item);
                    }

                    hideOverlay();
                  },
                  listPadding: _listPadding,
                  maxDropdownHeight: widget.maxDropdownHeight,
                  minDropDownHeight: widget.minDropDownHeight,
              )
            ),
          ),
        ),
      ),
    );
  }
}

class SingleSelection extends StatefulWidget {
  SingleSelection({
    Key? key,
    required this.dropDownList,
    required this.onChanged,
    required this.height,
    required this.mainFocusNode,
    required this.mainController,
    required this.autoSort,
    required this.maxDropdownHeight,
    this.listTextStyle,
    required this.listPadding,
    required this.minDropDownHeight,
    required this.dropdownRadius,
    this.idSelected,
  }) : super(key: key);

  final List<DropDownValueModel> dropDownList;
  final ValueSetter onChanged;
  final double height;
  final FocusNode mainFocusNode;
  final TextEditingController mainController;
  final bool autoSort;
  final TextStyle? listTextStyle;
  final ListPadding listPadding;
  final double maxDropdownHeight;
  final double minDropDownHeight;
  final double dropdownRadius;
  dynamic idSelected;

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  late List<DropDownValueModel> newDropDownList;
  late FocusScopeNode _focusScopeNode;
  final ScrollController _controller = ScrollController();

  onItemChanged(String value) {
    setState(() {
      if (value.isEmpty) {
        newDropDownList = List.from(widget.dropDownList);
      } else {
        newDropDownList = widget.dropDownList
            .where(
              (item) => item.name.toLowerCase().contains(value.toLowerCase()),
        )
            .toList();
      }
    });
  }

  @override
  void initState() {
    _focusScopeNode = FocusScopeNode();
    _focusScopeNode.requestFocus();
    newDropDownList = List.from(widget.dropDownList);

    if (widget.autoSort) {
      onItemChanged(widget.mainController.text);
      widget.mainController.addListener(() {
        if (mounted) {
          onItemChanged(widget.mainController.text);
        }
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            constraints: BoxConstraints(
                maxHeight: widget.maxDropdownHeight),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: Scrollbar(
                trackVisibility: true,
                thumbVisibility: true,
                interactive: true,
                controller: _controller,
                child: SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                        newDropDownList.length,
                            (index) => InkWell(
                          onTap: () {
                            widget.onChanged(newDropDownList[index]);
                          },
                          child: Container(
                            constraints: BoxConstraints(minHeight: widget.minDropDownHeight),
                            width: double.infinity,
                            decoration: _getDecorationDropDown(index),
                            padding: _getPaddingDropDown(),
                            child: Text(newDropDownList[index].name,
                                style: widget.listTextStyle),
                          ),
                        )),
                  ),
                ),
              ),
            )),
      ],
    );
  }

  ///
  Decoration _getDecorationDropDown(int index) {
    return BoxDecoration(
        borderRadius: _getBorderRadiusForDecorationDropDown(index),
        color: _checkColorSelected(
            newDropDownList[index].value,
            newDropDownList[index].name));
  }

  BorderRadiusGeometry? _getBorderRadiusForDecorationDropDown(int index) {
    return (index == 0 ||
        index == newDropDownList.length - 1)
        ? _getBorderRadiusForParentDecorationDropDown(index)
        : null;
  }

  BorderRadiusGeometry? _getBorderRadiusForParentDecorationDropDown(int index) {
    return BorderRadius.only(
      topLeft: index == 0
          ? Radius.circular(widget.dropdownRadius)
          : const Radius.circular(0),
      topRight: index == 0
          ? Radius.circular(widget.dropdownRadius)
          : const Radius.circular(0),
      bottomLeft: index ==
          newDropDownList.length - 1
          ? Radius.circular(widget.dropdownRadius)
          : const Radius.circular(0),
      bottomRight: index ==
          newDropDownList.length - 1
          ? Radius.circular(widget.dropdownRadius)
          : const Radius.circular(0),
    );
  }

  EdgeInsetsGeometry _getPaddingDropDown() {
    return EdgeInsets.only(
        left: widget.listPadding.left,
        right: widget.listPadding.right,
        bottom: widget.listPadding.bottom,
        top: widget.listPadding.top);
  }

  Color _checkColorSelected(value, String name) {
    if (value == widget.idSelected && name == widget.mainController.text) {
      return const Color(0xFFECEDF0);
    }

    return Colors.transparent;
  }

  ///
}

class DropDownValueModel extends Equatable {
  final String name;
  final dynamic value;

  const DropDownValueModel(
      {required this.name, required this.value});

  factory DropDownValueModel.fromJson(Map<String, dynamic> json) =>
      DropDownValueModel(
        name: json['name'],
        value: json['value']
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'value': value
  };

  @override
  List<Object> get props => [name, value];
}

class SingleValueDropDownController extends ChangeNotifier {
  DropDownValueModel? dropDownValue;

  SingleValueDropDownController({DropDownValueModel? data}) {
    setDropDown(data);
  }

  void setDropDown(DropDownValueModel? model) {
    dropDownValue = model;
    notifyListeners();
  }

  void clearDropDown() {
    dropDownValue = null;
    notifyListeners();
  }
}

class ListPadding {
  double top;
  double bottom;
  double left;
  double right;

  ListPadding({this.top = 15, this.bottom = 15, this.left = 15, this.right = 15});
}

class KeyboardVisibilityBuilder extends StatefulWidget {
  const KeyboardVisibilityBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);
  final Widget Function(
      BuildContext context,
      bool isKeyboardVisible,
      ) builder;

  @override
  _KeyboardVisibilityBuilderState createState() =>
      _KeyboardVisibilityBuilderState();
}

class _KeyboardVisibilityBuilderState extends State<KeyboardVisibilityBuilder>
    with WidgetsBindingObserver {
  var _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    if (newValue != _isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) => widget.builder(
    context,
    _isKeyboardVisible,
  );
}
