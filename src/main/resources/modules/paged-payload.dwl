%dw 2.0
output application/json
---
{
    data: payload.data[vars.startIndex to vars.endIndex],
    links: {
        self: vars.linkSelf ++ '?page=' ++ vars.page ++ '&perPage=' ++ vars.perPage as String,
        next: 
  		   if (vars.page == vars.numberPages as String)
        	vars.linkSelf ++ '?page=' ++ vars.page ++ '&perPage=' ++ vars.perPage as String
  		   else      
        	vars.linkSelf ++ '?page=' ++ (vars.page + 1) ++ '&perPage=' ++ vars.perPage as String,
        previous:
           if ( vars.page == '1')
            vars.linkSelf ++ '?page=1&perPage=' ++ vars.perPage
           else
            vars.linkSelf ++ '?page=' ++ (vars.page - 1) ++ '&pageCount=' ++ vars.perPage as String,
        last: 
        	vars.linkSelf ++ '?page=' ++ vars.numberPages ++ '&pageCount=' ++ vars.perPage as String
  }
}
