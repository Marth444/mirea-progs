
function converter(side)
    return HorizonSide((Int(side)+2)%4)
end

function gowhile(r,s)
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

function task_10(r)
    marks=0
    sum=0
    side=Ost
    while true
        mm,ss=gowhile(r, side)
        marks+=mm
        sum+=ss
        if !isborder(r,Nord)
            move!(r,Nord)
            side=converter(side)
        else
            break
        end
    end
    print(sum/marks)
end

task_10(r)