function diag(r,i)
    while !isborder(r,HorizonSide(i % 4)) && !isborder(r,HorizonSide((i+1) % 4))
        move!(r,HorizonSide(i % 4))
        move!(r,HorizonSide((i+1) % 4))
        putmarker!(r)
    end
    while ismarker(r)
        move!(r,HorizonSide((i+2) % 4))
        move!(r,HorizonSide((i+3) % 4))
    end
end

function task_13(r)
    for i in 0:3
        diag(r,i)
    end
    putmarker!(r)
end

task_13(r)