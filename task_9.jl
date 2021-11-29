function spiral(r)
    c=1
    side=Ost:: HorizonSide 
    while ismarker(r) == 0
        side = HorizonSide((Int(side)+1)%4)
        flag=movements!(r,c, side)
        side=HorizonSide((Int(side)+1)%4)
        flag=movements!(r,c, side)
        if flag == 1
            break
        end
        c=c+1
    end
end
function movements!(r, c, side)
flag=true
    for i = 1:c
        if ismarker(r)==1
            flag = false
            return flag
        end
    move!(r,side)
    end
end
      
spiral(r)

    