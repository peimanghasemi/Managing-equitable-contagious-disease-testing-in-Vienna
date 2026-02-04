function qnew=CreateNeighbor(qj)

    m=randi([1 3]);
    qnew=qj;
   rd=randperm( size(qj,1));
    for ff=1:rd(1)
        qq=qj(rd(ff),:);
                switch m
                    case 1
                        % Do Swap
                        qnew(rd(ff),:)=Swap(qq);

                    case 2
                        % Do Reversion
                        qnew(rd(ff),:)=Reversion(qq);

                    case 3
                        % Do Insertion
                        qnew(rd(ff),:)=Insertion(qq);
                end
    end


end

function qnew=Swap(qu)

    n=numel(qu);
    
    i=randsample(n,2);
    i1=i(1);
    i2=i(2);
    
    qnew=qu;
    qnew([i1 i2])=qu([i2 i1]);
    
end

function qnew=Reversion(qc)

    n=numel(qc);
    
    i=randsample(n,2);
    i1=min(i(1),i(2));
    i2=max(i(1),i(2));
    
    qnew=qc;
    qnew(i1:i2)=qc(i2:-1:i1);

end

function qnew=Insertion(qb)

    n=numel(qb);
    
    i=randsample(n,2);
    i1=i(1);
    i2=i(2);
    
    if i1<i2
        qnew=[qb(1:i1-1) qb(i1+1:i2) qb(i1) qb(i2+1:end)];
    else
        qnew=[qb(1:i2) qb(i1) qb(i2+1:i1-1) qb(i1+1:end)];
    end

end

