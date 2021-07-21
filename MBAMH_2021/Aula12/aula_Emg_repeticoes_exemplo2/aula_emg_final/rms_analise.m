# Author: paulo <paulo@DESKTOP-08T54RA>
## Created: 2021-07-14

function [] = rms_analise()
  pkg load io
  pkg load signal
  
  t1 = 40000;
  t2 = 50000;
  
  kg0 = load("kg0.txt");
  kg1 = load("kg1.txt");
  kg3 = load("kg3.txt");
  kg4 = load("kg4.txt");
  kg5 = load("kg5.txt");
  kg7 = load("kg7.txt");
  kg8 = load("kg8.txt");
  kg12 = load("kg12.txt");
  
  kg0c = kg0(t1:t2, :);
  kg1c = kg1(t1:t2, :);
  kg3c = kg3(t1:t2, :);
  kg4c = kg4(t1:t2, :);
  kg5c = kg5(t1:t2, :);
  kg7c = kg7(t1:t2, :);
  kg8c = kg8(t1:t2, :);
  kg12c = kg12(t1:t2, :);
  
  rms_kg0 = rms(kg0c);
  rms_kg1 = rms(kg1c);
  rms_kg3 = rms(kg3c);
  rms_kg4 = rms(kg4c);
  rms_kg5 = rms(kg5c);
  rms_kg7 = rms(kg7c);
  rms_kg8 = rms(kg8c);
  rms_kg12 = rms(kg12c);
  
  rms_all = [rms_kg0, rms_kg1, rms_kg3, rms_kg4, rms_kg5, rms_kg7, rms_kg8, rms_kg12] .* 1000000;
  close all
  bar(rms_all)
  esforcos = ['0 kg';'1 kg';'3 kg';'4 kg'; '5 kg'; '7 kg'; '8 kg'; '12 kg'];
  set(gca, 'XTickLabel', esforcos);
  xlabel("Tentativas")
  ylabel("RMS [micro Volts]")
  pause(5)
  saveas(1, "emg_rms.png");
end
