import UIKit

var greeting = "Hello, playground"


/*
 Değeri daha initialize edilmemiş değişkenlerde işlem yaparken hata verir örnek =>
    ? ile tanımlanırsa değerin olup olmaması öenmli dğeil eğer değer var ise işlemi yaparsa yoksa hiçbirşey yapmaz  çıktı ise nil yani boştur.
        var myString : String?
    
    ! ile tanımlarsa değerin her türlü dolacağını belirtiriz. Değer olmaz ise EXC_BAD_INSTRUCTION hatası vererek crash olur.
    
    ?? koyar isek => Eğer çalışmaz ise ?? işaretinden sonra yazılan default değer ile işlem yapar.
 
 
    if let =>  İşleme devam eğer if let sonraıs koşul false olursa hata vermek yerine false bloğuna düşerek devam eder.
 
 */

var myString : String? // = "Osman"
myString?.uppercased()

var myName : String!
myName.uppercased()


//optionals : ? vs !

var myAge = "f"
var myInteger = Int(myAge) ?? 0 * 5

// if let
if let myNumber = Int(myAge){  // Eğer false dönerse veya hata alırsa else bloğuna düşer.
    print(myNumber * 5)
} else {
    print("Değeri kontrol ediniz")
}


