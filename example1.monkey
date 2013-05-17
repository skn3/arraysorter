Strict
Import arraysorter
Import comparator

'create our custom item comparator here.
'we are telling the cocktail sorter to compare Items using this method.
Class ItemComparator Extends Comparator<Item>
	Field Descending:Bool
	
	Method New(descending:Bool)
		Descending = descending
	End Method

	Method Compare:Int(a:Item, b:Item)
		' --- compare the two items ---
		If Descending
			If a.order > b.order Return - 1
			If a.order < b.order Return 1
			Return 0
		Else
			If a.order > b.order Return 1
			If a.order < b.order Return - 1
			Return 0
		End If
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
	Local itemComparison:= New ItemComparator(False)  '<-- set this to True for descending sort
	Local sorter:= New ArraySorterCocktail<Item>
	
	'sort the array of items in ascending order
	sorter.Sort(items, itemComparison)
	
	'output the contents of array
	For Local index:= 0 Until items.Length
		Print "index = " + index + " id = " + items[index].id
	Next
	
	'must return something for strict mode
	Return 0
End Function 