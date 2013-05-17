'Naive implementation of Java comparators
'Nobuyuki, 03 April 2013  (nobu@subsoap.com)

'Summary: Returns -1-1 based on sort values. Extend this and make your own comparators to whatever type you like.
'			Note:  Make sure comparator returns 0 if objects are equal, or else TimSort<T> will throw an error!

Class Comparator<T>
	Method Compare:Int(lhs:T, rhs:T)
		Error("Comparator<T> can't be instantiated directly. Please extend the class and override this method.")
	End Method
End Class

Class IntComparator Extends Comparator<Int>
	Field Descending:Bool
	
	Method New(descending:Bool)
		Descending = descending
	End Method

	Method Compare:Int(lhs:Int, rhs:Int)
		If Descending
			If lhs < rhs Then Return 1
			If lhs > rhs Then Return - 1
			Return 0
		Else
			If lhs < rhs Then Return - 1
			If lhs > rhs Then Return 1
			Return 0
		End If
	End Method
End Class

Class FloatComparator Extends Comparator<Float>
	Field Descending:Bool
	
	Method New(descending:Bool)
		Descending = descending
	End Method

	Method Compare:Float(lhs:Float, rhs:Float)
		If Descending
			If lhs < rhs Then Return 1
			If lhs > rhs Then Return - 1
			Return 0
		Else
			If lhs < rhs Then Return - 1
			If lhs > rhs Then Return 1
			Return 0
		End If
	End Method
End Class
