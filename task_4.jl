
function cornR!(r)
    x=0::Int
    z=0::Int
    t=0::Int
    tt=0::Int
    ost=0::Int
    while isborder(r,Sud)==0
        move!(r,Sud)
        x=x+1
    end
    while isborder(r,Ost)==0
            move!(r,Ost)
            z=z+1
    end
large!(r)
    for t in 1:z
        move!(r,West)
    end
    for tt in 1:x
        move!(r,Nord)
    end
end

function large!(r)
    l=0::Int
    t=0::Int
    c=1::Int
while isborder(r,Nord)==0
    l=l+1
    while isborder(r,Nord)==0
for t in 1:l
    putmarker!(r)
    move!(r,West)
end
move!(r,Nord)
    end
    putmarker!(r)
end
while isborder(r,West)==0
c=c+1
move!(r,West)
putmarker!(r)
end
while isborder(r,Ost)==0
while ismarker(r)==0
    putmarker!(r)
move!(r,Ost)
end
if isborder(r,Ost)==1
    break
end
while isborder(r,West)==0
    move!(r,West)
end
if isborder(r,Sud)==0
move!(r,Sud)
end
end
end

