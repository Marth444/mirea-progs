using HorizonSideRobots

function obhod(r,side,y)
    x = 0
    Flg = true
    while isborder(r,HorizonSide(side)) && !isborder(r,HorizonSide((side + 1) % 4))
        move!(r,HorizonSide((side + 1) % 4))
        x += 1
    end
    if isborder(r,HorizonSide(side)) && isborder(r,HorizonSide((side + 1) % 4))
        Flg = false
    end
    if !isborder(r,HorizonSide(side))
        move!(r,HorizonSide(side))
        y += 1
    end
    while !isborder(r,HorizonSide(side)) && isborder(r,HorizonSide((side + 3) % 4))
        move!(r,HorizonSide(side))
        y += 1
    end
    for i = 1:x
        move!(r,HorizonSide((side+3) % 4))
    end
    return Flg,y
end

function Obratno(r,side,y)
    while y > 0
        if !isborder(r,HorizonSide((side + 2) % 4))
            move!(r,HorizonSide(((side + 2) % 4)))
        else
            x = 0
            while isborder(r,HorizonSide((side + 2) % 4)) && !isborder(r,HorizonSide((side + 1) % 4))
                move!(r,HorizonSide((side + 1) % 4))
                x += 1
            end
            move!(r,HorizonSide((side + 2) % 4))
            while isborder(r,HorizonSide((side + 3) % 4))
                move!(r,HorizonSide((side + 2) % 4))
                y -= 1
            end
            for i = 1:x
                move!(r,HorizonSide((side + 3) % 4))
            end
        end
        y -= 1
    end
end

function moveS(r,side)
    y = 0
    Flg = true
    while !isborder(r,HorizonSide(side)) || Flg
        if !isborder(r,HorizonSide(side))
            move!(r,HorizonSide(side))
            y += 1
        end
        if isborder(r,HorizonSide(side))
            Flg, y = obhod(r,side,y)
        end
        if Flg == false
            break
        end
    end
    putmarker!(r)
    Obratno(r,side,y)
end

function task_11(r)
for i = 0:3
moveS(r,i)
end
end

task_11(r)