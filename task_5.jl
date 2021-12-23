function movetoside!(r,side)
    count=0
    while isborder(r,side)==0
        move!(r,side)
        count=count+1    
    end
    return count
end

function corner!(r)
home=[]
    while isborder(r,Nord)==0 || isborder(r,West)==0
        x=movetoside!(r,Nord)
        y=movetoside!(r,West)
        push!(home,x)
        push!(home,y)
    end
    return home
end

function countmove!(r,side,count)
    for i in 1:count
        move!(r,side)
    end
end

function gohome!(r,home)
    reverse!(home)
    for i = 1:length(home)
        if i%2==0
            countmove!(r,Sud,home[i])
        else
            countmove!(r,Ost,home[i]) 
        end 
    end
end

function dotsincorner!(r)
    putmarker!(r)
    move!(r,Sud)
    if ismarker(r)==0
        for side in [Sud,Ost,Nord,West]
            while isborder(r,side)==0
                move!(r,side)
            end
        putmarker!(r)
        end
    end

end
function task5!(r)
home=[]
home=corner!(r)
dotsincorner!(r)
gohome!(r,home)
end
task5!(r)