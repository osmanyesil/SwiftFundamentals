import UIKit

/*
 <  Küçüktür
 >  Büyüktür
 == Eşittir
 != Eşit Dğeildir
 && AND
 || OR
 */

var myAge = 30

if myAge < 30 {
    print("30 -")
} else if myAge > 30 && myAge < 40 {
    print("30..40")
} else if myAge == 30 {
    print("30")
}else{
    print("40 ++")
}



3 < 5 && 5 < 7  // And operatörü = true ve true => Çıktı => True

3 < 5 ||  8 < 7 // Veya operatörü= Koşuldan bir tanesinin true olması yeterlidir.

var myString = "Osman"

if myString == "Osman" {
    print("YEŞİL")
}
