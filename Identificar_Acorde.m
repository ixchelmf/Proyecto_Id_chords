clc;
clear all; close all;

[Audio,Fs] = audioread("Resuschord4.mp3");

AudioMono = Audio(:,1);
y=abs(fft(AudioMono));

f1=linspace(0,Fs,length(AudioMono));
for Index=1:1:length(AudioMono)
    if(y(Index)<2000)
       y(Index)=0;
    end   
end  
i1=0;
for I=1:1:length(AudioMono)
    if(y(I)>0)
        i1=i1+1;
       ffm(i1)=f1(I);
    end   
end

% for I=1:1:length(AudioMono)
%     if(y(I)>0)
%         i1=i1+1;
%        ffm(i1)=f1(I);
%     end   
% end
figure
findpeaks(y,f1)
ylabel('magnitud de la señal')
xlabel('frecuencia')
title('picos de la FFT(filtrada) de la señal de audio')
grid on


%%Valores de notas escala 4 y 5%%%%%%%%%%%%
do4=    261.626;
dos4=   277.183;
re4=    293.665;
res4=   311.127;
mi4=    329.628;
fa4=    349.228;
fas4=   369.994;
sol4=   391.995;
sols4=   415.305;
la4=    440;
las4=   466.164;
si4=    493.883;
do5=    523.251;
dos5=   554.365;
re5=    587.33;
res5=   622.254;
mi5=    659.255;
fa5=    698.456;
fas5=   739.989;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Acorde=[0 0 0];
Acorde(1)=ffm(1);
for i=1:1:length(ffm)
   if(ffm(i)>Acorde(1)-2&&ffm(i)<Acorde(1)+2) 
      Acorde(1)=(Acorde(1)+ffm(i))/2;
   else
      a=i;
      break
   end
end
Acorde(2)=ffm(a);
for i=a:1:length(ffm)
   if(ffm(i)>Acorde(2)-2&&ffm(i)<Acorde(2)+2) 
      Acorde(2)=(Acorde(2)+ffm(i))/2;
   else
      a=i;
      break
   end
end
Acorde(3)=ffm(a);
for i=a:1:length(ffm)
   if(ffm(i)>Acorde(3)-2&&ffm(i)<Acorde(3)+2) 
      Acorde(3)=(Acorde(3)+ffm(i))/2;
   else
      a=i;
      break
   end
end
formatSpec='Acorde: %s\n';

if(Acorde(1)>do4-2&&Acorde(1)<do4+2)
    if(Acorde(2)>mi4-2&&Acorde(2)<mi4+2)
        if(Acorde(3)>sol4-2&&Acorde(3)<sol4+2)
            chord= 'Do mayor 4';
        end
    end
elseif(Acorde(1)>dos4-2&&Acorde(1)<dos4+2)
    if(Acorde(2)>fa4-2&&Acorde(2)<fa4+2)
        if(Acorde(3)>sols4-2&&Acorde(3)<sols4+2)
            chord= 'Do sostenido mayor 4';
        end
    end
elseif(Acorde(1)>re4-2&&Acorde(1)<re4+2)
    if(Acorde(2)>fas4-2&&Acorde(2)<fas4+2)
        if(Acorde(3)>la4-2&&Acorde(3)<la4+2)
            chord= 'Re mayor 4';
        end
    end
elseif(Acorde(1)>res4-2&&Acorde(1)<res4+2)
    if(Acorde(2)>sol4-2&&Acorde(2)<sol4+2)
        if(Acorde(3)>las4-2&&Acorde(3)<las4+2)
            chord= 'Re sostenido mayor 4';
        end
    end
elseif(Acorde(1)>mi4-2&&Acorde(1)<mi4+2)
    if(Acorde(2)>sols4-2&&Acorde(2)<sols4+2)
        if(Acorde(3)>si4-2&&Acorde(3)<si4+2)
            chord= 'Mi mayor 4';
        end
    end
elseif(Acorde(1)>fa4-2&&Acorde(1)<fa4+2)
    if(Acorde(2)>la4-2&&Acorde(2)<la4+2)
        if(Acorde(3)>do5-2&&Acorde(3)<do5+2)
            chord= 'Fa mayor 4';
        end
    end
elseif(Acorde(1)>fas4-2&&Acorde(1)<fas4+2)
    if(Acorde(2)>las4-2&&Acorde(2)<las4+2)
        if(Acorde(3)>dos5-2&&Acorde(3)<dos5+2)
            chord= 'Fa sostenido mayor 4';
        end
    end
elseif(Acorde(1)>sol4-2&&Acorde(1)<sol4+2)
    if(Acorde(2)>si4-2&&Acorde(2)<si4+2)
        if(Acorde(3)>re5-2&&Acorde(3)<re5+2)
            chord= 'Sol mayor 4';
        end
    end
elseif(Acorde(1)>sols4-2&&Acorde(1)<sols4+2)
    if(Acorde(2)>do5-2&&Acorde(2)<do5+2)
        if(Acorde(3)>re5-2&&Acorde(3)<re5+2)
            chord= 'Sol sostenido mayor 4';
        end
    end
elseif(Acorde(1)>la4-2&&Acorde(1)<la4+2)
    if(Acorde(2)>dos5-2&&Acorde(2)<dos5+2)
        if(Acorde(3)>mi5-2&&Acorde(3)<mi5+2)
            chord= 'La mayor 4';
        end
    end
elseif(Acorde(1)>las4-2&&Acorde(1)<las4+2)
    if(Acorde(2)>re5-2&&Acorde(2)<re5+2)
        if(Acorde(3)>fa5-2&&Acorde(3)<fa5+2)
            chord= 'La sostenido mayor 4';
        end
    end
elseif(Acorde(1)>si4-2&&Acorde(1)<si4+2)
    if(Acorde(2)>res5-2&&Acorde(2)<res5+2)
        if(Acorde(3)>fas5-2&&Acorde(3)<fas5+2)
            chord= 'Si mayor 4';
        end
    end
else
    chord= 'none';
end
fprintf(formatSpec,chord)

