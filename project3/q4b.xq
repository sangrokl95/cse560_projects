(: answer for 1.4b :)

let $books := doc("books.xml")//author/book
for $titles in $books/title
group by $titles
let $ratings := $books[title = $titles][1]/rating
order by number($ratings) descending
return (<title> {$titles} </title>, $ratings)