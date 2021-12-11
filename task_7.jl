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
function cornernowall!(r)
    while isborder(r,Nord)==0
        move!(r,Nord)
    end
    while isborder(r,West)==0
        move!(r,West)
    end
end

function counter!(r)
c=1
    while isborder(r,Ost)==0
        move!(r,Ost)
        c=c+1
    end
    return c
end

function movechessW!(r)
    putmarker!(r)
    if isborder(r,West)==0
        move!(r,West)
    end
    if isborder(r,West)==0
        move!(r,West)
    end
end

function chess(r,y,c)
    y=y+1
    cc=c
    while isborder(r,Sud)!=1
        if ((c-y)%2==0)
            while cc!=0
                movechessW!(r)
                cc=cc-2
            end
        else
            if isborder(r,West)==0
                move!(r,West)
            end
            while cc!=0
                movechessW!(r)
                cc=cc-2
            end
        end
        
        if isborder(r,Sud)==0
            move!(r,Sud)
        end
        while isborder(r,Ost)==0
            move!(r,Ost)
        end
        move!(r,Nord)
        cc=c
        if ismarker(r)==0
            move!(r,Sud)
            while cc!=0
                movechessW!(r)
                cc=cc-2
            end
        else
            move!(r,Sud)
            move!(r,West)
            cc=c
            while cc!=0
                movechessW!(r)
                cc=cc-2
            end
        end
    end
end
function task_7(r)
    x,y=homenowallmind!(r)
    c=counter!(r)
    chess(r,y,c)
    cornernowall!(r)
    homenowall!(r,x,y)
end

task_7(r)