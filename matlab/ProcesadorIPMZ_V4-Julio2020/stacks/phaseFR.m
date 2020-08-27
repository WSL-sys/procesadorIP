function arr=phaseFR(arr,It)

L = length(arr);
index = round((1:L)*It);
arrtmp=arr;
k = 0;
for i = 1:L
    if (i+index(i)) > 1
        if (i+index(i)) > L
            break;
        else
            k = k +1;
            arrtmp(k)=arr(i+index(i));
        end
    end
end
arr = arrtmp(1:k);
