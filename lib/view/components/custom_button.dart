//  * [IconButton], to create buttons that contain icons rather than text.
import 'package:flutter/foundation.dart';
import 'package:tambola_frontend/view/constants/export_main.dart';

class CustomButtom extends StatelessWidget {
  /// Creates a Material Design button.
  ///
  /// To create a custom Material button consider using [TextButton],
  /// [ElevatedButton], or [OutlinedButton].
  ///
  /// The [autofocus] and [clipBehavior] arguments must not be null.
  /// Additionally,  [elevation], [hoverElevation], [focusElevation],
  /// [highlightElevation], and [disabledElevation] must be non-negative, if
  /// specified.
  const CustomButtom({
    // super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHighlightChanged,
    this.mouseCursor,
    this.textTheme,
    this.textColor,
    this.color,
    this.disabledColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.padding,
    this.visualDensity,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.animationDuration,
    this.minWidth,
    this.height,
    this.enableFeedback = true,
    this.child,
  })  : assert(clipBehavior != null),
        assert(autofocus != null),
        assert(elevation == null || elevation >= 0.0),
        assert(focusElevation == null || focusElevation >= 0.0),
        assert(hoverElevation == null || hoverElevation >= 0.0),
        assert(highlightElevation == null || highlightElevation >= 0.0),
        assert(disabledElevation == null || disabledElevation >= 0.0);

  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onPressed;

  final VoidCallback? onLongPress;

  final ValueChanged<bool>? onHighlightChanged;

  final MouseCursor? mouseCursor;

  final ButtonTextTheme? textTheme;

  final Color? textColor;

  final Color? color;

  final Color? disabledColor;

  final Color? splashColor;

  final Color? hoverColor;

  final Color? highlightColor;

  final double? elevation;

  final double? hoverElevation;

  final double? focusElevation;

  final double? highlightElevation;

  final double? disabledElevation;

  final Brightness? colorBrightness;

  final Widget? child;

  /// or [onLongPress] properties to a non-null value.
  bool get enabled => onPressed != null || onLongPress != null;

  /// [ButtonThemeData.padding].
  final EdgeInsetsGeometry? padding;

  final VisualDensity? visualDensity;

  final ShapeBorder? shape;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Defines the duration of animated changes for [shape] and [elevation].
  ///
  /// The default value is [kThemeChangeDuration].
  final Duration? animationDuration;

  /// Configures the minimum size of the tap target.
  ///
  /// Defaults to [ThemeData.materialTapTargetSize].
  ///
  /// See also:
  ///
  ///  * [MaterialTapTargetSize], for a description of how this affects tap targets.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// The smallest horizontal extent that the button will occupy.
  ///
  /// Defaults to the value from the current [ButtonTheme].
  final double? minWidth;

  /// The vertical extent of the button.
  ///
  /// Defaults to the value from the current [ButtonTheme].
  final double? height;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool enableFeedback;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ButtonThemeData buttonTheme = ButtonTheme.of(context);

    return RawMaterialButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      enableFeedback: enableFeedback,
      onHighlightChanged: onHighlightChanged,
      mouseCursor: mouseCursor,
      // fillColor: buttonTheme.getFillColor(this),
      // textStyle: theme.textTheme.button!.copyWith(color: buttonTheme.getTextColor(this)),
      // focusColor: focusColor ?? buttonTheme.getFocusColor(this),
      // hoverColor: hoverColor ?? buttonTheme.getHoverColor(this),
      highlightColor: highlightColor ?? theme.highlightColor,
      splashColor: splashColor ?? theme.splashColor,
      // elevation: buttonTheme.getElevation(this),
      // focusElevation: buttonTheme.getFocusElevation(this),
      // hoverElevation: buttonTheme.getHoverElevation(this),
      // highlightElevation: buttonTheme.getHighlightElevation(this),
      // padding: buttonTheme.getPadding(this),
      visualDensity: visualDensity ?? theme.visualDensity,
      // constraints: buttonTheme.getConstraints(this).copyWith(
      //   minWidth: minWidth,
      //   minHeight: height,
      // ),
      // shape: buttonTheme.getShape(this),
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      // animationDuration: buttonTheme.getAnimationDuration(this),
      materialTapTargetSize:
          materialTapTargetSize ?? theme.materialTapTargetSize,
      disabledElevation: disabledElevation ?? 0.0,
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(FlagProperty('enabled', value: enabled, ifFalse: 'disabled'));
    properties.add(DiagnosticsProperty<ButtonTextTheme>('textTheme', textTheme,
        defaultValue: null));
    properties.add(ColorProperty('textColor', textColor, defaultValue: null));
    // properties.add(ColorProperty('disabledTextColor', disabledTextColor, defaultValue: null));
    properties.add(ColorProperty('color', color, defaultValue: null));
    properties
        .add(ColorProperty('disabledColor', disabledColor, defaultValue: null));
    // properties.add(ColorProperty('focusColor', focusColor, defaultValue: null));
    properties.add(ColorProperty('hoverColor', hoverColor, defaultValue: null));
    properties.add(
        ColorProperty('highlightColor', highlightColor, defaultValue: null));
    properties
        .add(ColorProperty('splashColor', splashColor, defaultValue: null));
    properties.add(DiagnosticsProperty<Brightness>(
        'colorBrightness', colorBrightness,
        defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding,
        defaultValue: null));
    properties.add(DiagnosticsProperty<VisualDensity>(
        'visualDensity', visualDensity,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty<ShapeBorder>('shape', shape, defaultValue: null));
    properties.add(DiagnosticsProperty<FocusNode>('focusNode', focusNode,
        defaultValue: null));
    properties.add(DiagnosticsProperty<MaterialTapTargetSize>(
        'materialTapTargetSize', materialTapTargetSize,
        defaultValue: null));
  }
}
