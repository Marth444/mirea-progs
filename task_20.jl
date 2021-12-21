using HorizonSideRobots

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
    if !isborder(r,Nord)
        move!(r,Nord)
    else
        obhod(r,0)
    end
end


function obhod(r,HS)
    x = 0
    Flg = true
    while isborder(r,HorizonSide(HS)) && !isborder(r,HorizonSide((HS + 3) % 4))
        move!(r,HorizonSide((HS + 3) % 4))
        x += 1
    end
    if isborder(r,HorizonSide(HS)) && isborder(r,HorizonSide((HS + 3) % 4))
        Flg = false
    end
    if  !isborder(r,HorizonSide(HS))     
        move!(r,HorizonSide(HS))
    end
    while !isborder(r,HorizonSide(HS)) && isborder(r,HorizonSide((HS + 1) % 4))
        move!(r,HorizonSide(HS))
    end
    for i = 1:x
        move!(r,HorizonSide((HS+1) % 4))
    end
    return Flg
end

function counter(r)
    c1 = 0
    c2 = 0
    StopCount = true
    while  !isborder(r,Ost) || StopCount
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
            StopCount = false
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
    summ = 0
    while !isborder(r,Nord) || Flg2
        summ += counter(r)
        if !isborder(r,Nord)
            move!(r,Nord)
        else
            Flg2 = obhod(r,0)
        end
    end
    return summ
end
task_20(r)