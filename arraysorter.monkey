Strict
Import comparator

'version 3  (nobu)
' - removed ascending option, added generic comparators and descending option there.
'version 2
' - added ascending option for cocktail sort
'version 1
' - first commit

'Generic array sorter class.  All sorters take two arguments:
'1. the array to be sorted, and 2. a way to compare items in the array (ie: a Comparator).
'The sorter returns 0 when a = b, -1 when a < b, and 1 when a > b.
Class ArraySorter<T> Abstract
	Method Sort:Void(items:T[], c:Comparator<T>) Abstract
End Class 

'implementation of cocktail/shaker sort algorithm
'other sorting algorithms should extend ArraySorter and implement a custom Sort method
Class ArraySorterCocktail<T> Extends ArraySorter<T>
	'internal
	Method Sort:Void(items:T[], c:Comparator<T>)
		' --- sort array of items ---
		'we use cocktail sorting: http://en.wikipedia.org/wiki/Cocktail_sort
		
		Local index:Int
		Local beginIndex:Int = -1
		Local endIndex:Int = items.Length - 2
		Local swapped:Bool
		Local compareResult:Int
		Local tempItem:T
				
		Repeat
			'increases begin because the elements before begin are in correct order
			swapped = False
			beginIndex += 1
			For index = beginIndex To endIndex
				'get comparison result
				compareResult = c.Compare(items[index], items[index + 1])
				
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
				compareResult = c.Compare(items[index], items[index + 1])
				
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