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
        if isborder(r,side)==0
        move!(r,side)
        end
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
function Points!(r)
    while isborder(r,Sud)==0
        while isborder(r,Ost)==0
         putmarker!(r)
          move!(r,Ost)
        end

    if isborder(r,Ost)==1
        putmarker!(r)
        if isborder(r,Sud)==0
        move!(r,Sud)
        else
        while isborder(r,West)==0  
            move!(r,West)
        end    
        end
        while isborder(r,West)==0
        putmarker!(r)
        move!(r,West)
        end
    end
    putmarker!(r)
    if isborder(r,Sud)==0
    move!(r,Sud)

    end
if isborder(r,Sud)==1
    while isborder(r,Ost)==0
        putmarker!(r)
         move!(r,Ost)
       end
       putmarker!(r)
end
end
putmarker!(r)

while isborder(r,West)==0
    move!(r,West)
end
while isborder(r,Nord)==0
    move!(r,Nord)
end
end

function task_30(r)
home=[]
home=corner!(r)
Points!(r)
gohome!(r,home)
end

task_30(r)