%dw 2.0
output application/json
---
{
    data: payload.data[vars.startIndex to vars.endIndex],
    links: {
        self: vars.linkSelf ++ '?startItem=' ++ vars.startItem ++ '&maxItemCount=' ++ vars.maxItemCount as String,
        next: 
           if (vars.endIndex == (vars.maxItemCount * (vars.numItemGroups - 1) + (vars.moduloRecords - 1)))
            vars.linkSelf ++ '?startItem=' ++ vars.startItem ++ '&maxItemCount=' ++ vars.maxItemCount as String
  		   else      
        	vars.linkSelf ++ '?startItem=' ++ (vars.startItem + vars.maxItemCount) ++ '&maxItemCount=' ++ vars.maxItemCount as String,
        previous:
           if ( vars.startItem == '1')
            vars.linkSelf ++ '?startItem=1&maxItemCount=' ++ vars.maxItemCount
           else
            vars.linkSelf ++ '?startItem=' ++ (vars.startItem - vars.maxItemCount) ++ '&maxItemCount=' ++ vars.maxItemCount as String,
        last: 
        	vars.linkSelf ++ '?startItem=' ++ (vars.initialSize - vars.moduloRecords + 1) ++ '&maxItemCount=' ++ vars.maxItemCount as String
  }
}
