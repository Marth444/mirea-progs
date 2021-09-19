function krest!(r::Robot)
    for side in [Nord,West,Sud,Ost]
    function movekrest!(r::Robot)
        while isborder(r,side)==0
            move!(r,side)
            putmarker!(r)
        end
    end
        function reverskrest!(r::Robot)
            while ismarker(r)==1
                move!(r,HorizonSide((Int(side)+2)%4))
            end 
        end
    movekrest!(r)
    reverskrest!(r)
end
putmarker!(r)
    end
        