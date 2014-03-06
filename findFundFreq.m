function [ output ] = findFundFreq( path )
%FINDFUNDFREQ Summary of this function goes here
%   Detailed explanation goes here

[wave,fs] = wavread(path);
n = length(wave)-1;
f = 0:fs/n:fs;

wavedft = fft(wave);
subplot(211);plot(f, abs(wavedft));
ms20 = fs/50;
ms2 = fs/500;
d = (-ms20:ms20)/fs;
r = xcorr(wave, ms20, 'coeff');
subplot(212);plot(d, r);

fn = round(n/fs)

u= 15;

idx = find(real(wavedft)>u)/fn

fs 
n
% just look at region corresponding to positive delays
r=r(ms20+1:2*ms20+1);
[rmax,tx]=max(r(ms2:ms20))
fprintf('rmax=%g Fx=%gHz\n',rmax,fs/(ms2+tx-1));

output = idx(1);

end

