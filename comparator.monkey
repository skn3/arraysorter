'Native implementation of Java comparators
'Nobuyuki, 03 April 2013  (nobu@subsoap.com)

'Summary: Returns -1-1 based on sort values. Extend this and make your own comparators to whatever type you like.
'			Note:  Make sure comparator returns 0 if objects are equal, or else TimSort<T> will throw an error!

Class Comparator<T> Abstract
	Method Compare:Int(lhs:T, rhs:T) Abstract
End Class

Class BoolComparator Extends Comparator<Bool>
	Method Compare:Int(lhs:Bool, rhs:Bool)
		If lhs = True and rhs = False Then Return 1
		If lhs = False And rhs = True Then Return -1
		Return 0
	End Method
End Class

Class IntComparator Extends Comparator<Int>
	Method Compare:Int(lhs:Int, rhs:Int)
		If lhs < rhs Then Return - 1
		If lhs > rhs Then Return 1
		Return 0
	End Method
End Class

Class FloatComparator Extends Comparator<Float>
	Method Compare:Int(lhs:Float, rhs:Float)
		If lhs < rhs Then Return - 1
		If lhs > rhs Then Return 1
		Return 0
	End Method
End Class

Class StringComparator Extends Comparator<String>
	Method Compare:Int(lhs:String, rhs:String)
		If lhs < rhs Then Return - 1
		If lhs > rhs Then Return 1
		Return 0
	End Method
End Class