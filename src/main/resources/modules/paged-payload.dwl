%dw 2.0
output application/json
---
{
    data: payload.data[vars.startIndex to vars.endIndex],
    links: {
        self: vars.linkSelf ++ "?page=1&perPage=" ++ vars.perPage as String,
        next: vars.linkSelf ++ "?page=" ++ (vars.page + 1) ++ "&perPage=" ++ vars.perPage as String,
        previous:
           if ( vars.page == "1")
            vars.linkSelf ++ "?page=1&perPage=" ++ vars.perPage
           else
            vars.linkSelf ++ '?page=' ++ (vars.page - 1) ++ '&pageCount=' ++ vars.perPage as String,
        last: vars.linkSelf ++ '?page=' ++ vars.numberPages + 1 ++ '&pageCount=' ++ vars.perPage as String
  }
}
