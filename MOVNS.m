clc;
clear;
close all;



%===================================

params=parameters();
i=params.i;
o=params.o;
r=params.r;

t=params.t;
j=params.i;

%nVar= numel(j)+numel(t);             % Number of Decision Variables
Nvarx=3*numel(t);
Nvary=numel(i);
%VarSize=[1 nVar];   % Size of Decision Variables Matrix
VarSize=[Nvarx Nvary];
nVar=VarSize;



%==================================

%% SA Parameters

MaxIt=1;      % Maximum Number of Iterations

MaxIt2=100;      % Maximum Number of Inner Iterations

beta=0.2;        % Leader Selection Pressure

 pnGrid=0.6;
 alpha=0.1;          % Inflation Rate

%% Initialization
tic
% Create Initial Solution
qo=randi(numel(o),numel(t),numel(i));
%qv=randi(numel(o),numel(t),numel(v));
qr=randi(numel(r),numel(t),numel(i));
qi=unifrnd(0,1,[numel(t),numel(i)]);

x.Position=[qo;qr;qi];


x.sol=MyCost(x.Position);
x.Cost=x.sol.Cost;
% Update Best Solution Ever Found
BestSol=x;




           empty_particle.Position=[];

            empty_particle.Cost=[];
            empty_particle.sol=[];
            empty_particle.Best.Position=[];
            empty_particle.Best.Cost=[];
            empty_particle.Best.sol=[];
            empty_particle.IsDominated=[];
            empty_particle.GridIndex=[];
            empty_particle.GridSubIndex=[];

pop=repmat(empty_particle,MaxIt2,1);

%%  Main Loop

for it=1:MaxIt
    zz=1;

    for it2=1:MaxIt2
        
        % Create Neighbor
%         xnew.Position=CreateNeighbor(x.Position);
%         xnew.sol=MyCost(xnew.Position);
%        xnew.Cost=xnew.sol.Cost;

        pop(it2).Position=CreateNeighbor(x.Position);
        pop(it2).sol=MyCost(pop(it2).Position);
       pop(it2).Cost= pop(it2).sol.Cost;



        %==========================================
        
%         if xnew.Cost<=x.Cost
%             % xnew is better, so it is accepted
%             x=xnew;
% 
%         end
%        if Dominates(xnew.Cost,x.Cost)
%            x=xnew;
%        elseif rand>0.8
%            pop=[pop;xnew.Cost];
%          
%        end
%----------------------------------------------

%--------------------------------------------------
        %============================
        
%         COST=[pop;xnew.Cost];
   
        
    end
    
%         if x.Cost<=BestSol.Cost
% 
%            BestSol=x;
%         end
            % Determine Domination
           %


         
           
%             if numel(pop)>1
                            pop=DetermineDomination(pop);

                            rep=pop(~[pop.IsDominated]);
%                     if numel(rep)>1
                           nGrid=pnGrid*numel(rep);

                            Grid=CreateGrid(rep,nGrid,alpha);

                            for i=1:numel(rep)
                                rep(i)=FindGridIndex(rep(i),Grid);
                            end
                            leader=SelectLeader(rep,beta);
                         x=  leader ;
                          BestSol=x;
%                     else
%                         %-------------------------------
%                      if Dominates(x.Cost,BestSol)
%                            BestSol=x;
%                            rep=x;
% 
%                      end
                       %-----------------------------
%                     end
                    
%                 if Dominates(x.Cost,BestSol)
%                        BestSol=x;
%                         rep=x;
%                  end
%               end
                     
                     
    
   
    % Display Iteration Information
  
    
        % Show Iteration Information
   disp(['Iteration ' num2str(it) ': Number of Rep Members = ' num2str(numel(rep))]);
    for kl=1:(numel(rep)) 

        disp(['Number of pareto=' num2str(kl)    ' ; F1= '  num2str(rep(kl).sol.ff1) ...
             ' ;F2= ' num2str(rep(kl).sol.ff2)...    
            ' ;mizankhata= ' num2str(rep(kl).sol.Erro_Tmax)  ]);
    end
disp(['; time soloution=' num2str(toc)]);
    disp('__________________________________________________________________________________________________________________');

    

    
end




% %% MID
% a=zeros(numel(rep),3);
% d=zeros(numel(rep),1);
% dd=zeros(numel(rep),3);
% for ii=1:(numel(rep)) 
%   %  bestsolution=   
%   %  b(ii,:)=[pop(F{1}(ii)).sol.z, pop(F{1}(ii)).sol.zz pop(F{1}(ii)).sol.zprim, pop(F{1}(ii)).sol.khata ];
%       dd(ii,:)=[rep(ii).sol.z, rep(ii).sol.zz rep(ii).sol.zprim ];
% 
% end
% bestf1=max(dd(:,1));
% worstf1=min(dd(:,1));
% bestf2=min(dd(:,2));
% worstf2=max(dd(:,2));
% bestf3=min(dd(:,3));
% worstf3=max(dd(:,3));
% 
% %bestf4=min(b(:,4));
% %worstf4=max(b(:,4));
% 
% for ii=1:numel(rep) 
%     %=======================
%   % if -bestf1+worstf1~=0
% %a1=(((Archive(ii).sol.z1-bestf1)/(worstf1-bestf1)))^2;
% %a1=((rep(ii).sol.z1-bestf1)/(bestf1))^2;
% a1=((rep(ii).sol.z-bestf1)/(worstf1-bestf1))^2;
% 
%  %  else
%      %   a1=(Archive(ii).sol.z1-0)^2;
%  %  end
%     
%    %===========================================
%    % if -bestf2+worstf2~=0
%      %   a2=(((Archive(ii).sol.zz-bestf2)/(worstf2-bestf2)))^2;
%                a2=(((rep(ii).sol.zz-bestf2)/(worstf2-bestf2)))^2;
%  %  else
%     %    a2=(Archive(ii).sol.zz-0)^2;
%   %  end
%     %===========================================
%   
%      %  if -bestf3+worstf3~=0
%         %a3=(((Archive(ii).sol.zprim-bestf3)/(worstf3-bestf3)))^2;
%       a3=(((rep(ii).sol.zprim-bestf3)/(worstf3-bestf3)))^2;
%    % else
%         %a3= (Archive(ii).sol.zprim-0)^2;
%    %   end
%     
%     %===============================================
%     
%     
%     %==================================================
%     
%     
%   % if -bestf3+worstf3~=0
%  %       a3=(((pop(F{1}(ii)).sol.totalkhata-bestf3)/(worstf3-bestf3)))^2;
% %    else
%    %     a3= (Archive(ii).sol.total_khata-0)^2;
%   %  end
% %===================================================
% 
% %ad(ii,:)=[a1,a2,a3];
% %a(ii,:)=[a1,a2];
% %a(ii,:)=[(abs(Archive(ii).sol.z-bestf1/(worstf1-bestf1)))^2,( abs(Archive(ii).sol.zz-bestf2/(worstf2-bestf2)))^2,(abs(-Archive(ii).sol.zprim+bestf3/(-worstf1+bestf1)))^2 ];
% % d(ii)=sqrt(sum(a(ii,:)));
% % dp(ii)=sqrt(sum(ad(ii,:)));
%  
%  
%   ad(ii,:)=[a1,a2,a3];
%  ci(ii)=sqrt(sum(ad(ii,:)));
% end
% 
% 
% 
% MID=sum(ci)/(size(dd,1)) 
% SNS=sqrt(sum((ci-MID).^2)/(size(dd,1)-1))
% DM=sqrt(((bestf1-worstf1)^2)+((bestf2-worstf2)^2)+((bestf3-worstf3)^2))
% NPS=size(dd,1)
% 
% save('bbbb','pop','MID','SNS','DM','NPS')
%     
% 
% 
% %% Results
% 
% %figure;
% %plot(nfe,BestCost,'LineWidth',2);
% %xlabel('NFE');
% %ylabel('Best Cost');
% 
