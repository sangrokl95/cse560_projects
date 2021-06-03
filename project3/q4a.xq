(: answer for 1.4a :)

let $books := doc("books.xml")//author/book
for $titles in $books/title
group by $titles
let $prices := $books[title = $titles][1]/price
order by number($prices) ascending
return (<title> {$titles} </title>, $prices)