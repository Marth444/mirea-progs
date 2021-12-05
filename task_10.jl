function movewhile(r,s)
 a=0
 b=0
    if ismarker(r)
 a+=1
 b+=temperature(r)
    end
    while !isborder(r,s)
        move!(r,s)
        if ismarker(r)
 a+=1
 b+=temperature(r)
        end
    end
    return (a,b)
end

function averagetemp(r)
    markers=0
    sum=0
    side=Ost
    while true
        t=movewhile(r, side)
        markers+=t[1]
        sum+=t[2]
        if !isborder(r,Nord)
            move!(r,Nord)
            side=convert(side)
        else
            break
        end
    end
    print(sum/markers)
end

function convert(side)
    return HorizonSide((Int(side)+2)%4)
end

averagetemp(r)