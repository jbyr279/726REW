close all;

cent_freq = [16, 31.5, 63, 125, 250, 500, 1000, 2000, 4000, 8000];
dB40 = [85, 74, 62, 54, 49, 45, 42, 38 ,35, 32];
room_a = [50, 40, 36.6, 32.8, 31, 31, 30.5, 31.6, 29.4, 29.6] - 2.3; 
room_b = [50.3, 39.9, 36.3, 32.8, 31, 31.1, 31, 31.6, 29.7, 29.9] - 2.3;

SIL_a = mean([30.5, 31.6, 29.4]);
SIL_b = mean([31.1, 31, 31.6, 29.7]);

figure;
semilogx(cent_freq, dB40); axis square;
hold on;
semilogx(cent_freq, room_a);
semilogx(cent_freq, room_b);

xlim([16, 8e3]);
ylim([0, 100]);

title("Room Octave Band NCB Check");
ylabel("SPL");
xlabel("Frequency (Hz)");

legend(["40 dB NCB Curve", "Room A", "Room B"]);