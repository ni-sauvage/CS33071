# CS33071
## A Repository for [CSU33071 Compiler Design](https://www.scss.tcd.ie/John.Waldron/CSU33071/CSU33071.html) as taught by [Professor John Waldron](https://www.tcd.ie/research/profiles/?profile=WALDROJ) in 2023 of [SCSS, TCD](https://www.scss.tcd.ie/).

### [Assignment 1](https://github.com/ni-sauvage/CS33071/blob/main/even.l)
A simple assignment which [required](https://www.scss.tcd.ie/John.Waldron/CSU33071/Assignments/even.txt) writing a flex programme to count even numbers in an input stream.

### [Assignment 2](https://github.com/ni-sauvage/CS33071/blob/main/comments.l)
An assignment which [required](https://www.scss.tcd.ie/John.Waldron/CSU33071/Assignments/comments.txt) the creation of a simple preprocessor which could strip single and multiline comments from an input stream, taking into account hardcoded strings.

### [Assignment 3](https://github.com/ni-sauvage/CS33071/blob/main/plates.l)
This assignment [required](https://www.scss.tcd.ie/John.Waldron/CSU33071/Assignments/plates.txt) the implementation of a flex programme which could match [Irish liscence plates](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_the_Republic_of_Ireland) and output the age of the vehicle, in years. This is a tricky programme to implement as there is a myriad of edge cases due to revisions in the standard over the years.

### [Assignment 4](https://github.com/ni-sauvage/CS33071/tree/main/Assignment4)
This [involved](https://www.scss.tcd.ie/John.Waldron/CSU33071/Assignments/roman.txt) designing a [flex](https://github.com/ni-sauvage/CS33071/blob/main/Assignment4/roman.l) & [bison](https://github.com/ni-sauvage/CS33071/blob/main/Assignment4/roman.y) programme which could interpret a roman numeral between 0 and 3999 and output the correct arabic numeral. Most of my programme is in the flex section here, as it was a convenient way to write the rules of roman numerals.

### [Assignment 5](https://github.com/ni-sauvage/CS33071/tree/main/Assignment5)
This [assignment](https://www.scss.tcd.ie/John.Waldron/CSU33071/Assignments/romcalc.txt) involved creating a calculator which could parse an arithmetic expression involving roman numerals from an input stream, calculate the value of the expression, then convert that value back into roman numerals and output it. Unlike assignment 4, the majority of the programme is in the [bison](https://github.com/ni-sauvage/CS33071/blob/main/Assignment5/romcalc.y) part instead of the [flex](https://github.com/ni-sauvage/CS33071/blob/main/Assignment5/romcalc.l) as the flex section merely needed to tokenise the input stream, whereas the bison needed to evaluate the expression. This was done using an [abstract syntax tree](https://en.wikipedia.org/wiki/Abstract_syntax_tree) as this is an idiomatic way of representing expressions and is what bison is created to do.
