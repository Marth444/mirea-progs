using  HorizonSideRobots

function Obhod2(r,side)
    a = 0
    b = 0
    x = 0
    Flg = true
    while isborder(r,HorizonSide(side)) && !isborder(r,HorizonSide((side + 1) % 4))
        move!(r,HorizonSide((side + 1) % 4))
        x += 1
        a += 1
    end
    if isborder(r,HorizonSide(side)) && isborder(r,HorizonSide((side + 1) % 4))
        Flg = false
    end
    if  !isborder(r,HorizonSide(side))     
        move!(r,HorizonSide(side))
    end
    while !isborder(r,HorizonSide(side)) && isborder(r,HorizonSide((side + 3) % 4))
        move!(r,HorizonSide(side))
        b += 1
    end
    for i = 1:x
        move!(r,HorizonSide((side+3) % 4))
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
            Flg =  obhod(r,2)
        end
    end
    while !isborder(r,West)
        move!(r,West)
    end
end


function obhod(r,side)
    x = 0
    Flg = true
    while isborder(r,HorizonSide(side)) && !isborder(r,HorizonSide((side + 3) % 4))
        move!(r,HorizonSide((side + 3) % 4))
        x += 1
    end
    if isborder(r,HorizonSide(side)) && isborder(r,HorizonSide((side + 3) % 4))
        Flg = false
    end
    if  !isborder(r,HorizonSide(side))     
        move!(r,HorizonSide(side))
    end
    while !isborder(r,HorizonSide(side)) && isborder(r,HorizonSide((side + 1) % 4))
        move!(r,HorizonSide(side))
    end
    for i = 1:x
        move!(r,HorizonSide((side+1) % 4))
    end
    return Flg
end

function scan(r)
    Flg = true
    summ = 0
    Z = 0
    if !isborder(r,Nord)
        Flg = true
        move!(r,Nord)
        while !isborder(r,Ost) || Flg
            if !isborder(r,Ost)
                move!(r,Ost)
            else
                Flg, Z = Obhod2(r,3)
                if summ < Z
                    summ = Z
                end
            end
        end
    end
    
    Flg = true
    while !isborder(r, West) || Flg
        if !isborder(r, West)
            move!(r, West)
        else
            Flg = obhod(r,1)
        end
    end
    return summ
end

function task_24(r)
    summ = 0
    Z = 0
    corner(r)
    while !isborder(r,Nord)
        Z = scan(r)
        if summ < Z
            summ = Z
        end
    end
    return summ
end

task_24(r)