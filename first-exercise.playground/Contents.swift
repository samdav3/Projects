import Cocoa

var one = 3
var two = 30
var three = 33
var four = 333
var five = 303

let oneCon = 9
let twoCon = 90
let threeCon = 99
let fourCon = 999
let fiveCon = 909

var array = [Int]()
array.append(one)
array.append(two)
array.append(three)
array.append(four)
array.append(five)
array.append(oneCon)
array.append(twoCon)
array.append(threeCon)
array.append(fourCon)
array.append(fiveCon)
array.sort(by: <)

print(array)

var dic = ["T":one, "TY":two, "TT":three, "TTT":four, "TOT":five, "OC":oneCon, "TC":twoCon, "TRC":threeCon, "FC":fourCon, "FVC":fiveCon]

dic["T"] = 4
print(dic)
