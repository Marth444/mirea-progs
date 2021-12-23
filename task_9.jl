function movetospiral!(r, n, side)
flag=true
    for i = 1:n
        if ismarker(r)==1
            flag = false
            return flag
        end
    move!(r,side)
    end
end
  
function task_9(r)
    n=1
    side=Ost
    while ismarker(r)==0
        side = HorizonSide((Int(side)+1)%4)
        flag=movetospiral!(r, c, side)
        side=HorizonSide((Int(side)+1)%4)
        flag=movetospiral!(r, c, side)
        if flag == 1
            break
        end
        n=n+1
    end
end

task_9(r)

    