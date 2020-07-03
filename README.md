
CRUD actions

C => Create
  - get /books/new -> new action (create book listing). Renders a new view with a form to enter the information about the book
  - post /books (catches the request from the browser) -> creates action. Handles form data, redirects

R => Read
  - get /books -> index action. Renders an index view (ideally displaying all the books)
  - get /books/:id -> show action. Renders a show view. (Gets the information about the specific book.)

U => Update
  - get books/:id/edit -> edit action. Renders edit view (chooses a specific book entry to edit, renders prefilled form so you can see what you are changing)
  - patch books/:id -> update action. Handles form data then redirects

D => Delete
    - delete /books/:id -> delete action. Deletes chosen resource(book), then redirects. - Typically triggered by a button in the show or index view
