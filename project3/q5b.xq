(: answer for 1.5b :)

let $books := doc("books.xml")//author/book
for $categories in $books/category
group by $categories
let $books_info :=
  let $mod_books := $books[category = $categories]
  for $titles in $mod_books/title
  group by $titles
  let $ratings := $mod_books[title = $titles][1]/rating
  order by number($ratings) descending
  return (<title> {$titles} </title>, $ratings)
order by $categories ascending
return
  ($books_info[1], $books_info[2], <category> {$categories} </category>)