// Widget _buildTaskForceItem(String title, String date, String type) {
//   return Card(
//     margin: EdgeInsets.only(bottom: 8),
//     child: ListTile(
//       title: Text(title),
//       subtitle: Text('$date\n$type'),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // "Approved" label
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             decoration: BoxDecoration(
//               color: Colors.green,  // Green color for "Approved"
//               borderRadius: BorderRadius.circular(5),
//             ),
//             child: Text(
//               'Approved',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           SizedBox(width: 8), // Space between the label and the image
//           // Image on the right
//           Image.asset(
//             'assets/next_image.png', // Replace with the path to your image
//             width: 24, // Set the width of the image
//             height: 24, // Set the height of the image
//           ),
//         ],
//       ),
//     ),
//   );
// }
