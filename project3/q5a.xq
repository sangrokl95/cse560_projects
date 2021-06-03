(: answer for 1.5a :)

let $books := doc("books.xml")//author/book
for $categories in $books/category
group by $categories
let $books_info :=
  let $mod_books := $books[category = $categories]
  for $titles in $mod_books/title
  group by $titles
  let $prices := $mod_books[title = $titles][1]/price
  order by number($prices) ascending
  return (<title> {$titles} </title>, $prices)
order by $categories ascending
return
  ($books_info[1], $books_info[2], <category> {$categories} </category>)