import UIKit


/**Array (Diziler)
    Birden fazla değişkeni bir arada tutmamızı sağlayan yapıdır.

 
 as => Casting işlemi
 as [Any]  => Dizinin içine her tipde veri alabilirsin demek.
    Avantajı => Her tipi içerisine alabilir.
    Dezavantajı => String array de ulaşılan bazı fonksiyonlar kullanılamaz(Uppercase,Lowercased vb.)
 
 
 
 **/

//Any array
var myFavoriteMovies = ["Matrix","LOTR","Saved Private Ryan",5] as [Any]


myFavoriteMovies[0]
myFavoriteMovies[1]
myFavoriteMovies[2]
myFavoriteMovies[3]

//String Array
var myStringArray = ["Test","Test2","Test3","Test4"]

myStringArray[0].uppercased()
myStringArray[1].lowercased()
myStringArray[2].append(contentsOf: "_OSMAN")


myStringArray[myStringArray.count - 2 ] // Dizinin son elemanından bir önceki elemanı
myStringArray.last  // Dizinin son elemanı


myStringArray.sort()  // Dizileri sıralamak için kullanılır


//Integer Array
var myNumberArray=[1,2,3,4,5]
myNumberArray.append(8)  //Array son elemanı ekleme



//------ Set ------//


/*Set = Array gibidir fakat indisleme yoktur ve aynı tipte sadece bir eleman olabilir.
        Kullanım Amacı => Array içindeki üyeleri unique hale getirir. Mükerrerleri kaldırır.
        
        Unordered Collection => Sıralı olmayan koleksiyonlar denir.
        Her eleman unique'dir.
    
 */


//Set tanımlama
var mySet : Set = [0,1,2,3,4,5,1,2]
mySet

var myStringSet: Set = ["a","b","c","a","b","x"]
myStringSet


//Array içindeki elemanları unique hale getirme
var myInternetArray = [0,1,2,3,4,5,2,3,1,3]  //Array
var myInternetSet = Set(myInternetArray)  //Set Array,Unique
print(myInternetArray)
print(myInternetSet)



//İki Set dizisini birleştirme
var mySet1: Set = [1,2,3]
var mySet2: Set = [3,4,5]

var mySet3 = mySet1.union(mySet2)  //Union birleştir


