[Audio,Fs] = audioread("PianitoBonito1.mp3");

AudioMono = Audio(:,1);

SamplePeriod = 1/Fs;
TimesSamplefor10ms = .01/SamplePeriod;
MaxFreqSpectrum = Fs/2;
WindowSize = Fs/100; %Fs would correspond to 1 second for each slice, divide to have smaller slices
Spectrum = spectrogram(AudioMono,WindowSize,100,(Fs)-1,Fs,'yaxis')

[A,SpectrumTimeSize] = size(Spectrum);

FrequenciesOverTime = 1:SpectrumTimeSize;

for Index = 1:1:SpectrumTimeSize
    [Maximum,Location]= max(abs(Spectrum(:,Index)));
    if(Maximum > 5)
        FrequenciesOverTime(Index) = Location;
    else
        FrequenciesOverTime(Index) = 0;
    end
end
plot(FrequenciesOverTime)
[pks,locs] = findpeaks(abs(Spectrum(:,100)));
[SecondPks,LocSecond] = findpeaks(pks);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%frecuencias en Hz
% do4=261.626;
% re4=293.665;
% mi4=329.628;
% fa4=349.228;
% sol4=391.995;
% la4=440;
% si4=493.883;
% do5=523.251;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

formatSpec='Nota: %s\n';
for i= 1:1:SpectrumTimeSize
    switch(FrequenciesOverTime(i))
%         case num2cell(31:33)
%             note= 'do1';
%         case num2cell(34:35)
%             note= 'reb1';    
%         case num2cell(36:37)
%             note= 're1';
%         case num2cell(38:39)
%             note= 'mib1';    
%         case num2cell(40:42)
%             note= 'mi1';
%         case num2cell(43:44)
%             note= 'fa1';
%         case num2cell(45:47)
%             note= 'solb1';    
%         case num2cell(48:50)
%             note= 'sol1';
%         case num2cell(51:53)
%             note= 'lab1';    
%         case num2cell(54:56)
%             note= 'la1';
%         case num2cell(57:59)
%             note= 'sib1';    
%         case num2cell(60:62)
%             note='si1';
%         %%
%         case num2cell(63:66)
%             note= 'do2';
%         case num2cell(67:70)
%             note= 'reb2';    
%         case num2cell(71:75)
%             note= 're2';
%         case num2cell(76:80)
%             note= 'mib2';    
%         case num2cell(81:84)
%             note= 'mi2';
%         case num2cell(85:89)
%             note= 'fa2';
%         case num2cell(90:94)
%             note= 'solb2';    
%         case num2cell(95:100)
%             note= 'sol2';
%         case num2cell(101:106)
%             note= 'lab2';    
%         case num2cell(107:112)
%             note= 'la2';
%         case num2cell(113:119)
%             note= 'sib2';    
%         case num2cell(120:126)
%             note='si2';
%         %%
%         case num2cell(127:133)
%             note= 'do3';
%         case num2cell(134:142)
%             note= 'reb3';    
%         case num2cell(143:150)
%             note= 're3';
%         case num2cell(151:159)
%             note= 'mib3';    
%         case num2cell(160:169)
%             note= 'mi3';
%         case num2cell(170:179)
%             note= 'fa3';
%         case num2cell(180:189)
%             note= 'solb3';    
%         case num2cell(190:200)
%             note= 'sol3';
%         case num2cell(201:212)
%             note= 'lab3';    
%         case num2cell(213:227)
%             note= 'la3';
%         case num2cell(228:240)
%             note= 'sib31';    
%         case num2cell(241:251)
%             note='si3';
            %%
        case num2cell(256:266)
            note= 'do4';
        case num2cell(272:282)
            note= 'reb4';    
        case num2cell(288:298)
            note= 're4';
        case num2cell(306:316)
            note= 'mib4';    
        case num2cell(324:334)
            note= 'mi4';
        case num2cell(344:354)
            note= 'fa4';
        case num2cell(364:374)
            note= 'solb4';    
        case num2cell(386:396)
            note= 'sol4';
        case num2cell(410:420)
            note= 'lab4';    
        case num2cell(435:445)
            note= 'la4';
        case num2cell(465:475)
            note= 'sib4';    
        case num2cell(488:498)
            note='si4';
            %%
        case num2cell(517:529)
            note= 'do5';
%         case num2cell(548:560)
%             note= 'reb5';    
%         case num2cell(581:593)
%             note= 're5';
%         case num2cell(616:628)
%             note= 'mib5';    
%         case num2cell(653:665)
%             note= 'mi5';
%         case num2cell(692:704)
%             note= 'fa5';
%         case num2cell(733:745)
%             note= 'solb5';    
%         case num2cell(777:789)
%             note= 'sol5';
%         case num2cell(824:836)
%             note= 'lab5';    
%         case num2cell(874:886)
%             note= 'la5';
%         case num2cell(926:938)
%             note= 'sib5';    
%         case num2cell(981:993)
%             note='si5';
%             %%
%         case num2cell(1040:1052)
%             note= 'do6';
%         case num2cell(1102:1114)
%             note= 'reb6';    
%         case num2cell(1168:1180)
%             note= 're6';
%         case num2cell(1238:1250)
%             note= 'mib6';    
%         case num2cell(1312:1324)
%             note= 'mi6';
%         case num2cell(1390:1402)
%             note= 'fa6';
%         case num2cell(1473:1485)
%             note= 'solb6';    
%         case num2cell(1561:1573)
%             note= 'sol6';
%         case num2cell(1655:1667)
%             note= 'lab6';    
%         case num2cell(1754:1766)
%             note= 'la6';
%         case num2cell(1858:1870)
%             note= 'sib6';    
%         case num2cell(1969:1981)
%             note='si6';
            %%
%         case num2cell(2086:2100)
%             note= 'do7';
%         case num2cell(2210:2224)
%             note= 'reb7';    
%         case num2cell(2342:2356)
%             note= 're7';
%         case num2cell(2482:2496)
%             note= 'mib7';    
%         case num2cell(2630:2644)
%             note= 'mi7';
%         case num2cell(2786:2800)
%             note= 'fa7';
%         case num2cell(2952:2966)
%             note= 'solb7';    
%         case num2cell(3128:3142)
%             note= 'sol7';
%         case num2cell(3315:3329)
%             note= 'lab7';    
%         case num2cell(3513:3527)
%             note= 'la7';
%         case num2cell(3722:3736)
%             note= 'sib7';    
%         case num2cell(3944:3958)
%             note='si7';
        otherwise
            note='none';
    end
    fprintf(formatSpec,note)
end