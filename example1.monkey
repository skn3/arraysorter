Strict
Import arraysorter
Import comparator

'create our custom item comparator here.
'we are telling the cocktail sorter to compare Items using this method.
Class ItemComparator Extends Comparator<Item>
	Method Compare:Int(a:Item, b:Item)
		' --- compare the two items ---
		If a.order > b.order Return 1
		If a.order < b.order Return - 1
		Return 0
	End Method
End Class

'custom item class
Class Item
	Field id:String
	Field order:Int
	
	Method New(id:String, order:Int)
		Self.id = id
		Self.order = order
	End Method
End Class

'test program
Function Main:Int()
	'create some items to sort
	Local items:Item[6]
	items[0] = New Item("item1(bottom)", 999)
	items[1] = New Item("item2", 10)
	items[2] = New Item("item3", 20)
	items[3] = New Item("item4", 30)
	items[4] = New Item("item5", 40)
	items[5] = New Item("item6(top)", -999)
	
	'create an instance of sorter; this could be created globally and reused.
	'also create a new itemComparator with ascending sort enabled.
	Local itemComparison:= New ItemComparator()
	Local sorter:= New ArraySorterCocktail<Item>
	
	'sort the array of items in ascending order
	sorter.Sort(items, itemComparison, False)
	
	'output the contents of array
	Print "[Items Array]"
	For Local index:= 0 Until items.Length
		Print " index[" + index + "] = " + items[index].id
	Next
	Print ""
	
	'do search of bool array
	Local boolItems:=[False, True, False, True, True, True, False, True]
	SortArray(boolItems)
	
	'output the contents of array
	Print "[Bool Array]"
	For Local index:= 0 Until boolItems.Length
		Print " index[" + index + "] = " + Int(boolItems[index])
	Next
	Print ""
	
	'do search of int array
	Local intItems:=[999, 123123, 1, -2333, 44, -68]
	SortArray(intItems)
	
	'output the contents of array
	Print "[Int Array]"
	For Local index:= 0 Until intItems.Length
		Print " index[" + index + "] = " + intItems[index]
	Next
	Print ""
	
	'do search of float array
	Local floatItems:=[1.1234, 1.234, 1.334, 999, -543.22, 0.01]
	SortArray(floatItems)
	
	'output the contents of array
	Print "[Float Array]"
	For Local index:= 0 Until floatItems.Length
		Print " index[" + index + "] = " + floatItems[index]
	Next
	Print ""
	
	'do search of string array
	Local stringItems:=["hello", "world", "how", "are", "you"]
	SortArray(stringItems)
	
	'output the contents of array
	Print "[String Array]"
	For Local index:= 0 Until stringItems.Length
		Print " index[" + index + "] = " + stringItems[index]
	Next
		
	'must return something for strict mode
	Return 0
End Function 