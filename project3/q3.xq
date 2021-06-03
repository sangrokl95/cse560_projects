(: answer for 1.3 :)

let $books := doc("books.xml")//author
let $mod_books :=
  for $categories in $books/book/category
  group by $categories
  for $books_info in $books/book,
      $titles in $books/book/title
  where $books_info/category = $categories and $books_info/title = $titles
  group by $titles
  return
    <output>
      {
        <category> {$categories[1]} </category>,
        $books_info[1]/title,
        $books_info[1]/price,
        $books_info/parent::author/name
      }
    </output>
let $avg_gp := avg($mod_books/price)
let $avg_cp := 
  for $categories2 in $mod_books/category
  group by $categories2
  return
    <output>
      {
        <category> {$categories2} </category>,
        <price> {avg($mod_books[category = $categories2]/price)} </price>
      }
    </output>
let $avg_above := $avg_cp[price > $avg_gp]/category
let $new_books :=
  let $mod2_books := $mod_books[category = $avg_above]
  for $categories3 in $mod2_books/category
  group by $categories3
  return <categories> {$mod_books[category = $categories3 and price = max($mod_books/price)]} </categories>
return <result> {$new_books} </result>