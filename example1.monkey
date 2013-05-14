Strict

Import skn3.arraysorter

'create our custom item sorter here
'we are extending the cocktail sorter
Class ItemSorter Extends ArraySorterCocktail<Item>
	Private
	Method Compare:Int(a:Item, b:Item)
		' --- compare the two items ---
		If a.order > b.order Return 1
		If a.order < b.order Return - 1
		Return 0
	End
	Public
End

'custom item class
Class Item
	Field id:String
	Field order:Int
	
	Method New(id:String, order:Int)
		Self.id = id
		Self.order = order
	End
End

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
	
	'create an instance of sorter
	'this could be created globally and reused
	Local sorter:= New ItemSorter
	
	'sort the array of items
	sorter.Sort(items)
	
	'output the contents of array
	For Local index:= 0 Until items.Length
		Print "index = " + index + " id = " + items[index].id
	Next
	
	'must return something for strict mode
	Return 0
End