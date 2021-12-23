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

function ob2(r,Side)
    a = 0
    b = 0
    x = 0
    Flg = true
    while isborder(r,HorizonSide(Side)) && !isborder(r,HorizonSide((Side + 1) % 4))
        move!(r,HorizonSide((Side + 1) % 4))
        x += 1
        a += 1
    end
    if isborder(r,HorizonSide(Side)) && isborder(r,HorizonSide((Side + 1) % 4))
        Flg = false
    end
    if  !isborder(r,HorizonSide(Side))     
        move!(r,HorizonSide(Side))
    end
    while !isborder(r,HorizonSide(Side)) && isborder(r,HorizonSide((Side + 3) % 4))
        move!(r,HorizonSide(Side))
        b += 1
    end
    for i = 1:x
        move!(r,HorizonSide((Side+3) % 4))
    end
    return Flg, (a)*(b)
end

function corner(r)
    Flg = true
    y = true
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
end

function scan(r)
    Flg = true
    sum = 0
    Z = 0
    if !isborder(r,Nord)
        Flg = true
        move!(r,Nord)
        while !isborder(r,Ost) || Flg
            if !isborder(r,Ost)
                move!(r,Ost)
            else
                Flg, Z = ob2(r,3)
                if sum < Z
                    sum = Z
                end
            end
        end
    end
    Flg = true
    while !isborder(r, West) || Flg
        if !isborder(r, West)
            move!(r, West)
        else
            Flg = ob(r,1)
        end
    end
    return sum
end

function task_24(r)
    sum = 0
    Z = 0
    corner(r)
    while !isborder(r,Nord)
        Z = scan(r)
        if sum < Z
            sum = Z
        end
    end
    return sum
end

task_24(r)