import UIKit

var greeting = "Hello, playground"
/*
 Variables & Constants(var = Değişkenler <=> let = Sabitler )
    snake_case =   Örnek => user_sur_name
    camelCase  =   Örnek => userName
    PascalCase =   Örnek => UserName
    
 
 mutable => Değeri sonradan değiştirilebilir.
 inmutable => Değeri sonradan değiştirilemez
*/

/*
 var =>
    Değişkenler için kullanılır (Mutable)
        Örnek =>    Uygulama içinde tutulacak değişken tanımları için kullanılır.
        var userName="Osman"
 */
    var myNumber = 5*2
    print(myNumber)

    var userName="Osman"
    var userSurname="YEŞİL"
    print(userName)
    print(userSurname)


/*
 let =>
    Constant sabit uygulama içinde değeri değiştirilemez(Inmutable)
        Örnek =>     Uygulama içinde değiştirilmeden kullanılacak sabitler için kullanırız.
        let pi=3.14
*/
    var userAge=50.0
    let pi = 3.14
    userAge*pi

/* Variables Type
 String =  Metinsel ifadeler için kullanılır.
 Integer=  Tam sayılar için kullanılır
 Double =  Kesirli sayılar için kullanılır
 Float  =  Değişkeninizin değeri küsuratlı bir sayı ise double veya float kullanabilirsiniz. Double ile               float arasındaki fark ise double 64 bit sayıları temsil ederken float ise 32 bit sayıları    temsil eder.
 Booleaan = True/False
*/
    var userNameSurname="Osman"
    userName.append(contentsOf: " YESIL")  //Sonuna karakter ekler (append)
    userName.lowercased()                  //String ifadeyi kucuk karakterlere çevirir (lowercased)
    userName.uppercased()                  //String ifadeyi büyük karakterlere çevirir (uppercased)
    
    let userAge2=50
    let myNumber2=4
    userAge2 / myNumber //Integer 'ı integer a boldugumuzde sonuç tam sayı olur

    let userAge3=50.0
    let myNumber3=4.0
    userAge2 / myNumber

    var myBoolean = false
    myBoolean=true



//------ PART2 ------//


let myString : String = "Osman YEŞİL"
var anotherNumber : String = String(28)

//myVariable değişkenin define (tanımladık) fakat initialization(başlatmadık.)
let myVariable : String  //define etmek // Tanımını yapmak
myVariable="Test" //initializate etmek  //Değer atamak



let myVariable2:String = "TestConstantLetVariable"
let myVariable3:String = myVariable2.uppercased()
print(myVariable3)
 
