Strict

'version 1
' - first commit

'generic array sorter class
'your final array sorter class should implement the Compare method. It should return 0 when a = b, -1 when a < b, 1 when a > b
Class ArraySorter<T> Abstract
	'internal
	Method Compare:Int(a:T, b:T) Abstract
	Method Sort:Void(items:T[], ascending:Bool = True) Abstract
End

'implementation of cocktail/shaker sort algorithm
'other sorting algorithms should extend ArraySorter and implement custom Sort method
Class ArraySorterCocktail<T> Extends ArraySorter<T> Abstract
	'internal
	Method Sort:Void(items:T[], ascending:Bool = True)
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
				compareResult = Compare(items[index], items[index + 1])
				
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
				compareResult = Compare(items[index], items[index + 1])
				
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
	End
End