import UIKit



/**
     Kısacası fonksiyonlar kod bloğu anlamına gelir
        Kodlarımızı düzenlemeye ve bloklu tutmamıza yarar.
        Fonksiyonlar Input & Output & Return ile daha kullanışlı hale getirilir.
 
 
 */
var greeting = "Hello, playground"


func myFunction(){
   print("myFunction print")
}
myFunction()

//void Function
func sumFunction(x : Int , y : Int){
    print(x+y)
}
sumFunction(x: 10, y: 20)

//Geriye değer dönen function -> Int
func sumFunctionReturn( x : Int, y : Int) -> Int{
    return (x * y)
}
let myFunctionVariable = sumFunctionReturn(x: 10, y: 2)
print(myFunctionVariable)
print(sumFunctionReturn(x : 5 , y : 2 ) )




// A sayısı b sayısından küçük mü ?
func logicFuntion (a: Int , b: Int) ->Bool {
    if a < b{
        return true
    } else {
        return false
    }
}

let logicVariable = logicFuntion(a: 10, b: 11)
print(logicVariable)
