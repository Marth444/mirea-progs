
function moveToside(r, Side :: HorizonSide)
    c = 0
    while isborder(r,Side) ==  false 
        move!(r,Side)
        c = c + 1
    end 
    return c
end

function Revers(Side :: HorizonSide)
    Side = HorizonSide((Int(Side)+2)%4)
    return Side
end

function Cmove!(r, Side :: HorizonSide, c)
    for i = 1:c 
        move!(r,Side)
    end 
end

function ugl(r)
    x = 0
    y = 0
    while (isborder(r, Sud) == false) || (isborder(r, West) == false)
        y = y + moveToside(r, Sud)
        x = x + moveToside(r, West)
    end
    return x, y
end

function GoHome!(r, x, y)
    ugl(r)
    Cmove!(r, Nord, y)
    Cmove!(r, Ost, x)
end

function lineschess!(Side, n, x, y, r)
    while isborder(r, Side) == false
        move!(r, Side)
        if Side == Ost
            x = x + 1;
        else
            x = x - 1;
        end
        put!(r, x, y, n)
    end
    return x, y
end

function put!(r, x, y, n)
    if ((x ÷ n) + (y ÷ n)) % 2 == 0
        putmarker!(r)
    end
end

function task_12(r, n)
    z = 0
    m = 0
    z, m = ugl(r)
    Side = Ost;
    x = 0;
    y = 0;
    if ((x ÷ n) + (y ÷ n)) % 2 == 0
        putmarker!(r)
    end
    while isborder(r,Nord) == false
        x, y = lineschess!(Side, n, x, y, r)
        move!(r,Nord);
        y = y + 1;
        Side = Revers(Side);
        put!(r, x, y, n)
    end
    x, y = lineschess!(Side, n, x, y, r)
    GoHome!(r, z, m)
end

n = 3

task_12(r,n)

