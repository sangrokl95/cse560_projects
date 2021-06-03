(: answer for 1.2 :)

let $output :=
  for $books in doc("books.xml")//author,
      $titles in $books/book/title
  group by $titles
  let $names := $books/name,
      $books_info := $books[1]/book[title = $titles]
  where count($names) > 1
  for $mod_books in <output> {$names, $books_info} </output>,
      $mod_names in <output> {$names} </output>
  group by $mod_names
  for $new_books in $mod_books[count($mod_books) > 1]
  return $new_books
return <coauthor> {$output} </coauthor>