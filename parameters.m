function params=parameters()
i=1:5;
o=1:2;
r=1:2;
v=1:3;
l=1:2;
t=1:2;
Ko{1}=[2,1];
Ko{2}=[3];
j=i;
params.landa=unifrnd(0.01,1,[1 numel(r)]);
params.Pirt=unifrnd(0.01,1,[numel(i) numel(r) numel(t)]);
params.CL=unifrnd(20,40,[1 numel(l)]);
params.tij=unifrnd(1,3,[numel(i) numel(j)]);
params.toi=unifrnd(1,3,[numel(o) numel(j)]);
params.til=unifrnd(1,3,[numel(i) numel(l)]);
params.si=unifrnd(1,2,[1 numel(i)]);
params.Tmax=unifrnd(20,40,[1 1]);
params.d=round( unifrnd(2,3,[numel(i),numel(r), numel(r)]));   


params.i=i;
params.o=o;
params.r=r;
params.v=v;
params.l=l;
params.t=t;
params.Ko=Ko;
end