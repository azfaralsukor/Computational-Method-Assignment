function QueueSim(cus,serv)
    %Monte Carlo's Queue Simulator
    
    disp('+~~~~~~~~~~~~+~~~~~~~~~~~+~~~~~+~~~~~~~~~~~~+')
    disp('|Service Time|Probability| CDF |   Range    |')
    disp('+~~~~~~~~~~~~+~~~~~~~~~~~+~~~~~+~~~~~~~~~~~~+')
    
    st = 3; % service time
    cdf = 0;
    u = 0;  % upper range
    
    while ( st <= 8 )
        l = u + 1; % lower range
        if ( st == 3)
            p = 0.15;
        end
        if ( st == 4)
            p = 0.35;
        end
        if ( st == 5)
            p = 0.1; % prolly
        end
        if ( st == 6 )
            p = 0.2;
        end
        if ( st == 7 )
            p = 0.15;
        end
        if ( st == 8 )
            p = 0.05;
        end
        cdf = cdf + p; 
        u = cdf * 100;
        fprintf('|%12.0f|%11.2f|%5.2f|%5.0f -%5.0f|\n', st, p, cdf, l, u) 
        st = st + 1;    
    end
    
    disp('+~~~~~~~~~~~~+~~~~~~~~~~~+~~~~~+~~~~~~~~~~~~+')
    fprintf('\n') 
    
    
    disp('+~~~~~~~~~~~~~~~~~+~~~~~~~~~~~+~~~~~+~~~~~~~~~~~~+')
    disp('|Interarrival Time|Probability| CDF |   Range    |')
    disp('+~~~~~~~~~~~~~~~~~+~~~~~~~~~~~+~~~~~+~~~~~~~~~~~~+')
    
    it = 1;  % interarrival
    cdf = 0;
    u = 0;
    p  = 1 / 8;
    
    while ( it <= 8 )
        l = u + 1;
        cdf = cdf + p; 
        u = cdf * 1000;
        fprintf('|%17.0f|%11.3f|%5.3f|%4.0f - %5.0f|\n', it, p, cdf, l, u) 
        it = it + 1;    
    end
    disp('+~~~~~~~~~~~~~~~~~+~~~~~~~~~~~+~~~~~+~~~~~~~~~~~~+')
    fprintf('\n') 
    
    if ( serv == 1)
    
    disp('+~~~~~~~+~~~~~~~~~~~+~~~~+~~~~~~~~~+~~~~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~~~~~~~~~+~~~~~~~~~~+')
    disp('|cust no|RN arrivals| IAT|Arrival T|RN service|TS begins|Service T|TS Ends|T Spend in System|T in Queue|')
    disp('+~~~~~~~+~~~~~~~~~~~+~~~~+~~~~~~~~~+~~~~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~~~~~~~~~+~~~~~~~~~~+') 
    
    i = 1;
    at = 0;
    tsb = 0;
    tse = 0;
    awt = 0;
    twt = 0;
    cwt = 0;
    fwt = 0;
    
    while ( i <= cus )
        
        rna = rand * 1000;
        while ((rna < 0) || (rna > 1000))
            rna = rand () * 1000;
        end
        if ( i == 1 )
            rna = '';
            iat = 0;
        end
        
        if ( (rna >= 1) && (rna <=125) )
            iat = 1;
        end
        if ( (rna >= 126) && (rna <=250) )
            iat = 2;
        end
        if ( (rna >= 251) && (rna <=375) )
            iat = 3;
        end
        if ( (rna >= 376) && (rna <=500) )
            iat = 4;
        end
        if ( (rna >= 501) && (rna <=625) )
            iat = 5;
        end
        if ( (rna >= 626) && (rna <=750) )
            iat = 6;
        end
        if ( (rna >= 751) && (rna <=875) )
            iat = 7;
        end
        if ( (rna >= 876) && (rna <=1000) )
            iat = 8;
        end
        
        at = at + iat;
        rns = rand * 100;
        while ((rns < 1) || (rns > 100))
            rns = rand () * 1000;
        end
        
        if((rns >= 1) && (rns <= 10))
            serviceT = 3 ; 
        end
        if((rns >= 11)&&(rns <= 30))
            serviceT = 4 ;
        end
        if((rns >= 31) && (rns <= 60))
            serviceT = 5 ; 
        end
        if((rns >= 61) && (rns <= 85))
            serviceT = 6 ; 
        end
        if((rns >= 86) && (rns <= 95))
            serviceT = 7 ; 
        end
        if((rns >= 96) && (rns <= 100))
            serviceT = 8 ; 
        end
        
        if ( at < tse )
            tsb = tse;
        else
            tsb = at;
        end
        
        tse = tsb + serviceT;
        tsis = tse - tsb;
        tiq = tsb - at;
        twt = twt + tiq;
        if ( twt == fwt )
            cwt = cwt;
        else
            cwt = cwt + 1;
        end
        fprintf('|%7.0f|%11.0f|%4.0f|%9.0f|%10.0f|%9.0f|%9.0f|%7.0f|%17.0f|%10.0f|\n', i, rna, iat, at, rns, tsb, serviceT, tse, tsis, tiq)
        i = i + 1;
        fwt = twt;
    end
    awt = twt / cwt;
    disp('+~~~~~~~+~~~~~~~~~~~+~~~~+~~~~~~~~~+~~~~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~~~~~~~~~+~~~~~~~~~~+') 
    fprintf('The Average Waiting Time is %5.3f\n', awt)
    end
    fprintf('\n')
    
    if ( serv == 2)
    disp('                                              +~~~~~~~~~~~~~~~~~~~~~~~~~~~+~~~~~~~~~~~~~~~~~~~~~~~~~~~+')
    disp('                                              |          SERVER 1         |           SERVER 2        |')
    disp('+~~~~~~~+~~~~~~~~~~~+~~~~+~~~~~~~~~+~~~~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~~+')
    disp('|cust no|RN arrivals| IAT|Arrival T|RN service|TS begins|Service T|TS Ends|TS begins|Service T|TS Ends|T in Queue|')
    disp('+~~~~~~~+~~~~~~~~~~~+~~~~+~~~~~~~~~+~~~~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~~+') 
    
    i = 1;
    at = 0;
    tsb = 0;
    tse = 0;
    tse2 = 0;
    awt = 0;
    twt = 0;
    cwt = 0;
    fwt = 0;
    
    while ( i <= cus )
        
        rna = rand * 1000;
        while ((rna < 0) || (rna > 1000))
            rna = rand () * 1000;
        end
        if ( i == 1 )
            rna = '';
            iat = 0;
        end
        
        if ( (rna >= 1) && (rna <=125) )
            iat = 1;
        end
        if ( (rna >= 126) && (rna <=250) )
            iat = 2;
        end
        if ( (rna >= 251) && (rna <=375) )
            iat = 3;
        end
        if ( (rna >= 376) && (rna <=500) )
            iat = 4;
        end
        if ( (rna >= 501) && (rna <=625) )
            iat = 5;
        end
        if ( (rna >= 626) && (rna <=750) )
            iat = 6;
        end
        if ( (rna >= 751) && (rna <=875) )
            iat = 7;
        end
        if ( (rna >= 876) && (rna <=1000) )
            iat = 8;
        end
        
        at = at + iat;
        rns = rand * 100;
        while ((rns < 1) || (rns > 100))
            rns = rand () * 1000;
        end
        
        if((rns >= 1) && (rns <= 10))
            serviceT = 3 ; 
        end
        if((rns >= 11)&&(rns <= 30))
            serviceT = 4 ;
        end
        if((rns >= 31) && (rns <= 60))
            serviceT = 5 ; 
        end
        if((rns >= 61) && (rns <= 85))
            serviceT = 6 ; 
        end
        if((rns >= 86) && (rns <= 95))
            serviceT = 7 ; 
        end
        if((rns >= 96) && (rns <= 100))
            serviceT = 8 ; 
        end
        
        if ((at < tse) && (at < tse2))
            tsb = at;
            tse = tsb + serviceT;
            tiq = tsb - at ;
            fprintf('|%7.0f|%11.0f|%4.0f|%9.0f|%10.0f|%9.0f|%9.0f|%7.0f|         |         |       |%10.0f|\n', i, rna, iat, at, rns, tsb, serviceT, tse, tiq)
        end
        
        if ( at < tse )
            tsb2 = at;
            serviceT2 = serviceT;
            tse2 = tsb2 + serviceT2;
            tiq = tsb2 - at; 
            fprintf('|%7.0f|%11.0f|%4.0f|%9.0f|%10.0f|         |         |       |%9.0f|%9.0f|%7.0f|%10.0f|\n', i, rna, iat, at, rns, tsb2, serviceT2, tse2, tiq)
        else
            tsb = at;
            tse = tsb + serviceT;
            tiq = tsb - at ;
            fprintf('|%7.0f|%11.0f|%4.0f|%9.0f|%10.0f|%9.0f|%9.0f|%7.0f|         |         |       |%10.0f|\n', i, rna, iat, at, rns, tsb, serviceT, tse, tiq)
        end
        twt = twt + tiq;
        if ( twt == fwt )
            cwt = cwt;
        else
            cwt = cwt + 1;
        end
        fwt = twt;
        
        i = i + 1;
    end
   
    awt = twt / cwt;
    disp('+~~~~~~~+~~~~~~~~~~~+~~~~+~~~~~~~~~+~~~~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~~+')
    fprintf('The Average Waiting Time is %5.3f\n', awt) 
    
    end
    
    if (serv == 3)
    disp('                                              +~~~~~~~~~~~~~~~~~~~~~~~~~~~+~~~~~~~~~~~~~~~~~~~~~~~~~~~+~~~~~~~~~~~~~~~~~~~~~~~~~~~+')
    disp('                                              |          SERVER 1         |           SERVER 2        |          SERVER 3         |')
    disp('+~~~~~~~+~~~~~~~~~~~+~~~~+~~~~~~~~~+~~~~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+')
    disp('|cust no|RN arrivals| IAT|Arrival T|RN service|TS begins|Service T|TS Ends|TS begins|Service T|TS Ends|TS begins|Service T|TS Ends|T in Queue|')
    disp('+~~~~~~~+~~~~~~~~~~~+~~~~+~~~~~~~~~+~~~~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+')
        
    i = 1;
    at = 0;
    tsb = 0;
    tse = 0;
    tse2 = 0;
    tse3 = 0;
    awt = 0;
    twt = 0;
    cwt = 0;
    fwt = 0;
    
    while ( i <= cus )
        
        rna = rand * 1000;
        while ((rna < 0) || (rna > 1000))
            rna = rand () * 1000;
        end
        if ( i == 1 )
            rna = '';
            iat = 0;
        end
        
        if ( (rna >= 1) && (rna <=125) )
            iat = 1;
        end
        if ( (rna >= 126) && (rna <=250) )
            iat = 2;
        end
        if ( (rna >= 251) && (rna <=375) )
            iat = 3;
        end
        if ( (rna >= 376) && (rna <=500) )
            iat = 4;
        end
        if ( (rna >= 501) && (rna <=625) )
            iat = 5;
        end
        if ( (rna >= 626) && (rna <=750) )
            iat = 6;
        end
        if ( (rna >= 751) && (rna <=875) )
            iat = 7;
        end
        if ( (rna >= 876) && (rna <=1000) )
            iat = 8;
        end
        
        at = at + iat;
        rns = rand * 100;
        while ((rns < 1) || (rns > 100))
            rns = rand () * 1000;
        end
        
        if((rns >= 1) && (rns <= 10))
            serviceT = 3 ; 
        end
        if((rns >= 11)&&(rns <= 30))
            serviceT = 4 ;
        end
        if((rns >= 31) && (rns <= 60))
            serviceT = 5 ; 
        end
        if((rns >= 61) && (rns <= 85))
            serviceT = 6 ; 
        end
        if((rns >= 86) && (rns <= 95))
            serviceT = 7 ; 
        end
        if((rns >= 96) && (rns <= 100))
            serviceT = 8 ; 
        end
        
        if ((at < tse) && (at < tse2))
            if (at < tse3) 
                tsb = at;                   % went back to 1st server beacuse 3rd server is busy
                tse = tsb + serviceT;
                tiq = tsb - at ;
                fprintf('|%7.0f|%11.0f|%4.0f|%9.0f|%10.0f|%9.0f|%9.0f|%7.0f|         |         |       |         |         |       |%10.0f|\n', i, rna, iat, at, rns, tsb, serviceT, tse, tiq)
            else
                tsb3 = at;                   % go to 3rd server
                serviceT3 = serviceT;
                tse3 = tsb3 + serviceT3;
                tiq = tsb3 - at; 
                fprintf('|%7.0f|%11.0f|%4.0f|%9.0f|%10.0f|         |         |       |         |         |       |%9.0f|%9.0f|%7.0f|%10.0f|\n', i, rna, iat, at, rns, tsb3, serviceT3, tse3, tiq)
            end
        end
        
        if ( at < tse ) % go to 2nd server
            tsb2 = at;
            serviceT2 = serviceT;
            tse2 = tsb2 + serviceT2;
            tiq = tsb2 - at; 
            fprintf('|%7.0f|%11.0f|%4.0f|%9.0f|%10.0f|         |         |       |%9.0f|%9.0f|%7.0f|         |         |       |%10.0f|\n', i, rna, iat, at, rns, tsb2, serviceT2, tse2, tiq)
        else
            tsb = at; % default for 1st server
            tse = tsb + serviceT;
            tiq = tsb - at ;
            fprintf('|%7.0f|%11.0f|%4.0f|%9.0f|%10.0f|%9.0f|%9.0f|%7.0f|         |         |       |         |         |       |%10.0f|\n', i, rna, iat, at, rns, tsb, serviceT, tse, tiq)
        end
        
        twt = twt + tiq;
        if ( twt == fwt )
            cwt = cwt;
        else
            cwt = cwt + 1;
        end
        i = i + 1;
        fwt = twt;
    end
   
    awt = twt / cwt;
    disp('+~~~~~~~+~~~~~~~~~~~+~~~~+~~~~~~~~~+~~~~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~+~~~~~~~~~+~~~~~~~+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+')
    fprintf('The Average Waiting Time is %5.3f\n', awt) 
    
    end
    