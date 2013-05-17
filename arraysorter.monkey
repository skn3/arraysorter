Strict
Import comparator

'version 4 (skn3)
' - moved the ascending/descending flag to sort() method call so order is not hard-coded into comparator
' - added bool and string default comparators
' - added SortArray() api function for sorting basic data types
' - updated example to reflect changes
'version 3  (nobu)
' - removed ascending option, added generic comparators and descending option there.
'version 2 (skn3)
' - added ascending option for cocktail sort
'version 1 (skn3)
' - first commit

Private
Global cocktailBoolInstance:ArraySorterCocktail<Bool>
Global cocktailIntInstance:ArraySorterCocktail<Int>
Global cocktailFloatInstance:ArraySorterCocktail<Float>
Global cocktailStringInstance:ArraySorterCocktail<String>

Global boolComparatorInstance:BoolComparator
Global intComparatorInstance:IntComparator
Global floatComparatorInstance:FloatComparator
Global stringComparatorInstance:StringComparator
Public

'Generic array sorter class.  All sorters take two arguments:
'1. the array to be sorted, and 2. a way to compare items in the array (ie: a Comparator).
'The sorter returns 0 when a = b, -1 when a < b, and 1 when a > b.
Class ArraySorter<T> Abstract
	'api
	Method Sort:Void(items:T[], c:Comparator<T>, descending:Bool = False) Abstract
End Class

'implementation of cocktail/shaker sort algorithm
'other sorting algorithms should extend ArraySorter and implement a custom Sort method
Class ArraySorterCocktail<T> Extends ArraySorter<T>
	'api
	Method Sort:Void(items:T[], c:Comparator<T>, descending:Bool = False)
		' --- sort array of items ---
		'we use cocktail sorting: http://en.wikipedia.org/wiki/Cocktail_sort
		
		Local index:Int
		Local beginIndex:Int = -1
		Local endIndex:Int = items.Length - 2
		Local swapped:Bool
		Local compareResult:Int
		Local compareResultMultiplier:Int = 1
		Local tempItem:T
		
		'work out descending multiplier
		If descending compareResultMultiplier = -1
		
		Repeat
			'increases begin because the elements before begin are in correct order
			swapped = False
			beginIndex += 1
			For index = beginIndex To endIndex
				'get comparison result
				compareResult = c.Compare(items[index], items[index + 1]) * compareResultMultiplier
				
				'test it
				If compareResult = 1
					'swap them
					tempItem = items[index + 1]
					items[index + 1] = items[index]
					items[index] = tempItem
					swapped = True
				EndIf
			Next
			
			'check for break
			If swapped = False Exit
			
			'decreases end because the elements after end are in correct order
			swapped = False
			endIndex -= 1
			For index = endIndex To beginIndex Step - 1
				'get comparison result
				compareResult = c.Compare(items[index], items[index + 1]) * compareResultMultiplier
				
				'test it
				If compareResult = 1
					'swap them
					tempItem = items[index + 1]
					items[index + 1] = items[index]
					items[index] = tempItem
					swapped = True
				EndIf
			Next
		Until swapped = False
	End Method
End Class

Function SortArray:Void(items:Bool[], descending:Bool = False)
	' --- helper function for easy default sorting ---
	'make sure our reusable sort instances are created
	If cocktailBoolInstance = Null cocktailBoolInstance = New ArraySorterCocktail<Bool>
	If boolComparatorInstance = Null boolComparatorInstance = New BoolComparator
	
	'do sort
	cocktailBoolInstance.Sort(items, boolComparatorInstance, descending)
End

Function SortArray:Void(items:Int[], descending:Bool = False)
	' --- helper function for easy default sorting ---
	'make sure our reusable search instances are created
	If cocktailIntInstance = Null cocktailIntInstance = New ArraySorterCocktail<Int>
	If intComparatorInstance = Null intComparatorInstance = New IntComparator
	
	'do sort
	cocktailIntInstance.Sort(items, intComparatorInstance, descending)
End

Function SortArray:Void(items:Float[], descending:Bool = False)
	' --- helper function for easy default sorting ---
	'make sure our reusable search instances are created
	If cocktailFloatInstance = Null cocktailFloatInstance = New ArraySorterCocktail<Float>
	If floatComparatorInstance = Null floatComparatorInstance = New FloatComparator
	
	'do sort
	cocktailFloatInstance.Sort(items, floatComparatorInstance, descending)
End

Function SortArray:Void(items:String[], descending:Bool = False)
	' --- helper function for easy default sorting ---
	'make sure our reusable search instances are created
	If cocktailStringInstance = Null cocktailStringInstance = New ArraySorterCocktail<String>
	If stringComparatorInstance = Null stringComparatorInstance = New StringComparator
	
	'do sort
	cocktailStringInstance.Sort(items, stringComparatorInstance, descending)
End