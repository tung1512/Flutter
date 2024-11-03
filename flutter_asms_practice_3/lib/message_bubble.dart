import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final String senderName;
  final String avatarUrl;
  final bool showSenderName;
  final String? status;
  final bool showStatus;

  const MessageBubble({
    super.key,
    required this.text,
    required this.isSender,
    required this.senderName,
    required this.avatarUrl,
    this.showSenderName = false,
    this.status,
    this.showStatus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
        isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isSender) ...[
            Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                  radius: 15,
                ),
                if (showStatus && status != null) ...[
                  const SizedBox(height: 20), // Add space if status is shown
                ],
              ],
            ),
            const SizedBox(width: 10),
          ],
          // Column chứa tên người gửi, bubble và status
          Column(
            crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              // Show sender name if required
              if (showSenderName) ...[
                Text(
                  senderName,
                  style: const TextStyle(
                    color: Color(0xffcdcdcd),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
              // Bubble tin nhắn
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7, // Set max width
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: isSender ? const Color(0xff304ffe) : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10),
                      topRight: const Radius.circular(10),
                      bottomLeft:
                      isSender ? const Radius.circular(10) : Radius.zero,
                      bottomRight:
                      isSender ? Radius.zero : const Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: isSender ? Colors.white : Colors.black,
                    ),
                    softWrap: true, // Allow text to wrap
                    overflow: TextOverflow.visible, // Make sure it doesn't overflow
                  ),
                ),
              ),
              if (showStatus && status != null) ...[
                const SizedBox(height: 5),
                Text(
                  status!,
                  style: const TextStyle(
                    color: Color(0xffcdcdcd),
                    fontSize: 12,
                  ),
                ),
              ],
            ],
          ),
          if (isSender) ...[
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                  radius: 15,
                ),
                if (showStatus && status != null) ...[
                  const SizedBox(height: 20),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}
