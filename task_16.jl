function ob(r,Side)
    x = 0
    Flag = true
    while isborder(r,HorizonSide(Side)) && !isborder(r,HorizonSide((Side + 3) % 4))
        move!(r,HorizonSide((Side + 3) % 4))
        x += 1
    end
    if isborder(r,HorizonSide(Side)) && isborder(r,HorizonSide((Side + 3) % 4))
        Flag = false
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
    return Flag
end

function ob2(r,Side,y)
    x = 0
    Flag = true
    while isborder(r,HorizonSide(Side)) && !isborder(r,HorizonSide((Side + 3) % 4))
        move!(r,HorizonSide((Side + 3) % 4))
        x += 1
    end
    if isborder(r,HorizonSide(Side)) && isborder(r,HorizonSide((Side + 3) % 4))
        Flag = false
    end
    if  !isborder(r,HorizonSide(Side))     
        move!(r,HorizonSide(Side))
        y+=1
    end
    while !isborder(r,HorizonSide(Side)) && isborder(r,HorizonSide((Side + 1) % 4))
        move!(r,HorizonSide(Side))
        y+= 1
    end
    for i = 1:x
        move!(r,HorizonSide((Side+1) % 4))
    end
    return Flag,y
end

function ob3(r,Side,y)
    x = 0
    Flag = true
    while isborder(r,HorizonSide(Side)) && !isborder(r,HorizonSide((Side + 3) % 4))
        move!(r,HorizonSide((Side + 3) % 4))
        x += 1
    end
    if isborder(r,HorizonSide(Side)) && isborder(r,HorizonSide((Side + 3) % 4))
        Flag = false
    end
    if  !isborder(r,HorizonSide(Side))     
        move!(r,HorizonSide(Side))
        y-=1
    end
    while !isborder(r,HorizonSide(Side)) && isborder(r,HorizonSide((Side + 1) % 4))
        move!(r,HorizonSide(Side))
        y-= 1
    end
    for i = 1:x
        move!(r,HorizonSide((Side+1) % 4))
    end
    return Flag,y
end
function corner(r)
    Flag = true
    y = 0
    z = 0
    while !isborder(r,Sud) || Flag 
        if !isborder(r,Sud)
            move!(r,Sud)
            y += 1
        end
        if isborder(r,Sud)
            Flag,y =  ob2(r,2,y)
        end
    end
    while !isborder(r,West)
        move!(r,West)
        z += 1
    end
    return y,z
end

function marks(r)
    Flag2 = true
    
    while !isborder(r,Nord) || Flag2
        Flag1 = true
        while !isborder(r,Ost) || Flag1
            putmarker!(r)
            if !isborder(r,Ost)
                move!(r,Ost)
            else
                Flag1 = ob(r,3)
            end
        end
        Flag1 = true
        while !isborder(r,West) || Flag1
            if !isborder(r,West)
                move!(r,West)
            else
                Flag1 = ob(r,1)
            end
        end
        if !isborder(r,Nord)
            move!(r,Nord)
        else
            Flag2 = ob(r,0)
        end
    end

end

function obratno(r,y,z)
    Flag = true
    while !isborder(r,Sud)
        move!(r,Sud)
    end
    while !isborder(r,West)
        move!(r,West)
    end
    for i = 1:z
        move!(r,Ost)
    end
    while y > 0
        if !isborder(r,Nord)
            move!(r,Nord)
            y -= 1
        else
            Flag, y = ob3(r,0,y)
        end
    end
    
end

function task_16(r)
    y = 0
    z = 0
    y, z = corner(r)
    marks(r)
    obratno(r,y,z)
end

task_16(r)

