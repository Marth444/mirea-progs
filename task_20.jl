function corner(r)
    Flg = true
    while !isborder(r,Sud) || Flg 
        if !isborder(r,Sud)
            move!(r,Sud)
        end
        if isborder(r,Sud)
            Flg =  ob(r,2)
        end
    end
    while !isborder(r,West)
        move!(r,West)
    end
    if !isborder(r,Nord)
        move!(r,Nord)
    else
        ob(r,0)
    end
end

function ob(r,Side)
    x = 0
    Flg = true
    while isborder(r,HorizonSide(Side)) && !isborder(r,HorizonSide((Side + 3) % 4))
        move!(r,HorizonSide((Side + 3) % 4))
        x += 1
    end
    if isborder(r,HorizonSide(Side)) && isborder(r,HorizonSide((Side + 3) % 4))
        Flg = false
    end
    if  !isborder(r,HorizonSide(Side))     
        move!(r,HorizonSide(Side))
    end
    while !isborder(r,HorizonSide(Side)) && isborder(r,HorizonSide((Side + 1) % 4))
        move!(r,HorizonSide(Side))
    end
    for i = 1:x
        move!(r,HorizonSide((Side+1) % 4))
    end
    return Flg
end

function counter(r)
    c1 = 0
    c2 = 0
    FlagCount = true
    while  !isborder(r,Ost) || FlagCount
        if isborder(r,Sud)
            c1 += 1
        else
            if c1 != 0
                c2 += 1
            end
            c1 = 0
        end
        if !isborder(r,Ost)
            move!(r,Ost)
        else
            FlagCount = false
            if c1 != 0
                c2 += 1
            end
        end
    end
    while !isborder(r,West)
        move!(r,West)
    end
    return(c2)
end


function task_20(r)
    corner(r)
    Flg2 = true
    sum = 0
    while !isborder(r,Nord) 
        sum += counter(r)
        if !isborder(r,Nord)
            move!(r,Nord)
        end
    end
    sum += counter(r)
    return sum
end
task_20(r)