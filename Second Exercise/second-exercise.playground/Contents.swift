import Cocoa
import Foundation

class MyBirthday{
    var year = 1994
    var sixtyFour: Int {
        get{
            self.year + 64
        }
    }
}

var bday = MyBirthday()
print(bday.sixtyFour)







