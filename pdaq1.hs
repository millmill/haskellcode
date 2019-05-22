type Transition = ((Int,String,String),(Int,String))
type PDA = (Int,[Int],[Transition])
data Result = Accept | Reject deriving Show
type Configuration = (Int,String,String)

pal = (1,[2],[((1,"a",""),(1,"a")),
        ((1,"b",""),(1,"b")),
        ((1,"a",""),(2,"")),
        ((1,"b",""),(2,"")),
        ((1,"",""),(2,"")),
        ((2,"a","a"),(2,"")),
        ((2,"b","b"),(2,""))])

run :: PDA -> String -> Result
-- takes pda and string passes transitions and string to updatingstack function
run (startpt,fs,trans) checkpal = checkaccept (updatingstack trans (startpt,checkpal,""))


checkaccept :: [Result] -> Result
checkaccept [] = Reject
checkaccept results@(hd:tl) = if show hd == show Accept then Accept else checkaccept tl


updatingstack :: [Transition] -> Configuration -> [Result]
-- takes transition and string 
-- list comprehension:
-- takes transition (x) 
-- the @ symbol tells computer that x contains something and to unpack it
-- x for x in transition where d == currentvalue and e == head of string OR is empty
-- currv currentvalue
-- hd:tl head:tail
-- trans transition
updatingstack c (currv, [], []) = [Accept]
updatingstack c (currv, [], stack) = [Reject]
updatingstack c (currv,qq@(hd:tl),stack) = concat [if e == "" then updatingstack c (goto,qq,pushpop push pop stack) else updatingstack c (goto,tl, pushpop push pop stack) | trans@((from,e,pop),(goto,push)) <- c, from == currv, e == [hd] || e == ""]


pushpop :: String -> String -> String -> String
pushpop [] [] [] = []
pushpop [] [] stck = stck
pushpop push [] [] = push
pushpop push [] stck = push++stck
pushpop [] pop [] = "REJECT"
pushpop [] pop stck@(hd:tl) = if pop == [hd] then tl else "REJECT"
pushpop push pop [] = "REJECT"
pushpop push pop stck@(hd:tl) = if pop == [hd] then push++tl else "REJECT"


-- pal for terminal entry:
-- pal = (1,[2],[((1,"a",""),(1,"a")),((1,"b",""),(1,"b")),((1,"a",""),(2,"")),((1,"b",""),(2,"")),((1,"",""),(2,"")),((2,"a","a"),(2,"")),((2,"b","b"),(2,""))])
