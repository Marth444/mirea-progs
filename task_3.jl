function corner!(r)
    x=0::Int
    z=0::Int
    while isborder(r,Nord)==0
        move!(r,Nord)
        x=x+1
    end
    while isborder(r,West)==0
            move!(r,West)
            z=z+1
    end
    Points!(r)
    while isborder(r,Nord)==0
        move!(r,Nord)
    end
    while isborder(r,West)==0
            move!(r,West)
    end
    for t in 1:z
        move!(r,Ost)
    end
    for tt in 1:x
        move!(r,Sud)
    end
end

function Points!(r)
    while isborder(r,Sud)==0
        while isborder(r,Ost)==0
         putmarker!(r)
          move!(r,Ost)
        end
        if isborder(r,Ost)==1
            putmarker!(r)
            move!(r,Sud)
            while isborder(r,West)==0
            putmarker!(r)
            move!(r,West)
            end
        end
        putmarker!(r)
        move!(r,Sud)
        if isborder(r,Sud)==1
            while isborder(r,Ost)==0
                putmarker!(r)
                move!(r,Ost)
        end
        putmarker!(r)
        end
    end
    putmarker!(r)
end

corner!(r)