(: answer for 1.6 :)

let $output :=
  for $books in doc("books.xml")//author
  for $titles in $books/book/title
  group by $titles
  let $books_info := $books[1]/book[title = $titles]
  return
    <book year = "{$books_info/@year}">
      <title> {$titles} </title>
      {$books_info/category}
      {$books_info/rating}
      {$books_info/price}
      <author> {$books/name} </author>
    </book>
return <biblio> {$output} </biblio>