(: answer for 1.1 :)

for $books in doc("books.xml")//author,
    $titles in $books/book/title
group by $titles
let $names := $books/name
where count($names) > 1 and $names = "Jeff"
return <book> {<title> {$titles} </title>, $names} </book>