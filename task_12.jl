function swap(side :: HorizonSide)
    side = HorizonSide((Int(side)+2)%4)
    return side
end

function corner!(r)
    while isborder(r,West)==0
            move!(r,West)
    end
    while isborder(r,Sud)==0
        move!(r,Sud)
    end
end

function GoHome!(r, x, y)
    corner!(r)
    for i = 1:y 
        move!(r,Nord)
    end 
    for i = 1:x 
        move!(r,Ost)
    end 
end

function mindhome(r)
    x = 0
    y = 0
    while isborder(r, Sud) == 0
        move!(r,Sud)
        y = y + 1
    end
    while isborder(r, West) == 0
        move!(r,West)
        x = x + 1
    end
    return x, y
end

function put!(r, x, y, n)
    if ((x ÷ n) + (y ÷ n)) % 2 == 0
        putmarker!(r)
    end
end

function chess!(r,side, n, x, y)
    while isborder(r, side) == 0
        move!(r, side)
        if side == Ost
            x = x + 1;
        else
            x = x - 1;
        end
        put!(r, x, y, n)
    end
    return x, y
end

function task_12(r, n)
    z = 0
    m = 0
    z, m = mindhome(r)
    side = Ost;
    x = 0;
    y = 0;
    putmarker!(r)
    while isborder(r,Nord) == 0
        x, y = chess!(r,side, n, x, y)
        move!(r,Nord);
        y = y + 1;
        side = swap(side);
        put!(r, x, y, n)
    end
    chess!(r,side, n, x, y)
    go_home!(r, z, m)
end

n = 5

task_12(r,n)
