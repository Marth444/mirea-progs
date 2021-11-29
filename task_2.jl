
function circle!(r)
    for side in [Sud,Ost,Nord,West]
        while isborder(r,side)==0 && ismarker(r)==0
            putmarker!(r)  
            move!(r,side) 
         end 
    end
end


function homenowallmind!(r)
    x=0
    y=0
    while isborder(r,Nord)==0
        move!(r,Nord)
        x=x+1
    end
    while isborder(r,West)==0
        move!(r,West)
        y=y+1
    end
    return x,y
end
function homenowall!(r,x,y)
    for i in 1:x
        move!(r,Sud)
    end
    for i in 1:y
        move!(r,Ost)
    end
end

function circleinborder!(r)
   x,y= homenowallmind!(r)
    circle!(r)
    homenowall!(r,x,y)
end

circleinborder!(r)




