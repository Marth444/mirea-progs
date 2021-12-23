function ob(r,side,y)
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

function Vozvrat(r,side,y)
    while y!= 0
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

function Range(r,side)
    y = 0
    Flg = true
    while !isborder(r,HorizonSide(side % 4)) || Flg
        if !isborder(r,HorizonSide(side % 4))
            move!(r,HorizonSide(side % 4))
            putmarker!(r)
            y += 1
        end
        if isborder(r,HorizonSide(side))
            Flg, y = ob(r,side,y)
            putmarker!(r)
        end
        if Flg == false
            break
        end
    end
    Vozvrat(r,side,y)
end

function task_14(r)
    for i = 0:3
        Range(r,i)
    end
    putmarker!(r)
end

task_14(r)