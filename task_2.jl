
function mind!(r)
    x=0::Int
    z=temperature(r::Robot)::Int
while isborder(r,Nord)==0
    move!(r,Nord)
    x+=1;
end
circleHome!(r)
if ismarker(r)==1
    while true
        move!(r,Sud)
        if temperature(r)==z
            break
        end
    end
end
end

function circleHome!(r)
    for side in [West,Sud,Ost,Nord,West]
    if isborder(r,side)==0 && ismarker(r)==0
        while isborder(r,side)==0 && ismarker(r)==0
         putmarker!(r)
         move!(r,side)
         end 
    end
    end
end


