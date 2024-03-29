// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';



/// A header used in a material design [GridTile].
///
/// Typically used to add a one or two line header or footer on a [GridTile].
///
/// For a one-line header, include a [title] widget. To add a second line, also
/// include a [subtitle] widget. Use [leading] or [trailing] to add an icon.
///
/// See also:
///
///  * [GridTile]
///  * <https://material.io/design/components/image-lists.html#anatomy>
class GridTileBarEx extends StatelessWidget {
  /// Creates a grid tile bar.
  ///
  /// Typically used to with [GridTile].
  const GridTileBarEx({
    Key key,
    this.backgroundColor,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
  }) : super(key: key);

  /// The color to paint behind the child widgets.
  ///
  /// Defaults to transparent.
  final Color backgroundColor;

  /// A widget to display before the title.
  ///
  /// Typically an [Icon] or an [IconButton] widget.
  final Widget leading;

  /// The primary content of the list item.
  ///
  /// Typically a [Text] widget.
  final Widget title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget subtitle;

  /// A widget to display after the title.
  ///
  /// Typically an [Icon] or an [IconButton] widget.
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration;
    if (backgroundColor != null)
      decoration = BoxDecoration(color: backgroundColor);

    final List<Widget> children = <Widget>[];
    final EdgeInsetsDirectional padding = EdgeInsetsDirectional.only(
      start: leading != null ? 8.0 : 16.0,
      end: trailing != null ? 8.0 : 16.0,
    );

    if (leading != null)
      children.add(Padding(padding: const EdgeInsetsDirectional.only(end: 8.0), child: leading));

    final ThemeData theme = Theme.of(context);
    final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      accentColor: theme.accentColor,
      accentColorBrightness: theme.accentColorBrightness,
    );
    if (title != null && subtitle != null) {
      children.add(
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextStyle(
                  style: darkTheme.textTheme.subhead,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  child: title,
                ),
                DefaultTextStyle(
                  style: darkTheme.textTheme.caption,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  child: subtitle,
                ),
              ],
            ),
          )
      );
    } else if (title != null || subtitle != null) {
      children.add(
          Expanded(
            child: DefaultTextStyle(
              style: darkTheme.textTheme.subhead,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              child: title ?? subtitle,
            ),
          )
      );
    }

    if (trailing != null)
      children.add(trailing);

    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 5,
        end: 5,
      ),//container两边靠边的边距
      decoration: decoration,
      height: (title != null && subtitle != null) ? 68.0 : 48.0,
      child: Theme(
        data: darkTheme,
        child: IconTheme.merge(
          data: const IconThemeData(color: Colors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
