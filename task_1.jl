function krest!(r)
    for side in [Nord,West,Sud,Ost]
        movemarkers!(r,side)
        moveback!(r,side)
    end
    putmarker!(r)
end
function movemarkers!(r,side)
    while isborder(r,side)==0
            move!(r,side)
            putmarker!(r)
    end
end
function moveback!(r,side)
    while ismarker(r)==1
    move!(r,HorizonSide((Int(side)+2)%4))
    end
end
krest!(r)