function movetosteps!(r::Robot, steps, side)
    for i in 1:steps
        move!(r, side)
    end
end

function convert(side)
    return HorizonSide((Int(side)+2)%4)
end

function find!(r)
 n=1
 side=Ost
    while isborder(r, Nord)
        movetosteps!(r, n, side)
 n+=1
        side=convert(side)
    end
end

find!(r)