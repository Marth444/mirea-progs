function movers!(r,c,side)
    for i in 1:c
        move!(r, side)
    end
end

function convertside(side)
    return HorizonSide((Int(side)+2)%4)
end

function task_8!(r)
 n=1
 side=Ost
    while isborder(r, Nord)
        movers!(r, n, side)
        n+=1
        side=convertside(side)
    end
end

task_8!(r)