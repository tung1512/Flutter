import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import 'star_button.dart';

class EmailWidget extends StatefulWidget {
  const EmailWidget(
      {super.key,
      required this.email,
      this.isSelected = false,
      this.isPreview = true,
      this.isThreaded = false,
      this.showHeadline = false,
      this.onSelected});

final bool isSelected;
  final bool isPreview;
  final bool showHeadline;
  final bool isThreaded;
  final void Function()? onSelected;
  final Email email;

  @override
  State<EmailWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  late Color unselectedColor = Color.alphaBlend(
    _colorScheme.primary.withOpacity(0.08), _colorScheme.surface);

    Color get _surfaceColor => switch (widget){
      EmailWidget(isPreview: false) => _colorScheme.surface,
      EmailWidget(isSelected: true) => _colorScheme.surface.withOpacity(0.5),
      _ => unselectedColor,
    };
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelected,
      child: Card(
        elevation: 0,
        color: _surfaceColor,
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.showHeadline) ...[
              EmailHeadline(email: widget.email, isSelected: widget.isSelected),
            ]
            EmailContent(
              email: widget.email,
              isPreview: widget.isPreview,
              isThreaded: widget.isThreaded,
              isSelected: widget.isSelected,
            ),
          ],
        ),
      ),
    )
  }

}

class EmailContent extends StatefulWidget{
  const EmailContent({
    super.key,
    required this.email,
    required this.isPreview,
    required this.isThreaded,
    required this.isSelected,
  });

  final Email email;
  final bool isPreview;
  final bool isThreaded;
  final bool isSelected;
  
  @override
  State<StatefulWidget> createState() => _EmailContentState();
}

class _EmailContentState extends State<EmailContent> {
late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
late final TextTheme _textTheme = Theme.of(context).textTheme;

Widget get contentSpacer => SizedBox(height: widget.isThreaded ? 20 : 2);

String get lastActiveLabel{
  final DateTime now = DateTime.now();
  if(widget.email.sender.lastActive.isAfter(now)) throw ArgumentError();
  final Duration elapsedTime = widget.email.sender.lastActive.difference(now).abs();

  return switch(elapsedTime){
    Duration(inSeconds: < 60) => '${elapsedTime.inSeconds}s',
      Duration(inMinutes: < 60) => '${elapsedTime.inMinutes}m',
      Duration(inHours: < 24) => '${elapsedTime.inHours}h',
      Duration(inDays: < 365) => '${elapsedTime.inDays}d',
      _ => throw UnimplementedError(),
  };
}

  TextStyle? get contentTextStyle => switch(widget){
    EmailContent(isThreaded: true) => _textTheme.bodyLarge,
    EmailContent(isSelected: true) => _textTheme.bodyMedium ?.copyWith(color: _colorScheme.onPrimaryContainer),
    _ => _textTheme.bodyMedium?.copyWith(color: _colorScheme.onSurfaceVariant),
  };
  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(builder: (context, constaints){
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(constaints.maxWidth - 200 > 0) ...[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.email.sender.avatarUrl),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 6)),
                ],
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.email.sender.name.fullName,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      style: widget.isSelected ?
                      _textTheme.labelMedium?.copyWith(color: _colorScheme.onSecondaryContainer):
                      _textTheme.labelMedium?.copyWith(color: _colorScheme.onSurface),
                      ),
                      Text(
                        lastActiveLabel,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        style: widget.isSelected? 
                        _textTheme.labelMedium?.copyWith(color: _colorScheme.onSecondaryContainer): 
                        _textTheme.labelMedium?.copyWith(color: _colorScheme.onSurfaceVariant),
                        ),
                  ],
                ),),
                if(constaints.maxWidth - 200 > 0) ...[
                  const StartButton(),
                ]
              ],
            );
          })
        ],
      ),
      );
  }

}

class EmailHeadline extends StatefulWidget {
  final Email email;
  
  final bool isSelected;

  const EmailHeadline({super.key, required this.email, required this.isSelected});
  

  @override
  State<StatefulWidget> createState() => _EmailHeadlineState();
}

class _EmailHeadlineState extends State<EmailHeadline> {

  late final TextTheme _textTheme = Theme.of(context).textTheme;
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constaints){
      return Container(
        height: 84,
        color: Color.alphaBlend(
      _colorScheme.primary.withOpacity(0.05), _colorScheme.surface,
      ),
      child: Padding(padding: const EdgeInsets.fromLTRB(24, 12, 12, 12),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.email.subject,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '${widget.email.replies.toString()} Messages',
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: _textTheme.labelMedium ?.copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),),
          if(constaints.maxWidth - 200 > 0) ...[
            SizedBox(
              height: 40,
              width: 40,
              child: FloatingActionButton(onPressed: (){},
              elevation: 0,
              backgroundColor: _colorScheme.surface,
              child: const Icon(Icons.delete_outline,),
            ),
            ),
            const Padding(padding: EdgeInsets.only(right: 8)),
            SizedBox(
              height: 40,
              width: 40,
              child: FloatingActionButton(onPressed: (){},
              elevation: 0,
              backgroundColor: _colorScheme.surface,
              child: const Icon(Icons.more_vert),
            ),
            ),
          ]
        ],
      ),),
      );
    });
  }

}
