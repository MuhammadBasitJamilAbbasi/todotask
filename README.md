# todotask

Todo App

## Getting Started

Home Screen:
The Home screen serves as a centralized view of all your todos.

Floating Plus Button:
Located at the bottom right.
Allows users to seamlessly navigate to the "Add Todo" screen.

Add Todo Screen:
This screen facilitates the addition of new todos.

Input Fields:

User can input todo title, description, and due date.
Confirmation button to submit the new todo.
Success Notification:

Upon successful addition, and the user is redirected to the Home screen.


Main Screen (After Adding Todo):
The Main Screen reflects all existing todos.

Edit Todo:
Clicking on a todo card edit icon show dialoge Box update status of Todos
if pending show white screen / if completed show List item Green

Automatic Deletion:
When the list reaches 10 todos, a confirmation dialog appears.
Dialog Box Content: "You've reached the maximum limit of 10 todos. Would you like to purchase to increase the limit or delete the first todo?"
Options: "Purchase" and "Delete First Todo"
If the user selects "Purchase," it close dialoge box.
If the user selects "Delete First Todo," the oldest todo is automatically deleted.


Technologies Used:
State Management (GetX):

Utilizing GetX for efficient state management, ensuring a smooth user experience.
Backend (Firestore):

Firestore is employed for backend services, enabling secure storage and retrieval of todos.
Frontend (Flutter):

The frontend is developed using Flutter for a cross-platform and visually appealing UI.
