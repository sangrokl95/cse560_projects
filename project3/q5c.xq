(: answer for 1.5c :)

let $books := doc("books.xml")//author/book
for $categories in $books/category
group by $categories
let $books_info :=
  let $mod_books := $books[category = $categories]
  for $titles in $mod_books/title
  group by $titles
  let $ratings := $mod_books[title = $titles][1]/rating
  let $prices := $mod_books[title = $titles][1]/price
  order by number($ratings) descending
  let $output := <output> {<title> {$titles} </title>, $ratings, $prices} </output>
  return $output[price < 620]
order by $categories ascending
return ($books_info[1]/*,<category> {$categories} </category>)