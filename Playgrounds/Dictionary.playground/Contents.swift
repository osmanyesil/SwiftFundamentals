import UIKit

/*
 Key,Value ile verileri tutmaktadır. Anahtar ve değer eşleşmeside denir(key-value pairing)
 
 */

var myFavoriteDirectors = ["Pulp Fiction" : "Tarantino",
                           "Lock,Stock":"Guy Ritchie",
                           "The Dark Knight":"Cristopher Nolan"]

//Value okuma
myFavoriteDirectors["Pulp Fiction"]  // İlgili key'in value bilgisini getir.
myFavoriteDirectors["The Dark Knight"]

//Value Değiştirme
myFavoriteDirectors["Pulp Fiction"]  = "Quentin Tarantino" // İlgili key'e değer atadık.

print(myFavoriteDirectors)


//Key-Value ekleme
myFavoriteDirectors["Dağ 2"] = "Alper Çağlar"
print(myFavoriteDirectors)



var myDictionary = ["Run":100,"Football":200,"Basketball":300]
myDictionary["Run"]


/**
 Array, Dictionary ,Set ler de veri koleksiyonunu saklamak için kullanılır.
 Sıralı olsun istiyor isek Array ler
 İçinde her elemandan bir tane olsun istiyor isek Set leri
 Key-Value şeklinde tutmak istiyor isek de Dictionary leri kullanabiliriz.
 
 
 */


var myList = [["Atil" : 60, "Hikmet" : 45],["Bar" : 2, "Zeynep" : 50]]
print(myList[1]["Bar"]!)
