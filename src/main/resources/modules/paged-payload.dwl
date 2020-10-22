%dw 2.0
output application/json
var maxItemCount = '&maxItemCount=' ++ vars.maxItemCount as String default ""
var range = vars.startIndex as Number to vars.endIndex as Number
var basePath = vars.linkSelf default "/"
var pageOne = 1
var previous = vars.startItem as Number - vars.maxItemCount as Number
var pageLast = vars.initialSize as Number - vars.moduloRecords as Number + 1
fun navigateLink(startItem) = basePath ++ '?startItem=' ++ (startItem default "1") ++ maxItemCount as String
---
{
	
// Indexed JSON or XML Data	
    data: payload.data[range],

// HATEOAS Navigation 
    links: {

        self: navigateLink(vars.startItem),

        next:
         
           if (vars.endIndex == (vars.maxItemCount as Number * (vars.numItemGroups as Number - 1) + (vars.moduloRecords - 1)))
			 navigateLink(vars.StartItem)            
  		   else 
  		     navigateLink(vars.startItem as Number + vars.maxItemCount as Number),    

        previous:

           // page 1
           if ( vars.startItem == '1')
             navigateLink(pageOne)

           // can move back
           else 
             navigateLink(previous),

        last:
             navigateLink(pageLast) 
  }
}
