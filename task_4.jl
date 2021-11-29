
function cornerhome!(r)
    x=0
    z=0
    while isborder(r,West)==0
        move!(r,West)
        x=x+1
    end
    while isborder(r,Nord)==0
            move!(r,Nord)
            z=z+1
    end
Large!(r)
movetoside!(r,West)
    for t in 1:z
        move!(r,Sud)
    end
    for tt in 1:x
        move!(r,Ost)
    end
end

function movetoside!(r,side)
    while isborder(r,side)==0
        move!(r,side)
    end
end

function Large!(r)
    s=0
    side=Ost
    movetoside!(r,side)
    side=Sud
    movetoside!(r,side)
    while isborder(r,West)==0
        putmarker!(r)
        move!(r,West)
        putmarker!(r)
        s=s+1
    end
    move!(r,Nord)
    s=s-1
    while isborder(r,Nord)==0
        for i in 1:s
            putmarker!(r)
            move!(r,Ost)
            putmarker!(r)
        end
        s=s-1
        side=West
        movetoside!(r,side)
        move!(r,Nord)
    end
    for i in 1:s
        putmarker!(r)
        move!(r,Ost)
        putmarker!(r)
    end
end

cornerhome!(r)