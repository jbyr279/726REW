close all;

cent_freq = [16, 31.5, 63, 125, 250, 500, 1000, 2000, 4000, 8000];
dB40 = [85, 74, 62, 54, 49, 45, 42, 38 ,35, 32];
room_a = [50.1, 39.7, 36.6, 32.9, 31.1, 30.9, 30.4, 31.5, 29.3, 29.4] - 2.3; 
room_b = [57.3, 45.4, 42.4, 38.4, 36.5, 37.9, 36.6, 37.6, 35.4, 34.9] - 2.3;

SIL_a = mean(room_a(6:9));
SIL_b = mean(room_b(6:9));

figure;
semilogx(cent_freq, dB40); axis square;
hold on;
semilogx(cent_freq, room_a);
semilogx(cent_freq, room_b);

xlim([10, 14e3]);
ylim([0, 100]);

xticks(cent_freq);

title("Room Octave Band NCB Check");
ylabel("SPL");
xlabel("Frequency (Hz)");

legend(["40 dB NCB Curve", "Room A", "Room B"]);